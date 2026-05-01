import 'package:bswfa_core/battle/battle_hits_calculator.dart';
import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_loss_application_policy.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_round_resolver.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/named_leader.dart';
import 'package:bswfa_core/roll/battle_dice_roll.dart';
import 'package:bswfa_core/roll/dice_roll.dart';
import 'package:test/test.dart';

void main() {
  group('battle rules', () {
    test('clears surprise attack and used cards before resolving round 2', () {
      final AutomaticBattleRoundResolver resolver =
          AutomaticBattleRoundResolver();

      final resolution = resolver.resolve(
        currentScenario: BattleScenario(
          attackingLegion: AttackingLegion(usedCards: 1, surpriseAttack: true),
        ),
        nextRoundNumber: 2,
      );

      expect(resolution.roundStatistic.attackerExpectedHits, 0);
      expect(resolution.nextScenario.attackingLegion.usedCards, 0);
      expect(resolution.nextScenario.attackingLegion.surpriseAttack, isFalse);
    });

    test(
      'activates leaders to maximize hits before minimizing suffered hits',
      () {
        final BattleHitsCalculator calculator = BattleHitsCalculator();

        final (int attackerHits, int defenderHits) = calculator.calculateHits(
          BattleScenario(
            attackingLegion: AttackingLegion(
              genericLeaders: 1,
              namedLeaders: <NamedLeader>[NamedLeader.leader0_3],
            ),
          ),
          BattleDiceRoll(
            attackerDiceRoll: DiceRoll.zero.addStar(),
            defenderDiceRoll: DiceRoll.zero.addSword(),
          ),
        );

        expect(attackerHits, 1);
        expect(defenderHits, 1);
      },
    );

    test('applies surprise attack as an extra attacker star in round hits', () {
      final BattleHitsCalculator calculator = BattleHitsCalculator();

      final (int attackerHits, int defenderHits) = calculator.calculateHits(
        BattleScenario(
          attackingLegion: AttackingLegion(
            genericLeaders: 1,
            surpriseAttack: true,
          ),
        ),
        const BattleDiceRoll(),
      );

      expect(attackerHits, 1);
      expect(defenderHits, 0);
    });

    test('caps leader activations to the available number of stars', () {
      final BattleHitsCalculator calculator = BattleHitsCalculator();

      final (int attackerHits, int defenderHits) = calculator.calculateHits(
        BattleScenario(
          attackingLegion: AttackingLegion(
            namedLeaders: <NamedLeader>[
              NamedLeader.leader2_0,
              NamedLeader.leader0_3,
            ],
          ),
        ),
        BattleDiceRoll(
          attackerDiceRoll: DiceRoll.zero.addStar(),
          defenderDiceRoll: DiceRoll.zero,
        ),
      );

      expect(attackerHits, 2);
      expect(defenderHits, 0);
    });

    test(
      'special elite units remove opponent shields before hits are applied',
      () {
        final BattleHitsCalculator calculator = BattleHitsCalculator();

        final (int attackerHits, int defenderHits) = calculator.calculateHits(
          BattleScenario(
            attackingLegion: AttackingLegion(
              regularUnits: 1,
              specialEliteUnits: 1,
            ),
            defendingLegion: DefendingLegion(regularUnits: 2),
          ),
          BattleDiceRoll(
            attackerDiceRoll: DiceRoll.zero.addSword().addSword(),
            defenderDiceRoll: DiceRoll.zero.addShield().addShield(),
          ),
        );

        expect(attackerHits, 1);
        expect(defenderHits, 0);
      },
    );

    test('breaks equal-hit leader choices by minimizing suffered hits', () {
      final BattleHitsCalculator calculator = BattleHitsCalculator();

      final (int attackerHits, int defenderHits) = calculator.calculateHits(
        BattleScenario(
          attackingLegion: AttackingLegion(
            namedLeaders: <NamedLeader>[
              NamedLeader.leader1_0,
              NamedLeader.leader1_1,
            ],
          ),
          defendingLegion: DefendingLegion(regularUnits: 1),
        ),
        BattleDiceRoll(
          attackerDiceRoll: DiceRoll.zero.addStar(),
          defenderDiceRoll: DiceRoll.zero.addSword(),
        ),
      );

      expect(attackerHits, 1);
      expect(defenderHits, 0);
    });

    test('removes surviving leaders when the last unit is destroyed', () {
      final AttackingLegion legion =
          AutomaticBattleLossApplicationPolicy.resolveAttackerCombatLosses(
            AttackingLegion(
              regularUnits: 1,
              namedLeaders: <NamedLeader>[NamedLeader.leader2_0],
            ),
            2,
          );

      expect(legion.totalUnits, 0);
      expect(legion.totalLeaders, 0);
    });
  });
}
