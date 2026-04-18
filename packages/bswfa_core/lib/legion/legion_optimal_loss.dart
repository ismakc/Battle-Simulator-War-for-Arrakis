import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_change.dart';
import 'package:bswfa_core/legion/legion_resolution.dart';
import 'package:bswfa_core/legion/named_leader.dart';

enum _LossOption {
  minusLeader,
  minusRegular,
  minusElite,
  minusSpecial,
  minusNamed,
}

class LegionOptimalLoss {
  const LegionOptimalLoss._();

  /// Calcula la mejor resolución para aplicar una única baja.
  static LegionResolution calculateOptimalLoss(Legion legion) {
    final Map<_LossOption, LegionResolution?> options =
        <_LossOption, LegionResolution?>{
          _LossOption.minusLeader: legion.genericLeaders == 0
              ? null
              : const LegionResolution(
                  changes: <LegionChange>[LegionChange.removeGenericLeader()],
                ),
          _LossOption.minusRegular: legion.regularUnits == 0
              ? null
              : const LegionResolution(
                  changes: <LegionChange>[LegionChange.removeRegularUnit()],
                ),
          _LossOption.minusElite: legion.eliteUnits == 0
              ? null
              : const LegionResolution(
                  changes: <LegionChange>[LegionChange.downgradeEliteUnit()],
                ),
          _LossOption.minusSpecial: legion.specialEliteUnits == 0
              ? null
              : const LegionResolution(
                  changes: <LegionChange>[
                    LegionChange.downgradeSpecialEliteUnit(),
                  ],
                ),
          _LossOption.minusNamed: legion.namedLeaders.isEmpty
              ? null
              : LegionResolution(
                  changes: <LegionChange>[
                    LegionChange.removeNamedLeader(
                      leader: _selectNamedLeaderToLose(legion.namedLeaders),
                    ),
                  ],
                ),
        };

    MapEntry<_LossOption, LegionResolution?>? selectedEntry;
    int? bestDiceCount;

    for (final MapEntry<_LossOption, LegionResolution?> entry
        in options.entries) {
      final LegionResolution? resolution = entry.value;
      if (resolution == null) {
        continue;
      }

      final Legion candidate = resolution.applyTo(legion);
      final int candidateDiceCount = candidate.diceCount;

      final bool shouldUpdate =
          bestDiceCount == null ||
          candidateDiceCount > bestDiceCount ||
          (candidateDiceCount == bestDiceCount &&
              _shouldReplaceSelectedEntry(
                legion: legion,
                selectedEntry: selectedEntry,
                candidateEntry: entry,
              ));

      if (shouldUpdate) {
        selectedEntry = entry;
        bestDiceCount = candidateDiceCount;
      }
    }

    return selectedEntry?.value ?? const LegionResolution();
  }

  static NamedLeader _selectNamedLeaderToLose(List<NamedLeader> leaders) {
    final List<NamedLeader> sorted = List<NamedLeader>.from(leaders)
      ..sort(
        (NamedLeader a, NamedLeader b) => b.attack != a.attack
            ? b.attack.compareTo(a.attack)
            : b.defense.compareTo(a.defense),
      );

    return sorted.last;
  }

  /// Regla de desempate cuando varias resoluciones preservan el mismo `diceCount`.
  static bool _shouldReplaceSelectedEntry({
    required Legion legion,
    required MapEntry<_LossOption, LegionResolution?>? selectedEntry,
    required MapEntry<_LossOption, LegionResolution?> candidateEntry,
  }) {
    if (selectedEntry == null) {
      return true;
    }

    switch (candidateEntry.key) {
      case _LossOption.minusLeader:
        return legion.genericLeaders > 0 &&
            legion.totalLeaders > legion.diceCount;

      case _LossOption.minusElite:
        return selectedEntry.key != _LossOption.minusElite;

      case _LossOption.minusSpecial:
        return selectedEntry.key != _LossOption.minusElite &&
            selectedEntry.key != _LossOption.minusSpecial;

      case _LossOption.minusNamed:
        return legion.totalUnits == 1 ||
            selectedEntry.key != _LossOption.minusRegular;

      case _LossOption.minusRegular:
        return selectedEntry.key != _LossOption.minusRegular;
    }
  }
}
