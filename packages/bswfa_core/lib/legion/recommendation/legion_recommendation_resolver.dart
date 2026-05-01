import 'dart:math' as math;

import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution_resolver.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_limits.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_constraints.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_cost_policy.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_request.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_role.dart';

class LegionRecommendationResolver {
  const LegionRecommendationResolver({
    this.battleDistributionResolver = const BattleDistributionResolver(),
  });

  final BattleDistributionResolver battleDistributionResolver;

  List<LegionRecommendation> resolve(LegionRecommendationRequest request) {
    _validateRequest(request);

    final List<Legion> candidateLegions = _selectCandidateLegionsToEvaluate(
      request,
    );

    final List<LegionRecommendation> recommendations = candidateLegions.map((
      Legion candidateLegion,
    ) {
      final BattleScenario scenario = _buildScenario(request, candidateLegion);
      final BattleDistribution distribution = battleDistributionResolver
          .resolve(initialScenario: scenario, maxRounds: request.maxRounds);
      final double ownWinProbability = _ownWinProbability(
        request.ownRole,
        distribution,
      );
      final double ownLoseProbability = _ownLoseProbability(
        request.ownRole,
        distribution,
      );
      final double cost = LegionRecommendationCostPolicy.calculate(
        candidateLegion,
      );

      return LegionRecommendation(
        legion: candidateLegion,
        distribution: distribution,
        ownWinProbability: ownWinProbability,
        ownLoseProbability: ownLoseProbability,
        cost: cost,
        score: _calculateScore(
          ownWinProbability: ownWinProbability,
          ownLoseProbability: ownLoseProbability,
          cost: cost,
          distribution: distribution,
        ),
        meetsTarget: ownWinProbability >= request.targetWinProbability,
      );
    }).toList();

    recommendations.sort(_compareRecommendations);

    final List<LegionRecommendation> viableRecommendations = recommendations
        .where(
          (LegionRecommendation recommendation) => recommendation.meetsTarget,
        )
        .toList();
    final List<LegionRecommendation> selectedRecommendations =
        viableRecommendations.isEmpty ? recommendations : viableRecommendations;
    final int limit = math.min(3, request.limit);

    return selectedRecommendations.take(limit).toList(growable: false);
  }

  List<Legion> _selectCandidateLegionsToEvaluate(
    LegionRecommendationRequest request,
  ) {
    final int maxCandidates = request.maxEvaluatedCandidates;
    final double enemyBattleValue =
        LegionRecommendationCostPolicy.calculateSearchBattleValue(
          request.enemyLegion,
        );
    final List<_CandidateEvaluationData> selectedCandidates =
        <_CandidateEvaluationData>[];

    for (final _CandidateEvaluationData candidateData
        in _buildCandidateEvaluationData(request)) {
      _insertCandidateInTopSelection(
        selectedCandidates,
        candidateData,
        maxCandidates: maxCandidates,
        compare:
            (_CandidateEvaluationData left, _CandidateEvaluationData right) =>
                _compareCandidateLegions(
                  request,
                  enemyBattleValue,
                  left,
                  right,
                ),
      );
    }

    return selectedCandidates
        .map((_CandidateEvaluationData candidateData) => candidateData.legion)
        .toList(growable: false);
  }

  List<_CandidateEvaluationData> _buildCandidateEvaluationData(
    LegionRecommendationRequest request,
  ) {
    return <_CandidateEvaluationData>[
      for (final Legion legion in _buildCandidateLegions(request))
        _CandidateEvaluationData(
          legion: legion,
          cost: LegionRecommendationCostPolicy.calculate(legion),
          battleValue:
              LegionRecommendationCostPolicy.calculateSearchBattleValue(legion),
          estimatedStrength: _estimateCandidateStrength(request, legion),
        ),
    ];
  }

