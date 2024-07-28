import 'package:bswfa/domain/dice_roll.dart';

class BattleDiceRoll {
  const BattleDiceRoll(this.attackerDiceRoll, this.defenderDiceRoll);

  final DiceRoll attackerDiceRoll;
  final DiceRoll defenderDiceRoll;

  static const BattleDiceRoll empty = BattleDiceRoll(DiceRoll.empty, DiceRoll.empty);

  BattleDiceRoll withAttackerDiceRoll(DiceRoll diceRoll) {
    return BattleDiceRoll(diceRoll, defenderDiceRoll);
  }

  BattleDiceRoll withDefenderDiceRoll(DiceRoll diceRoll) {
    return BattleDiceRoll(attackerDiceRoll, diceRoll);
  }

  int fullDiceRollBitMask() {
    // Returns the concatenated bitMask of attackerDiceRoll and defenderDiceRoll
    return (attackerDiceRoll.bitmask << 16) | defenderDiceRoll.bitmask;
  }

  @override
  String toString() {
    final String attackerEmojis = attackerDiceRoll.toString();
    final String defenderEmojis = defenderDiceRoll.toString();
    return '$attackerEmojis - $defenderEmojis';
  }
}
