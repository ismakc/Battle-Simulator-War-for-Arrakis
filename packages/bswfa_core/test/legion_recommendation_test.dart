import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution_resolver.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_constraints.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_cost_policy.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_request.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_resolver.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_role.dart';
import 'package:test/test.dart';

import '../tool/recommendation_search_weight_tools.dart' as weight_tools;

void main() {
  group('legion recommendation', () {
    test('uses the configured relative cost heuristic', () {
      expect(
        LegionRecommendationCostPolicy.surpriseAttackCost,
        lessThan(LegionRecommendationCostPolicy.genericLeaderCost),
      );
      expect(
        LegionRecommendationCostPolicy.genericLeaderCost,
        lessThan(LegionRecommendationCostPolicy.regularUnitCost),
      );
      expect(
        LegionRecommendationCostPolicy.regularUnitCost,
        lessThan(LegionRecommendationCostPolicy.eliteUnitCost),
      );
      expect(
        LegionRecommendationCostPolicy.eliteUnitCost,
        lessThan(LegionRecommendationCostPolicy.specialEliteUnitCost),
      );
      expect(
        LegionRecommendationCostPolicy.eliteUnitCost,
        lessThan(LegionRecommendationCostPolicy.regularUnitCost * 2),
      );
      expect(
        LegionRecommendationCostPolicy.specialEliteUnitCost,
        lessThan(LegionRecommendationCostPolicy.eliteUnitCost * 2),
      );
    });

    test('includes settlement only in contextual battle value', () {
      final DefendingLegion legion = DefendingLegion(
        regularUnits: 1,
        settlementLevel: 2,
      );

      expect(LegionRecommendationCostPolicy.calculate(legion), 1);
      expect(LegionRecommendationCostPolicy.calculateBattleValue(legion), 3);
    });

    test('keeps calibrated search weights separate from visible cost', () {
      final DefendingLegion legion = DefendingLegion(
        regularUnits: 1,
        settlementLevel: 2,
      );

      expect(LegionRecommendationCostPolicy.calculate(legion), 1);
      expect(LegionRecommendationCostPolicy.calculateBattleValue(legion), 3);
      expect(
        LegionRecommendationCostPolicy.calculateSearchBattleValue(legion),
        closeTo(5.798, 0.000001),
      );
    });

    test('starts evaluation near the enemy battle value', () {
      final LegionRecommendationResolver resolver =
          LegionRecommendationResolver();

      final List<LegionRecommendation> recommendations = resolver.resolve(
        LegionRecommendationRequest(
          enemyLegion: DefendingLegion(regularUnits: 1),
          ownRole: LegionRecommendationRole.attacker,
          maxRounds: 1,
          targetWinProbability: 0,
          limit: 1,
          maxEvaluatedCandidates: 1,
          constraints: LegionRecommendationConstraints(
            maxRegularUnits: 1,
            maxEliteUnits: 0,
            maxSpecialEliteUnits: 1,
            maxGenericLeaders: 0,
          ),
        ),
      );

      expect(recommendations, hasLength(1));
      expect(recommendations.single.legion.regularUnits, 1);
      expect(recommendations.single.legion.specialEliteUnits, 0);
    });

    test('returns at most three attacker recommendations', () {
      final LegionRecommendationResolver resolver =
          LegionRecommendationResolver();

      final List<LegionRecommendation> recommendations = resolver.resolve(
        LegionRecommendationRequest(
          enemyLegion: DefendingLegion(regularUnits: 1),
          ownRole: LegionRecommendationRole.attacker,
          maxRounds: 1,
          targetWinProbability: 0,
          constraints: LegionRecommendationConstraints(
            maxRegularUnits: 2,
            maxEliteUnits: 1,
            maxSpecialEliteUnits: 1,
            maxGenericLeaders: 1,
            allowSurpriseAttack: true,
          ),
        ),
      );

      expect(recommendations, hasLength(3));
      expect(
        recommendations.every(
          (LegionRecommendation recommendation) =>
              recommendation.legion is AttackingLegion,
        ),
        isTrue,
      );
      expect(
        recommendations.every(
          (LegionRecommendation recommendation) =>
              recommendation.legion.usedCards == 0 &&
              recommendation.legion.namedLeaders.isEmpty &&
              recommendation.legion.totalUnits <= 6,
        ),
        isTrue,
      );
    });

    test('does not recommend candidates with more than six total units', () {
      final LegionRecommendationResolver resolver =
          LegionRecommendationResolver();

      final List<LegionRecommendation> recommendations = resolver.resolve(
        LegionRecommendationRequest(
          enemyLegion: DefendingLegion(regularUnits: 6),
          ownRole: LegionRecommendationRole.attacker,
          maxRounds: 1,
          targetWinProbability: 0,
          limit: 3,
          maxEvaluatedCandidates: 50,
          constraints: LegionRecommendationConstraints(
            maxRegularUnits: 6,
            maxEliteUnits: 6,
            maxSpecialEliteUnits: 6,
            maxGenericLeaders: 2,
            allowSurpriseAttack: true,
          ),
        ),
      );

      expect(recommendations, isNotEmpty);
      expect(
        recommendations.every(
          (LegionRecommendation recommendation) =>
              recommendation.legion.totalUnits <= 6,
        ),
        isTrue,
      );
    });

    test('can recommend defending legions against an attacking enemy', () {
      final LegionRecommendationResolver resolver =
          LegionRecommendationResolver();

      final List<LegionRecommendation> recommendations = resolver.resolve(
        LegionRecommendationRequest(
          enemyLegion: AttackingLegion(regularUnits: 1),
          ownRole: LegionRecommendationRole.defender,
          maxRounds: 1,
          targetWinProbability: 0,
          constraints: LegionRecommendationConstraints(
            maxRegularUnits: 1,
            maxEliteUnits: 0,
            maxSpecialEliteUnits: 0,
            maxGenericLeaders: 0,
            settlementLevel: 1,
          ),
        ),
      );

      expect(recommendations, hasLength(1));
      expect(recommendations.single.legion, isA<DefendingLegion>());
      expect(
        recommendations.single.ownWinProbability,
        closeTo(7 / 9, 0.000001),
      );
      expect(
        recommendations.single.ownLoseProbability,
        closeTo(1 / 72, 0.000001),
      );
    });

    test('falls back to best recommendations when none meet the target', () {
      final LegionRecommendationResolver resolver =
          LegionRecommendationResolver();

      final List<LegionRecommendation> recommendations = resolver.resolve(
        LegionRecommendationRequest(
          enemyLegion: DefendingLegion(regularUnits: 2),
          ownRole: LegionRecommendationRole.attacker,
          maxRounds: 1,
          targetWinProbability: 1,
          constraints: LegionRecommendationConstraints(
            maxRegularUnits: 1,
            maxEliteUnits: 0,
            maxSpecialEliteUnits: 0,
            maxGenericLeaders: 0,
          ),
        ),
      );

      expect(recommendations, hasLength(1));
      expect(recommendations.single.meetsTarget, isFalse);
    });

    test('evaluates at most maxEvaluatedCandidates candidates', () {
      final RecordingBattleDistributionResolver distributionResolver =
          RecordingBattleDistributionResolver();
      final LegionRecommendationResolver resolver =
          LegionRecommendationResolver(
            battleDistributionResolver: distributionResolver,
          );

      resolver.resolve(
        LegionRecommendationRequest(
          enemyLegion: DefendingLegion(regularUnits: 2),
          ownRole: LegionRecommendationRole.attacker,
          maxRounds: 1,
          targetWinProbability: 0,
          maxEvaluatedCandidates: 2,
          constraints: LegionRecommendationConstraints(
            maxRegularUnits: 2,
            maxEliteUnits: 1,
            maxSpecialEliteUnits: 0,
            maxGenericLeaders: 1,
          ),
        ),
      );

      expect(distributionResolver.seenScenarios, hasLength(2));
    });

    test('weight calibration tooling matches production preselection', () {
      final LegionRecommendationConstraints constraints =
          LegionRecommendationConstraints(
            maxRegularUnits: 3,
            maxEliteUnits: 2,
            maxSpecialEliteUnits: 2,
            maxGenericLeaders: 99,
            allowSurpriseAttack: true,
          );
      final RecordingBattleDistributionResolver distributionResolver =
          RecordingBattleDistributionResolver();
      final LegionRecommendationResolver resolver =
          LegionRecommendationResolver(
            battleDistributionResolver: distributionResolver,
          );

      resolver.resolve(
        LegionRecommendationRequest(
          enemyLegion: DefendingLegion(regularUnits: 3, settlementLevel: 1),
          ownRole: LegionRecommendationRole.attacker,
          constraints: constraints,
          maxRounds: 2,
          targetWinProbability: 0,
          limit: 3,
          maxEvaluatedCandidates: 12,
        ),
      );

      final weight_tools.DatasetEntry entry = weight_tools.DatasetEntry(
        id: 'preselection_contract',
        split: 'test',
        ownRole: LegionRecommendationRole.attacker,
        enemyLegion: DefendingLegion(regularUnits: 3, settlementLevel: 1),
        constraints: constraints,
        maxRounds: 2,
        maxEvaluatedCandidates: 12,
      );
      final weight_tools.PreparedDatasetEntry
      prepared = weight_tools.PreparedDatasetEntry(
        entry: entry,
        candidates: <weight_tools.CandidateStaticData>[
          for (final Legion legion in weight_tools.buildCandidateLegions(entry))
            weight_tools.CandidateStaticData(
              legion: legion,
              cost: LegionRecommendationCostPolicy.calculate(legion),
              estimatedStrength: weight_tools.estimateCandidateStrength(
                entry.ownRole,
                legion,
              ),
              baseBattleValue:
                  LegionRecommendationCostPolicy.calculateBattleValue(legion),
            ),
        ],
        oracleRanking: const <weight_tools.ResolvedCandidateTruth>[],
        oracleTopKLegions: const <Legion>{},
        oracleTop3Legions: const <Legion>[],
        bestOracleWinProbability: 0,
      );
      final weight_tools.PreparedSearchWeightEvaluator evaluator =
          weight_tools.PreparedSearchWeightEvaluator(
            searchWeights: const weight_tools.SearchWeights(
              genericLeader: 0.331,
              regularUnit: 1,
              eliteUnit: 1.330,
              specialEliteUnit: 2.053,
              surpriseAttack: 0.216,
              settlementLevel: 2.399,
            ),
          );

      final List<Legion> productionCandidates = distributionResolver
          .seenScenarios
          .map((BattleScenario scenario) => scenario.attackingLegion)
          .toList(growable: false);
      final List<Legion> toolingCandidates = evaluator
          .preselectCandidates(prepared)
          .map((weight_tools.CandidateScoredData data) => data.legion)
          .toList(growable: false);

      expect(toolingCandidates, productionCandidates);
    });

    test('ranks by win probability, then loss risk, then cost', () {
      final RankingBattleDistributionResolver distributionResolver =
          RankingBattleDistributionResolver();
      final LegionRecommendationResolver resolver =
          LegionRecommendationResolver(
            battleDistributionResolver: distributionResolver,
          );

      final List<LegionRecommendation> recommendations = resolver.resolve(
        LegionRecommendationRequest(
          enemyLegion: DefendingLegion(regularUnits: 1),
          ownRole: LegionRecommendationRole.attacker,
          maxRounds: 1,
          targetWinProbability: 0,
          limit: 3,
          maxEvaluatedCandidates: 10,
          constraints: LegionRecommendationConstraints(
            maxRegularUnits: 2,
            maxEliteUnits: 0,
            maxSpecialEliteUnits: 0,
            maxGenericLeaders: 1,
          ),
        ),
      );

      expect(recommendations, hasLength(3));
      expect(recommendations[0].legion.regularUnits, 2);
      expect(recommendations[0].legion.genericLeaders, 0);
      expect(recommendations[1].legion.regularUnits, 1);
      expect(recommendations[1].legion.genericLeaders, 1);
      expect(recommendations[2].legion.regularUnits, 1);
      expect(recommendations[2].legion.genericLeaders, 0);
    });
  });
}

