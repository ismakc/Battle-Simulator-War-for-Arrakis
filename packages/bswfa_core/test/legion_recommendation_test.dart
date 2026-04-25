import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_constraints.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_cost_policy.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_request.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_resolver.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_role.dart';
import 'package:test/test.dart';

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
              recommendation.legion.namedLeaders.isEmpty,
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
  });
}
