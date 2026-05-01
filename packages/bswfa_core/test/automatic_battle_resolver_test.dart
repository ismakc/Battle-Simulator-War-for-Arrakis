import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/result/automatic_battle_end_reason.dart';
import 'package:bswfa_core/battle/result/battle_winner.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_resolver.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:test/test.dart';

void main() {
  group('automatic battle resolver', () {
    const AutomaticBattleResolver resolver = AutomaticBattleResolver();

    test(
      'stops when the attacker is no longer expected to break the deadlock',
      () {
        final result = resolver.resolve(
          BattleScenario(
            attackingLegion: AttackingLegion(regularUnits: 1),
            defendingLegion: DefendingLegion(regularUnits: 1),
          ),
        );

        expect(result.playedCombatRounds, 4);
        expect(
          result.endReason,
          AutomaticBattleEndReason.attackerUnableToContinue,
        );
        expect(result.winner(), BattleWinner.defender);
        expect(result.resultingScenario.attackingLegion.totalUnits, 1);
        expect(result.resultingScenario.defendingLegion.totalUnits, 1);
        expect(result.statistic.attackerExpectedHits, closeTo(1.32, 0.000001));
        expect(result.statistic.defenderExpectedHits, closeTo(1.32, 0.000001));
      },
    );

    test(
      'applies settlement continuation damage and can destroy the attacker',
      () {
        final result = resolver.resolve(
          BattleScenario(
            attackingLegion: AttackingLegion(regularUnits: 1),
            defendingLegion: DefendingLegion(
              regularUnits: 1,
              settlementLevel: 1,
            ),
          ),
        );

        expect(result.playedCombatRounds, 1);
        expect(result.endReason, AutomaticBattleEndReason.attackerDestroyed);
        expect(result.winner(), BattleWinner.defender);
        expect(result.resultingScenario.attackingLegion.totalUnits, 0);
        expect(result.resultingScenario.defendingLegion.totalUnits, 1);
        expect(result.statistic.attackerExpectedHits, closeTo(0.22, 0.000001));
        expect(result.statistic.defenderExpectedHits, closeTo(0.75, 0.000001));
      },
    );

    test('returns an attacker win when the defender is destroyed first', () {
      final result = resolver.resolve(
        BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 2),
          defendingLegion: DefendingLegion(regularUnits: 1, settlementLevel: 1),
        ),
      );

      expect(result.playedCombatRounds, 1);
      expect(result.endReason, AutomaticBattleEndReason.defenderDestroyed);
      expect(result.winner(), BattleWinner.attacker);
      expect(result.resultingScenario.attackingLegion.totalUnits, 1);
      expect(result.resultingScenario.defendingLegion.totalUnits, 0);
      expect(result.statistic.attackerExpectedHits, closeTo(0.56, 0.000001));
      expect(result.statistic.defenderExpectedHits, closeTo(0.56, 0.000001));
    });
  });
}
