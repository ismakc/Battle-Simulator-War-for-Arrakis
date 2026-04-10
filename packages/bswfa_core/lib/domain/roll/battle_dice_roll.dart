import 'package:bswfa_core/domain/roll/dice_roll.dart';

class BattleDiceRoll {
  const BattleDiceRoll(this.attackerDiceRoll, this.defenderDiceRoll);

  static const int _defenderOffset = 0;
  static const int _attackerOffset = 16;

  final DiceRoll attackerDiceRoll;
  final DiceRoll defenderDiceRoll;

  static const BattleDiceRoll defaultValues = BattleDiceRoll(
    DiceRoll.defaultValues,
    DiceRoll.defaultValues,
  );

  BattleDiceRoll withAttackerDiceRoll(DiceRoll diceRoll) {
    return BattleDiceRoll(diceRoll, defenderDiceRoll);
  }

  BattleDiceRoll withDefenderDiceRoll(DiceRoll diceRoll) {
    return BattleDiceRoll(attackerDiceRoll, diceRoll);
  }

  /// Clave estable de memoización para una tirada atacante + defensora.
  int get cacheKey {
    final int attacker =
        (attackerDiceRoll.bitmask & DiceRoll.maxEncodedBitmask) <<
        _attackerOffset;
    final int defender =
        (defenderDiceRoll.bitmask & DiceRoll.maxEncodedBitmask) <<
        _defenderOffset;
    return attacker | defender;
  }

  int fullDiceRollBitMask() {
    return cacheKey;
  }
}