  Iterable<Legion> _buildCandidateLegions(
    LegionRecommendationRequest request,
  ) sync* {
    final LegionRecommendationConstraints constraints = request.constraints;
    final int maxRegularUnits = _clampMax(
      constraints.maxRegularUnits,
      LegionLimits.maxUnitsPerType,
    );
    final int maxEliteUnits = _clampMax(
      constraints.maxEliteUnits,
      LegionLimits.maxUnitsPerType,
    );
    final int maxSpecialEliteUnits = _clampMax(
      constraints.maxSpecialEliteUnits,
      LegionLimits.maxUnitsPerType,
    );
    final int maxGenericLeaders = _clampMax(
      constraints.maxGenericLeaders,
      LegionLimits.maxLeaders,
    );
    final List<bool> surpriseAttackOptions =
        request.ownRole == LegionRecommendationRole.attacker &&
            constraints.allowSurpriseAttack
        ? <bool>[false, true]
        : <bool>[false];

    for (
      int regularUnits = 0;
      regularUnits <= maxRegularUnits;
      regularUnits++
    ) {
      for (int eliteUnits = 0; eliteUnits <= maxEliteUnits; eliteUnits++) {
        for (
          int specialEliteUnits = 0;
          specialEliteUnits <= maxSpecialEliteUnits;
          specialEliteUnits++
        ) {
          final int totalUnits = regularUnits + eliteUnits + specialEliteUnits;
          if (totalUnits == 0 || totalUnits > LegionLimits.maxUnitsAndCards) {
            continue;
          }

          for (
            int genericLeaders = 0;
            genericLeaders <= maxGenericLeaders;
            genericLeaders++
          ) {
            for (final bool surpriseAttack in surpriseAttackOptions) {
              yield switch (request.ownRole) {
                LegionRecommendationRole.attacker => AttackingLegion(
                  genericLeaders: genericLeaders,
                  regularUnits: regularUnits,
                  eliteUnits: eliteUnits,
                  specialEliteUnits: specialEliteUnits,
                  usedCards: 0,
                  surpriseAttack: surpriseAttack,
                ),
                LegionRecommendationRole.defender => DefendingLegion(
                  genericLeaders: genericLeaders,
                  regularUnits: regularUnits,
                  eliteUnits: eliteUnits,
                  specialEliteUnits: specialEliteUnits,
                  usedCards: 0,
                  settlementLevel: _clampMax(
                    constraints.settlementLevel,
                    LegionLimits.maxSettlementLevel,
                  ),
                ),
              };
            }
          }
        }
      }
    }
  }

  BattleScenario _buildScenario(
    LegionRecommendationRequest request,
    Legion candidateLegion,
  ) {
    return switch (request.ownRole) {
      LegionRecommendationRole.attacker => BattleScenario(
        attackingLegion: candidateLegion as AttackingLegion,
        defendingLegion: request.enemyLegion as DefendingLegion,
      ),
      LegionRecommendationRole.defender => BattleScenario(
        attackingLegion: request.enemyLegion as AttackingLegion,
        defendingLegion: candidateLegion as DefendingLegion,
      ),
    };
  }

  double _ownWinProbability(
    LegionRecommendationRole role,
    BattleDistribution distribution,
  ) {
    return switch (role) {
      LegionRecommendationRole.attacker => distribution.attackerWinProbability,
      LegionRecommendationRole.defender => distribution.defenderWinProbability,
    };
  }

  double _ownLoseProbability(
    LegionRecommendationRole role,
    BattleDistribution distribution,
  ) {
    return switch (role) {
      LegionRecommendationRole.attacker => distribution.defenderWinProbability,
      LegionRecommendationRole.defender => distribution.attackerWinProbability,
    };
  }

  double _calculateScore({
    required double ownWinProbability,
    required double ownLoseProbability,
    required double cost,
    required BattleDistribution distribution,
  }) {
    return ownWinProbability -
        ownLoseProbability -
        (cost * 0.001) +
        (distribution.resolvedProbability * 0.0001);
  }

  int _compareCandidateLegions(
    LegionRecommendationRequest request,
    double enemyBattleValue,
    _CandidateEvaluationData left,
    _CandidateEvaluationData right,
  ) {
    return _compareByFields(<int>[
      _compareDoubleAscending(
        _battleValueDistance(left.battleValue, enemyBattleValue),
        _battleValueDistance(right.battleValue, enemyBattleValue),
      ),
      _compareDoubleDescending(left.estimatedStrength, right.estimatedStrength),
      _compareDoubleAscending(left.cost, right.cost),
      _compareIntAscending(
        left.legion.totalUnits + left.legion.totalLeaders,
        right.legion.totalUnits + right.legion.totalLeaders,
      ),
    ]);
  }

  double _battleValueDistance(double battleValue, double targetBattleValue) {
    return (battleValue - targetBattleValue).abs();
  }

