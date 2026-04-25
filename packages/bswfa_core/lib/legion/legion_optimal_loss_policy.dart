import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_change.dart';
import 'package:bswfa_core/legion/legion_resolution.dart';
import 'package:bswfa_core/legion/named_leader_loss_selection_policy.dart';

enum _LossOption {
  removeGenericLeader,
  removeRegularUnit,
  downgradeEliteUnit,
  downgradeSpecialEliteUnit,
  removeNamedLeader,
}

class LegionOptimalLoss {
  const LegionOptimalLoss._();

  /// Calcula la mejor resolución para aplicar una única baja.
  static LegionResolution calculateOptimalLoss(Legion legion) {
    final Map<_LossOption, LegionResolution?> options =
        <_LossOption, LegionResolution?>{
          _LossOption.removeGenericLeader: legion.genericLeaders == 0
              ? null
              : const LegionResolution(
                  changes: <LegionChange>[LegionChange.removeGenericLeader()],
                ),
          _LossOption.removeRegularUnit: legion.regularUnits == 0
              ? null
              : const LegionResolution(
                  changes: <LegionChange>[LegionChange.removeRegularUnit()],
                ),
          _LossOption.downgradeEliteUnit: legion.eliteUnits == 0
              ? null
              : const LegionResolution(
                  changes: <LegionChange>[LegionChange.downgradeEliteUnit()],
                ),
          _LossOption.downgradeSpecialEliteUnit: legion.specialEliteUnits == 0
              ? null
              : const LegionResolution(
                  changes: <LegionChange>[
                    LegionChange.downgradeSpecialEliteUnit(),
                  ],
                ),
          _LossOption.removeNamedLeader: legion.namedLeaders.isEmpty
              ? null
              : LegionResolution(
                  changes: <LegionChange>[
                    LegionChange.removeNamedLeader(
                      leader: NamedLeaderLossSelectionPolicy.selectLeaderToLose(
                        legion.namedLeaders,
                      ),
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
      case _LossOption.removeGenericLeader:
        return legion.genericLeaders > 0 &&
            legion.totalLeaders > legion.diceCount;

      case _LossOption.downgradeEliteUnit:
        return selectedEntry.key != _LossOption.downgradeEliteUnit;

      case _LossOption.downgradeSpecialEliteUnit:
        return selectedEntry.key != _LossOption.downgradeEliteUnit &&
            selectedEntry.key != _LossOption.downgradeSpecialEliteUnit;

      case _LossOption.removeNamedLeader:
        return legion.totalUnits == 1 ||
            selectedEntry.key != _LossOption.removeRegularUnit;

      case _LossOption.removeRegularUnit:
        return selectedEntry.key != _LossOption.removeRegularUnit;
    }
  }
}
