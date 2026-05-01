import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution_resolver.dart';
import 'package:bswfa_core/battle/distribution/battle_round_distribution_resolver.dart';
import 'package:bswfa_core/battle/distribution/battle_round_outcome.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:test/test.dart';

void main() {
  group('battle distribution', () {
    test('resolves one round without collapsing to expected hits', () {
      final BattleDistributionResolver resolver = BattleDistributionResolver();

      final distribution = resolver.resolve(
        initialScenario: BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 1),
          defendingLegion: DefendingLegion(regularUnits: 1),
        ),
        maxRounds: 1,
      );

      expect(distribution.playedRounds, 1);
      expect(distribution.attackerWinProbability, closeTo(1 / 12, 0.000001));
      expect(distribution.defenderWinProbability, closeTo(1 / 12, 0.000001));
      expect(distribution.drawProbability, closeTo(1 / 4, 0.000001));
      expect(distribution.unresolvedProbability, closeTo(7 / 12, 0.000001));
      expect(distribution.resolvedProbability, closeTo(5 / 12, 0.000001));
    });

    test('keeps total probability at one after several rounds', () {
      final BattleDistributionResolver resolver = BattleDistributionResolver();

      final distribution = resolver.resolve(
        initialScenario: BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 2),
          defendingLegion: DefendingLegion(regularUnits: 2),
        ),
        maxRounds: 3,
      );

      expect(
        distribution.resolvedProbability + distribution.unresolvedProbability,
        closeTo(1, 0.000001),
      );
    });

    test('rejects negative max rounds', () {
      final BattleDistributionResolver resolver = BattleDistributionResolver();

      expect(
        () => resolver.resolve(
          initialScenario: const BattleScenario(),
          maxRounds: -1,
        ),
        throwsArgumentError,
      );
    });

    test(
      'clears surprise attack and used cards before propagating round 2',
      () {
        final BattleDistributionResolver resolver =
            BattleDistributionResolver();

        final distribution = resolver.resolve(
          initialScenario: BattleScenario(
            attackingLegion: AttackingLegion(
              regularUnits: 1,
              usedCards: 1,
              surpriseAttack: true,
            ),
            defendingLegion: DefendingLegion(regularUnits: 2, usedCards: 1),
          ),
          maxRounds: 2,
        );

        expect(distribution.playedRounds, 2);
        expect(distribution.unresolvedStates, isNotEmpty);
        for (final BattleScenario scenario
            in distribution.unresolvedStates.keys) {
          expect(scenario.attackingLegion.surpriseAttack, isFalse);
          expect(scenario.attackingLegion.usedCards, 0);
          expect(scenario.defendingLegion.usedCards, 0);
        }
      },
    );

    test('aggregates identical unresolved states after propagation', () {
      final BattleDistributionResolver resolver = BattleDistributionResolver();

      final distribution = resolver.resolve(
        initialScenario: BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 1),
          defendingLegion: DefendingLegion(regularUnits: 1),
        ),
        maxRounds: 1,
      );

      expect(distribution.unresolvedStates.length, 1);
      expect(distribution.unresolvedProbability, closeTo(7 / 12, 0.000001));

      final BattleScenario unresolvedScenario =
          distribution.unresolvedStates.keys.single;
      expect(unresolvedScenario.attackingLegion.totalUnits, 1);
      expect(unresolvedScenario.defendingLegion.totalUnits, 1);
    });

    test('round resolver groups equivalent dice sequences', () {
      final BattleRoundDistributionResolver resolver =
          BattleRoundDistributionResolver();

      final outcomes = resolver.resolve(
        BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 1),
          defendingLegion: DefendingLegion(regularUnits: 1),
        ),
      );

      final double totalProbability = outcomes.fold(
        0,
        (double total, outcome) => total + outcome.probability,
      );

      expect(totalProbability, closeTo(1, 0.000001));
      expect(outcomes.length, lessThan(36));
    });

    test('round resolver assigns multinomial probabilities for one die', () {
      final BattleRoundDistributionResolver resolver =
          BattleRoundDistributionResolver();

      final List<BattleRoundOutcome> outcomes = resolver.resolve(
        BattleScenario(attackingLegion: AttackingLegion(regularUnits: 1)),
      );

      BattleRoundOutcome findOutcome(int attackerHits) {
        return outcomes.singleWhere(
          (BattleRoundOutcome outcome) =>
              outcome.attackerHits == attackerHits &&
              outcome.defenderHits == 0 &&
              outcome.scenarioAfterRound.attackingLegion.regularUnits == 1 &&
              outcome.scenarioAfterRound.defendingLegion.totalUnits == 0,
        );
      }

      expect(findOutcome(1).probability, closeTo(3 / 6, 0.000001));
      expect(findOutcome(0).probability, closeTo(3 / 6, 0.000001));
    });

    test('round resolver applies combat hits to build the next scenario', () {
      final BattleRoundDistributionResolver resolver =
          BattleRoundDistributionResolver();

      final List<BattleRoundOutcome> outcomes = resolver.resolve(
        BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 1),
          defendingLegion: DefendingLegion(regularUnits: 1),
        ),
      );

      final BattleRoundOutcome attackerWinOutcome = outcomes.singleWhere(
        (BattleRoundOutcome outcome) =>
            outcome.attackerHits == 1 && outcome.defenderHits == 0,
      );
      final BattleRoundOutcome defenderWinOutcome = outcomes.singleWhere(
        (BattleRoundOutcome outcome) =>
            outcome.attackerHits == 0 && outcome.defenderHits == 1,
      );
      final BattleRoundOutcome drawOutcome = outcomes.singleWhere(
        (BattleRoundOutcome outcome) =>
            outcome.attackerHits == 1 && outcome.defenderHits == 1,
      );

      expect(
        attackerWinOutcome.scenarioAfterRound.attackingLegion.totalUnits,
        1,
      );
      expect(
        defenderWinOutcome.scenarioAfterRound.attackingLegion.totalUnits,
        0,
      );
      expect(
        attackerWinOutcome.scenarioAfterRound.defendingLegion.totalUnits,
        0,
      );
      expect(
        defenderWinOutcome.scenarioAfterRound.defendingLegion.totalUnits,
        1,
      );
      expect(drawOutcome.scenarioAfterRound.attackingLegion.totalUnits, 0);
      expect(drawOutcome.scenarioAfterRound.defendingLegion.totalUnits, 0);
    });

    test(
      'round resolver applies settlement continuation loss only if battle continues',
      () {
        final BattleRoundDistributionResolver resolver =
            BattleRoundDistributionResolver();

        final List<BattleRoundOutcome> outcomes = resolver.resolve(
          BattleScenario(
            attackingLegion: AttackingLegion(regularUnits: 2),
            defendingLegion: DefendingLegion(
              regularUnits: 1,
              settlementLevel: 1,
            ),
          ),
        );

        final BattleRoundOutcome unresolvedOutcome = outcomes.singleWhere(
          (BattleRoundOutcome outcome) =>
              outcome.attackerHits == 0 &&
              outcome.defenderHits == 0 &&
              outcome.scenarioAfterRound.defendingLegion.totalUnits == 1,
        );
        final BattleRoundOutcome attackerWinOutcome = outcomes.singleWhere(
          (BattleRoundOutcome outcome) =>
              outcome.attackerHits == 1 && outcome.defenderHits == 0,
        );

        expect(
          unresolvedOutcome.scenarioAfterRound.attackingLegion.totalUnits,
          1,
        );
        expect(
          attackerWinOutcome.scenarioAfterRound.attackingLegion.totalUnits,
          2,
        );
      },
    );
  });
}