  double _estimateCandidateStrength(
    LegionRecommendationRequest request,
    Legion legion,
  ) {
    final double attackBonus = legion.genericLeaders * 0.35;
    final double defenseBonus = legion.remainingLossCapacity * 0.25;
    final double diceBonus = legion.diceCount * 1.5;
    final double specialEliteBonus = legion.specialEliteUnits * 0.5;
    final double surpriseAttackBonus =
        request.ownRole == LegionRecommendationRole.attacker &&
            (legion as AttackingLegion).surpriseAttack
        ? 0.2
        : 0;

    return diceBonus +
        attackBonus +
        defenseBonus +
        specialEliteBonus +
        surpriseAttackBonus;
  }

  int _compareRecommendations(
    LegionRecommendation left,
    LegionRecommendation right,
  ) {
    return _compareByFields(<int>[
      _compareDoubleDescending(left.ownWinProbability, right.ownWinProbability),
      _compareDoubleAscending(
        left.ownLoseProbability,
        right.ownLoseProbability,
      ),
      _compareDoubleAscending(left.cost, right.cost),
      _compareIntAscending(
        left.legion.totalUnits + left.legion.totalLeaders,
        right.legion.totalUnits + right.legion.totalLeaders,
      ),
      _compareDoubleDescending(
        left.distribution.resolvedProbability,
        right.distribution.resolvedProbability,
      ),
    ]);
  }

  int _compareByFields(List<int> comparisons) {
    for (final int comparison in comparisons) {
      if (comparison != 0) {
        return comparison;
      }
    }

    return 0;
  }

  int _compareDoubleDescending(double left, double right) {
    return right.compareTo(left);
  }

  int _compareDoubleAscending(double left, double right) {
    return left.compareTo(right);
  }

  int _compareIntAscending(int left, int right) {
    return left.compareTo(right);
  }

  void _insertCandidateInTopSelection(
    List<_CandidateEvaluationData> selectedCandidates,
    _CandidateEvaluationData candidateData, {
    required int maxCandidates,
    required int Function(
      _CandidateEvaluationData left,
      _CandidateEvaluationData right,
    )
    compare,
  }) {
    if (selectedCandidates.isEmpty) {
      selectedCandidates.add(candidateData);
      return;
    }

    if (selectedCandidates.length == maxCandidates &&
        compare(candidateData, selectedCandidates.last) >= 0) {
      return;
    }

    int insertIndex = selectedCandidates.length;
    for (int index = 0; index < selectedCandidates.length; index++) {
      if (compare(candidateData, selectedCandidates[index]) < 0) {
        insertIndex = index;
        break;
      }
    }

    selectedCandidates.insert(insertIndex, candidateData);

    if (selectedCandidates.length > maxCandidates) {
      selectedCandidates.removeLast();
    }
  }

  int _clampMax(int value, int maxValue) {
    return math.max(0, math.min(value, maxValue));
  }

  void _validateRequest(LegionRecommendationRequest request) {
    if (request.maxRounds < 0) {
      throw ArgumentError.value(
        request.maxRounds,
        'maxRounds',
        'maxRounds cannot be negative.',
      );
    }
    if (request.limit <= 0) {
      throw ArgumentError.value(
        request.limit,
        'limit',
        'limit must be positive.',
      );
    }
    if (request.maxEvaluatedCandidates <= 0) {
      throw ArgumentError.value(
        request.maxEvaluatedCandidates,
        'maxEvaluatedCandidates',
        'maxEvaluatedCandidates must be positive.',
      );
    }
    if (request.targetWinProbability < 0 || request.targetWinProbability > 1) {
      throw ArgumentError.value(
        request.targetWinProbability,
        'targetWinProbability',
        'targetWinProbability must be between 0 and 1.',
      );
    }

    switch (request.ownRole) {
      case LegionRecommendationRole.attacker:
        if (request.enemyLegion is! DefendingLegion) {
          throw ArgumentError.value(
            request.enemyLegion,
            'enemyLegion',
            'Attacking recommendations require a DefendingLegion enemy.',
          );
        }
      case LegionRecommendationRole.defender:
        if (request.enemyLegion is! AttackingLegion) {
          throw ArgumentError.value(
            request.enemyLegion,
            'enemyLegion',
            'Defending recommendations require an AttackingLegion enemy.',
          );
        }
    }
  }
}

class _CandidateEvaluationData {
  const _CandidateEvaluationData({
    required this.legion,
    required this.cost,
    required this.battleValue,
    required this.estimatedStrength,
  });

  final Legion legion;
  final double cost;
  final double battleValue;
  final double estimatedStrength;
}
