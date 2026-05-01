import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/result/automatic_battle_end_reason.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_end_policy.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:test/test.dart';

void main() {
  group('automatic battle end policy', () {
    test('returns mutual destruction when both sides have no units left', () {
      final endReason = AutomaticBattleEndPolicy.resolveEndReason(
        currentScenario: BattleScenario(
          attackingLegion: AttackingLegion(),
          defendingLegion: DefendingLegion(),
        ),
        totalDefenderExpectedHits: 0,
      );

      expect(endReason, AutomaticBattleEndReason.mutualDestruction);
    });

    test(
      'returns defender destroyed before evaluating attacker exhaustion',
      () {
        final endReason = AutomaticBattleEndPolicy.resolveEndReason(
          currentScenario: BattleScenario(
            attackingLegion: AttackingLegion(regularUnits: 1),
            defendingLegion: DefendingLegion(),
          ),
          totalDefenderExpectedHits: 99,
        );

        expect(endReason, AutomaticBattleEndReason.defenderDestroyed);
      },
    );

    test(
      'does not stop when expected hits equal attacker remaining capacity',
      () {
        final endReason = AutomaticBattleEndPolicy.resolveEndReason(
          currentScenario: BattleScenario(
            attackingLegion: AttackingLegion(
              regularUnits: 1,
              genericLeaders: 1,
            ),
            defendingLegion: DefendingLegion(regularUnits: 1),
          ),
          totalDefenderExpectedHits: 2,
        );

        expect(endReason, isNull);
      },
    );

    test('stops when expected hits exceed attacker remaining capacity', () {
      final endReason = AutomaticBattleEndPolicy.resolveEndReason(
        currentScenario: BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 1, genericLeaders: 1),
          defendingLegion: DefendingLegion(regularUnits: 1),
        ),
        totalDefenderExpectedHits: 2.01,
      );

      expect(endReason, AutomaticBattleEndReason.attackerUnableToContinue);
    });
  });
}