class RecordingBattleDistributionResolver extends BattleDistributionResolver {
  RecordingBattleDistributionResolver();

  final List<BattleScenario> seenScenarios = <BattleScenario>[];

  @override
  BattleDistribution resolve({
    required BattleScenario initialScenario,
    required int maxRounds,
  }) {
    seenScenarios.add(initialScenario);
    return const BattleDistribution(
      playedRounds: 1,
      attackerWinProbability: 0,
      defenderWinProbability: 1,
      drawProbability: 0,
      unresolvedStates: <BattleScenario, double>{},
    );
  }
}

class RankingBattleDistributionResolver extends BattleDistributionResolver {
  RankingBattleDistributionResolver();

  @override
  BattleDistribution resolve({
    required BattleScenario initialScenario,
    required int maxRounds,
  }) {
    final AttackingLegion legion = initialScenario.attackingLegion;

    if (legion.regularUnits == 2 && legion.genericLeaders == 0) {
      return const BattleDistribution(
        playedRounds: 1,
        attackerWinProbability: 0.8,
        defenderWinProbability: 0.3,
        drawProbability: 0,
        unresolvedStates: <BattleScenario, double>{},
      );
    }
    if (legion.regularUnits == 1 && legion.genericLeaders == 1) {
      return const BattleDistribution(
        playedRounds: 1,
        attackerWinProbability: 0.6,
        defenderWinProbability: 0.1,
        drawProbability: 0,
        unresolvedStates: <BattleScenario, double>{},
      );
    }
    if (legion.regularUnits == 1 && legion.genericLeaders == 0) {
      return const BattleDistribution(
        playedRounds: 1,
        attackerWinProbability: 0.6,
        defenderWinProbability: 0.2,
        drawProbability: 0,
        unresolvedStates: <BattleScenario, double>{},
      );
    }

    return const BattleDistribution(
      playedRounds: 1,
      attackerWinProbability: 0.1,
      defenderWinProbability: 0.8,
      drawProbability: 0,
      unresolvedStates: <BattleScenario, double>{},
    );
  }
}
