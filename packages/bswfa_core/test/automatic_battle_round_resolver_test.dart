import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_round_resolver.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:test/test.dart';

void main() {
  group('automatic battle round resolver', () {
    const AutomaticBattleRoundResolver resolver =
        AutomaticBattleRoundResolver();

    test('clears surprise attack and used cards before resolving round 2', () {
      final resolution = resolver.resolve(
        currentScenario: BattleScenario(
          attackingLegion: AttackingLegion(
            usedCards: 1,
            surpriseAttack: true,
          ),
          defendingLegion: DefendingLegion(usedCards: 1),
        ),
        nextRoundNumber: 2,
      );

      expect(resolution.roundStatistic.attackerExpectedHits, 0);
      expect(resolution.roundStatistic.defenderExpectedHits, 0);
      expect(resolution.nextScenario.attackingLegion.usedCards, 0);
      expect(resolution.nextScenario.attackingLegion.surpriseAttack, isFalse);
      expect(resolution.nextScenario.defendingLegion.usedCards, 0);
    });

    test(
      'applies settlement continuation loss after rounded combat losses when battle continues',
      () {
        final resolution = resolver.resolve(
          currentScenario: BattleScenario(
            attackingLegion: AttackingLegion(regularUnits: 3),
            defendingLegion: DefendingLegion(
              regularUnits: 2,
              settlementLevel: 1,
            ),
          ),
          nextRoundNumber: 1,
        );

        expect(
          resolution.roundStatistic.attackerExpectedHits,
          closeTo(0.75, 0.000001),
        );
        expect(
          resolution.roundStatistic.defenderExpectedHits,
          closeTo(0.75, 0.000001),
        );
        expect(resolution.nextScenario.attackingLegion.totalUnits, 1);
        expect(resolution.nextScenario.defendingLegion.totalUnits, 1);
      },
    );

    test('does not apply continuation loss when the defender is destroyed', () {
      final resolution = resolver.resolve(
        currentScenario: BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 2),
          defendingLegion: DefendingLegion(
            regularUnits: 1,
            settlementLevel: 1,
          ),
        ),
        nextRoundNumber: 1,
      );

      expect(resolution.nextScenario.attackingLegion.totalUnits, 1);
      expect(resolution.nextScenario.defendingLegion.totalUnits, 0);
    });
  });
}
