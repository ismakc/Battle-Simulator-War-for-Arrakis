import 'package:bswfa_core/battle/statistics/tree/battle_node_state_cache.dart';
import 'package:bswfa_core/roll/battle_dice_roll.dart';
import 'package:bswfa_core/roll/battle_die.dart';
import 'package:bswfa_core/roll/dice_roll.dart';
import 'package:test/test.dart';

void main() {
  group('dice and cache contract', () {
    test('defines battle die faces with the expected distribution', () {
      expect(BattleDie.faces, hasLength(6));
      expect(
        BattleDie.faces.where((BattleDie face) => face == BattleDie.sword),
        hasLength(3),
      );
      expect(
        BattleDie.faces.where((BattleDie face) => face == BattleDie.shield),
        hasLength(2),
      );
      expect(
        BattleDie.faces.where((BattleDie face) => face == BattleDie.star),
        hasLength(1),
      );
    });

    test('decodes face counts from the documented bitmask layout', () {
      final roll = DiceRoll(0x231);

      expect(roll.swordCount, 1);
      expect(roll.shieldCount, 3);
      expect(roll.starCount, 2);
      expect(roll.totalDice, 6);
    });

    test('encodes each face count in a stable bitmask', () {
      final roll = DiceRoll.zero.addSword().addShield().addStar().addSword();

      expect(roll.swordCount, 2);
      expect(roll.shieldCount, 1);
      expect(roll.starCount, 1);
      expect(roll.totalDice, 4);
      expect(roll.bitmask, 0x112);
    });

    test('rejects adding more than six dice to a roll', () {
      final roll = DiceRoll.zero
          .addSword()
          .addSword()
          .addSword()
          .addShield()
          .addShield()
          .addStar();

      expect(() => roll.addSword(), throwsStateError);
    });

    test('preserves immutability when adding faces to a roll', () {
      final baseRoll = DiceRoll.zero;
      final updatedRoll = baseRoll.addShield();

      expect(baseRoll.bitmask, 0);
      expect(baseRoll.totalDice, 0);
      expect(updatedRoll.bitmask, 0x010);
      expect(updatedRoll.shieldCount, 1);
    });

    test('defaults both sides of a battle roll to zero dice', () {
      const roll = BattleDiceRoll();

      expect(roll.attackerDiceRoll, same(DiceRoll.zero));
      expect(roll.defenderDiceRoll, same(DiceRoll.zero));
      expect(roll.cacheKey, 0);
    });

    test('builds a unique cache key from attacker and defender rolls', () {
      final attackerFirst = BattleDiceRoll(
        attackerDiceRoll: DiceRoll.zero.addSword(),
        defenderDiceRoll: DiceRoll.zero.addShield(),
      );
      final defenderFirst = BattleDiceRoll(
        attackerDiceRoll: DiceRoll.zero.addShield(),
        defenderDiceRoll: DiceRoll.zero.addSword(),
      );

      expect(attackerFirst.cacheKey, isNot(defenderFirst.cacheKey));
    });

    test('builds cache key by packing attacker and defender bitmasks', () {
      final attackerRoll = DiceRoll.zero.addSword().addStar();
      final defenderRoll = DiceRoll.zero.addShield().addShield();
      final battleRoll = BattleDiceRoll(
        attackerDiceRoll: attackerRoll,
        defenderDiceRoll: defenderRoll,
      );

      final expectedKey =
          (attackerRoll.bitmask << DiceRoll.encodedBits) | defenderRoll.bitmask;

      expect(battleRoll.cacheKey, expectedKey);
    });

    test(
      'stores values in memory cache and ignores writes in non caching mode',
      () {
        final inMemory = InMemoryBattleNodeStateCache<int, String>();
        final nonCaching = NonCachingBattleNodeStateCache<int, String>();

        inMemory[7] = 'value';
        nonCaching[7] = 'value';

        expect(inMemory[7], 'value');
        expect(nonCaching[7], isNull);
      },
    );
  });
}
