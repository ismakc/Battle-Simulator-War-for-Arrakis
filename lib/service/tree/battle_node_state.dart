import 'package:bswfa/domain/battle_dice_roll.dart';
import 'package:bswfa/domain/battle_statistic.dart';
import 'package:bswfa/domain/dice_roll.dart';
import 'package:bswfa/domain/die.dart';

class BattleNodeState {
  const BattleNodeState(this.battleDiceRoll, this.battleStatistic);

  final BattleDiceRoll battleDiceRoll;
  final BattleStatistic battleStatistic;

  static BattleNodeState initialState() {
    return const BattleNodeState(BattleDiceRoll.empty, BattleStatistic.empty);
  }

  BattleNodeState withAttackerDie(Die newAttackerDieFace) {
    return withDie(
      newAttackerDieFace,
      battleDiceRoll.attackerDiceRoll,
      (roll, dice) => roll.withAttackerDiceRoll(dice),
    );
  }

  BattleNodeState withDefenderDie(Die newDefenderDieFace) {
    return withDie(
      newDefenderDieFace,
      battleDiceRoll.defenderDiceRoll,
      (roll, dice) => roll.withDefenderDiceRoll(dice),
    );
  }

  BattleNodeState withBattleStatistic(BattleStatistic battleStatistic) {
    return BattleNodeState(battleDiceRoll, battleStatistic);
  }

  BattleNodeState withDie(Die die, DiceRoll diceRoll, BattleDiceRoll Function(BattleDiceRoll, DiceRoll) updater) {
    switch (die) {
      case Die.sword:
        return BattleNodeState(updater(battleDiceRoll, diceRoll.withAddedSword()), battleStatistic);
      case Die.shield:
        return BattleNodeState(updater(battleDiceRoll, diceRoll.withAddedShield()), battleStatistic);
      case Die.star:
        return BattleNodeState(updater(battleDiceRoll, diceRoll.withAddedStar()), battleStatistic);
    }
  }
}
