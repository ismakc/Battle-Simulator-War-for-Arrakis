import 'package:bswfa_core/domain/roll/dice_roll.dart';

class BattleDiceRoll {
  const BattleDiceRoll(this.attackerDiceRoll, this.defenderDiceRoll);

  final DiceRoll attackerDiceRoll;
  final DiceRoll defenderDiceRoll;

  static const BattleDiceRoll defaultValues = BattleDiceRoll(DiceRoll.defaultValues, DiceRoll.defaultValues);

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
}
