import 'dart:math' as math;

import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/distribution/battle_round_distribution_resolver.dart';
import 'package:bswfa_core/battle/distribution/battle_round_outcome.dart';
import 'package:bswfa_core/battle/statistics/battle_statistic_calculator.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:test/test.dart';

void main() {
  group('battle statistic calculator', () {
    test('returns zero hits and zero deviation when no dice are rolled', () {
      final statistic = BattleStatisticCalculator.calculate(
        const BattleScenario(),
      );

      expect(statistic.attackerExpectedHits, 0);
      expect(statistic.attackerHitsStdDeviation, 0);
      expect(statistic.defenderExpectedHits, 0);
      expect(statistic.defenderHitsStdDeviation, 0);
    });

    test(
      'computes exact expectation for one attacker die against no defense',
      () {
        final statistic = BattleStatisticCalculator.calculate(
          BattleScenario(attackingLegion: AttackingLegion(regularUnits: 1)),
        );

        expect(statistic.attackerExpectedHits, closeTo(0.5, 0.000001));
        expect(statistic.attackerHitsStdDeviation, closeTo(0.5, 0.000001));
        expect(statistic.defenderExpectedHits, 0);
        expect(statistic.defenderHitsStdDeviation, 0);
      },
    );

    test('is symmetric for mirrored one unit combat', () {
      final statistic = BattleStatisticCalculator.calculate(
        BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 1),
          defendingLegion: DefendingLegion(regularUnits: 1),
        ),
      );

      expect(
        statistic.attackerExpectedHits,
        closeTo(statistic.defenderExpectedHits, 0.000001),
      );
      expect(
        statistic.attackerHitsStdDeviation,
        closeTo(statistic.defenderHitsStdDeviation, 0.000001),
      );
      expect(statistic.attackerExpectedHits, closeTo(0.33, 0.000001));
      expect(statistic.attackerHitsStdDeviation, closeTo(0.47, 0.000001));
    });

    test('matches grouped round distribution statistics', () {
      final BattleScenario scenario = BattleScenario(
        attackingLegion: AttackingLegion(regularUnits: 2),
        defendingLegion: DefendingLegion(regularUnits: 1),
      );
      final statistic = BattleStatisticCalculator.calculate(scenario);
      final List<BattleRoundOutcome> outcomes =
          const BattleRoundDistributionResolver().resolve(scenario);

      final double attackerExpectedHits = outcomes.fold(
        0,
        (double total, BattleRoundOutcome outcome) =>
            total + (outcome.attackerHits * outcome.probability),
      );
      final double defenderExpectedHits = outcomes.fold(
        0,
        (double total, BattleRoundOutcome outcome) =>
            total + (outcome.defenderHits * outcome.probability),
      );
      final double attackerSquaredExpectation = outcomes.fold(
        0,
        (double total, BattleRoundOutcome outcome) =>
            total +
            (outcome.attackerHits * outcome.attackerHits * outcome.probability),
      );
      final double defenderSquaredExpectation = outcomes.fold(
        0,
        (double total, BattleRoundOutcome outcome) =>
            total +
            (outcome.defenderHits * outcome.defenderHits * outcome.probability),
      );

      final double attackerStdDeviation = double.parse(
        math
            .sqrt(
              (attackerSquaredExpectation -
                      (attackerExpectedHits * attackerExpectedHits))
                  .clamp(0, double.infinity),
            )
            .toStringAsFixed(2),
      );
      final double defenderStdDeviation = double.parse(
        math
            .sqrt(
              (defenderSquaredExpectation -
                      (defenderExpectedHits * defenderExpectedHits))
                  .clamp(0, double.infinity),
            )
            .toStringAsFixed(2),
      );
      final double roundedAttackerExpectedHits = double.parse(
        attackerExpectedHits.toStringAsFixed(2),
      );
      final double roundedDefenderExpectedHits = double.parse(
        defenderExpectedHits.toStringAsFixed(2),
      );

      expect(
        statistic.attackerExpectedHits,
        closeTo(roundedAttackerExpectedHits, 0.000001),
      );
      expect(
        statistic.defenderExpectedHits,
        closeTo(roundedDefenderExpectedHits, 0.000001),
      );
      expect(
        statistic.attackerHitsStdDeviation,
        closeTo(attackerStdDeviation, 0.000001),
      );
      expect(
        statistic.defenderHitsStdDeviation,
        closeTo(defenderStdDeviation, 0.000001),
      );
    });
  });
}
