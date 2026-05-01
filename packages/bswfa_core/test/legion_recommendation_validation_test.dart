import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_constraints.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_request.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_resolver.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_role.dart';
import 'package:test/test.dart';

void main() {
  group('legion recommendation validation', () {
    const resolver = LegionRecommendationResolver();
    const constraints = LegionRecommendationConstraints(
      maxRegularUnits: 1,
      maxEliteUnits: 1,
      maxSpecialEliteUnits: 1,
      maxGenericLeaders: 1,
    );

    test('rejects negative max rounds', () {
      expect(
        () => resolver.resolve(
          const LegionRecommendationRequest(
            enemyLegion: DefendingLegion(regularUnits: 1),
            ownRole: LegionRecommendationRole.attacker,
            constraints: constraints,
            maxRounds: -1,
          ),
        ),
        throwsArgumentError,
      );
    });

    test('rejects non positive limits', () {
      expect(
        () => resolver.resolve(
          const LegionRecommendationRequest(
            enemyLegion: DefendingLegion(regularUnits: 1),
            ownRole: LegionRecommendationRole.attacker,
            constraints: constraints,
            limit: 0,
          ),
        ),
        throwsArgumentError,
      );
    });

    test('rejects non positive max evaluated candidates', () {
      expect(
        () => resolver.resolve(
          const LegionRecommendationRequest(
            enemyLegion: DefendingLegion(regularUnits: 1),
            ownRole: LegionRecommendationRole.attacker,
            constraints: constraints,
            maxEvaluatedCandidates: 0,
          ),
        ),
        throwsArgumentError,
      );
    });

    test('rejects target probabilities outside the unit interval', () {
      expect(
        () => resolver.resolve(
          const LegionRecommendationRequest(
            enemyLegion: DefendingLegion(regularUnits: 1),
            ownRole: LegionRecommendationRole.attacker,
            constraints: constraints,
            targetWinProbability: 1.1,
          ),
        ),
        throwsArgumentError,
      );
    });

    test(
      'requires the right enemy legion type for attacker recommendations',
      () {
        expect(
          () => resolver.resolve(
            const LegionRecommendationRequest(
              enemyLegion: AttackingLegion(regularUnits: 1),
              ownRole: LegionRecommendationRole.attacker,
              constraints: constraints,
            ),
          ),
          throwsArgumentError,
        );
      },
    );

    test(
      'requires the right enemy legion type for defender recommendations',
      () {
        expect(
          () => resolver.resolve(
            const LegionRecommendationRequest(
              enemyLegion: DefendingLegion(regularUnits: 1),
              ownRole: LegionRecommendationRole.defender,
              constraints: constraints,
            ),
          ),
          throwsArgumentError,
        );
      },
    );
  });
}
