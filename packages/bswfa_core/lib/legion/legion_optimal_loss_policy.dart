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

class LegionOptimalLossPolicy {
  const LegionOptimalLossPolicy._();

  /// Calcula la mejor resolución para aplicar una única baja.
  static LegionResolution selectOptimalLoss(Legion legion) {
    final Map<_LossOption, LegionResolution?> options =
        <_LossOption, LegionResolution?>{
          _LossOption.removeGenericLeader: legion.genericLeaders == 0
              ? null
              : const LegionResolution(
                  appliedChanges: <LegionChange>[LegionChange.removeGenericLeader()],
                ),
          _LossOption.removeRegularUnit: legion.regularUnits == 0
              ? null
              : const LegionResolution(
                  appliedChanges: <LegionChange>[LegionChange.removeRegularUnit()],
                ),
          _LossOption.downgradeEliteUnit: legion.eliteUnits == 0
              ? null
              : const LegionResolution(
                  appliedChanges: <LegionChange>[LegionChange.downgradeEliteUnit()],
                ),
          _LossOption.downgradeSpecialEliteUnit: legion.specialEliteUnits == 0
              ? null
              : const LegionResolution(
                  appliedChanges: <LegionChange>[
                    LegionChange.downgradeSpecialEliteUnit(),
                  ],
                ),
          _LossOption.removeNamedLeader: legion.namedLeaders.isEmpty
              ? null
              : LegionResolution(
                  appliedChanges: <LegionChange>[
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
        return _shouldPreferRemovingGenericLeader(legion);

      case _LossOption.downgradeEliteUnit:
        return _shouldPreferDowngradingEliteUnit(selectedEntry.key);

      case _LossOption.downgradeSpecialEliteUnit:
        return _shouldPreferDowngradingSpecialEliteUnit(selectedEntry.key);

      case _LossOption.removeNamedLeader:
        return _shouldPreferRemovingNamedLeader(
          legion: legion,
          selectedLossOption: selectedEntry.key,
        );

      case _LossOption.removeRegularUnit:
        return _shouldPreferRemovingRegularUnit(selectedEntry.key);
    }
  }

  /// Si sobran líderes respecto al máximo de dados, sacrificar un líder genérico
  /// puede preservar la pegada igual que otras opciones sin perder unidades.
  static bool _shouldPreferRemovingGenericLeader(Legion legion) {
    return legion.genericLeaders > 0 && legion.totalLeaders > legion.diceCount;
  }

  /// Entre opciones equivalentes, degradar una élite normal se prioriza frente
  /// a cualquier opción distinta de esa misma degradación.
  static bool _shouldPreferDowngradingEliteUnit(
    _LossOption selectedLossOption,
  ) {
    return selectedLossOption != _LossOption.downgradeEliteUnit;
  }

  /// La degradación de élite especial solo se prefiere si no se ha elegido ya
  /// degradar una élite normal ni otra élite especial.
  static bool _shouldPreferDowngradingSpecialEliteUnit(
    _LossOption selectedLossOption,
  ) {
    return selectedLossOption != _LossOption.downgradeEliteUnit &&
        selectedLossOption != _LossOption.downgradeSpecialEliteUnit;
  }

  /// Perder un líder nombrado solo se prioriza cuando apenas quedan unidades
  /// combatientes o cuando la alternativa actual no es perder una regular.
  static bool _shouldPreferRemovingNamedLeader({
    required Legion legion,
    required _LossOption selectedLossOption,
  }) {
    return legion.totalUnits == 1 ||
        selectedLossOption != _LossOption.removeRegularUnit;
  }

  /// Perder una unidad regular se prioriza sobre cualquier opción distinta de
  /// perder otra unidad regular.
  static bool _shouldPreferRemovingRegularUnit(_LossOption selectedLossOption) {
    return selectedLossOption != _LossOption.removeRegularUnit;
  }
}
