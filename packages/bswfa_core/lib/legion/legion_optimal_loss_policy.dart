import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_change.dart';
import 'package:bswfa_core/legion/legion_resolution.dart';
import 'package:bswfa_core/legion/named_leader.dart';

class LegionOptimalLossPolicy {
  const LegionOptimalLossPolicy._();

  static const double _genericLeaderWeight = 1.129;
  static const double _regularUnitWeight = 1.000;
  static const double _eliteUnitWeight = 1.685;
  static const double _specialEliteUnitWeight = 2.148;
  static const double _namedLeaderAttackWeight = 0.573;
  static const double _namedLeaderDefenseWeight = 0.576;
  static const double _diceCountWeight = 0.165;
  static const double _lossCapacityWeight = 0.540;

  /// Calcula la mejor resolución heurística para aplicar una única baja.
  ///
  /// La política conserva la legión que queda con mayor valor táctico estimado.
  /// Estos pesos se calibraron offline contra continuaciones exactas
  /// multi-ronda, usando `tool/evaluate_loss_policy_oracle.dart`.
  static LegionResolution selectOptimalLoss(Legion legion) {
    LegionResolution selectedResolution = const LegionResolution();
    double? selectedScore;

    for (final LegionResolution resolution in _buildLegalLosses(legion)) {
      final Legion candidate = resolution.applyTo(legion);
      final double candidateScore = _scoreRemainingLegion(candidate);

      if (selectedScore == null ||
          candidateScore > selectedScore ||
          (candidateScore == selectedScore &&
              _shouldPreferForStableTieBreak(resolution, selectedResolution))) {
        selectedResolution = resolution;
        selectedScore = candidateScore;
      }
    }

    return selectedResolution;
  }

  static Iterable<LegionResolution> _buildLegalLosses(Legion legion) sync* {
    if (legion.genericLeaders > 0) {
      yield const LegionResolution(
        appliedChanges: <LegionChange>[LegionChange.removeGenericLeader()],
      );
    }
    if (legion.regularUnits > 0) {
      yield const LegionResolution(
        appliedChanges: <LegionChange>[LegionChange.removeRegularUnit()],
      );
    }
    if (legion.eliteUnits > 0) {
      yield const LegionResolution(
        appliedChanges: <LegionChange>[LegionChange.downgradeEliteUnit()],
      );
    }
    if (legion.specialEliteUnits > 0) {
      yield const LegionResolution(
        appliedChanges: <LegionChange>[
          LegionChange.downgradeSpecialEliteUnit(),
        ],
      );
    }
    for (final NamedLeader leader in legion.namedLeaders) {
      yield LegionResolution(
        appliedChanges: <LegionChange>[
          LegionChange.removeNamedLeader(leader: leader),
        ],
      );
    }
  }

  static double _scoreRemainingLegion(Legion legion) {
    if (legion.totalUnits == 0) {
      return 0;
    }

    final int namedAttack = legion.namedLeaders.fold(
      0,
      (int total, NamedLeader leader) => total + leader.attack,
    );
    final int namedDefense = legion.namedLeaders.fold(
      0,
      (int total, NamedLeader leader) => total + leader.defense,
    );

    return legion.genericLeaders * _genericLeaderWeight +
        legion.regularUnits * _regularUnitWeight +
        legion.eliteUnits * _eliteUnitWeight +
        legion.specialEliteUnits * _specialEliteUnitWeight +
        namedAttack * _namedLeaderAttackWeight +
        namedDefense * _namedLeaderDefenseWeight +
        legion.diceCount * _diceCountWeight +
        legion.remainingLossCapacity * _lossCapacityWeight;
  }

  static bool _shouldPreferForStableTieBreak(
    LegionResolution candidate,
    LegionResolution selected,
  ) {
    final int candidatePriority = _resolutionPriority(candidate);
    final int selectedPriority = _resolutionPriority(selected);
    if (candidatePriority != selectedPriority) {
      return candidatePriority < selectedPriority;
    }

    return _resolutionLossWeight(candidate) < _resolutionLossWeight(selected);
  }

  static int _resolutionPriority(LegionResolution resolution) {
    final LegionChange? change = resolution.appliedChanges.firstOrNull;
    return change?.map(
          removeGenericLeader: (_) => 0,
          removeRegularUnit: (_) => 1,
          downgradeEliteUnit: (_) => 2,
          downgradeSpecialEliteUnit: (_) => 3,
          removeNamedLeader: (_) => 4,
        ) ??
        5;
  }

  static double _resolutionLossWeight(LegionResolution resolution) {
    final LegionChange? change = resolution.appliedChanges.firstOrNull;
    return change?.map(
          removeGenericLeader: (_) => _genericLeaderWeight,
          removeRegularUnit: (_) => _regularUnitWeight,
          downgradeEliteUnit: (_) => _eliteUnitWeight - _regularUnitWeight,
          downgradeSpecialEliteUnit: (_) =>
              _specialEliteUnitWeight - _regularUnitWeight,
          removeNamedLeader: (RemoveNamedLeader change) =>
              (change.leader.attack * _namedLeaderAttackWeight) +
              (change.leader.defense * _namedLeaderDefenseWeight),
        ) ??
        double.infinity;
  }
}
