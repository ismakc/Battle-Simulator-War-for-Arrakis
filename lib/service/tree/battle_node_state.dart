import 'package:bswfa/domain/roll/battle_dice_roll.dart';
import 'package:bswfa/domain/roll/dice_roll.dart';
import 'package:bswfa/domain/roll/die.dart';
import 'package:bswfa/service/tree/battle_accumulated_hits.dart';

class BattleNodeState {
  const BattleNodeState(this.battleDiceRoll, this.accumulator);

  final BattleDiceRoll battleDiceRoll;
  final BattleAccumulatedHits accumulator;

  static BattleNodeState initialState() {
    return const BattleNodeState(BattleDiceRoll.defaultValues, BattleAccumulatedHits.initialValues);
  }

  BattleNodeState withAttackerDie(Die newAttackerDieFace) {
    return withDie(
      newAttackerDieFace,
      battleDiceRoll.attackerDiceRoll,
      (BattleDiceRoll roll, DiceRoll dice) => roll.withAttackerDiceRoll(dice),
    );
  }

  BattleNodeState withDefenderDie(Die newDefenderDieFace) {
    return withDie(
      newDefenderDieFace,
      battleDiceRoll.defenderDiceRoll,
      (BattleDiceRoll roll, DiceRoll dice) => roll.withDefenderDiceRoll(dice),
    );
  }

  BattleNodeState withAccumulatedHits(BattleAccumulatedHits accumulatedHits) {
    return BattleNodeState(battleDiceRoll, accumulatedHits);
  }

  BattleNodeState withDie(Die die, DiceRoll diceRoll, BattleDiceRoll Function(BattleDiceRoll, DiceRoll) updater) {
    switch (die) {
      case Die.sword:
        return BattleNodeState(updater(battleDiceRoll, diceRoll.addSword()), accumulator);
      case Die.shield:
        return BattleNodeState(updater(battleDiceRoll, diceRoll.addShield()), accumulator);
      case Die.star:
        return BattleNodeState(updater(battleDiceRoll, diceRoll.addStar()), accumulator);
    }
  }
}
