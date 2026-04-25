import 'package:bswfa_core/roll/battle_dice_roll.dart';
import 'package:bswfa_core/roll/battle_die.dart';
import 'package:bswfa_core/roll/dice_roll.dart';
import 'package:bswfa_core/service/tree/battle_accumulated_hits.dart';

/// Estado inmutable de un nodo durante la permutación de tiradas.
///
/// Combina la tirada parcial de atacante y defensor con los impactos
/// acumulados hasta ese punto del árbol.
class BattleNodeState {
  /// Crea un estado con la tirada actual y los impactos acumulados.
  const BattleNodeState(this.battleDiceRoll, this.accumulatedHits);

  /// Tirada compuesta de atacante y defensor para este nodo.
  final BattleDiceRoll battleDiceRoll;

  /// Impactos acumulados durante el recorrido de este nodo.
  final BattleAccumulatedHits accumulatedHits;

  /// Estado inicial del árbol: tirada vacía e impactos a cero.
  static BattleNodeState initialState() {
    return const BattleNodeState(
      BattleDiceRoll(),
      BattleAccumulatedHits.zero,
    );
  }

  /// Devuelve una nueva instancia añadiendo una cara al atacante.
  BattleNodeState withAttackerDie(BattleDie newAttackerDieFace) {
    return _withDie(
      newAttackerDieFace,
      battleDiceRoll.attackerDiceRoll,
      (roll, dice) => roll.copyWith(attackerDiceRoll: dice),
    );
  }

  /// Devuelve una nueva instancia añadiendo una cara al defensor.
  BattleNodeState withDefenderDie(BattleDie newDefenderDieFace) {
    return _withDie(
      newDefenderDieFace,
      battleDiceRoll.defenderDiceRoll,
      (roll, dice) => roll.copyWith(defenderDiceRoll: dice),
    );
  }

  /// Devuelve una nueva instancia con impactos acumulados actualizados.
  BattleNodeState withAccumulatedHits(BattleAccumulatedHits accumulatedHits) {
    return BattleNodeState(battleDiceRoll, accumulatedHits);
  }

  BattleNodeState _withDie(
    BattleDie die,
    DiceRoll diceRoll,
    BattleDiceRoll Function(BattleDiceRoll, DiceRoll) updater,
  ) {
    switch (die) {
      case BattleDie.sword:
        return BattleNodeState(
          updater(battleDiceRoll, diceRoll.addSword()),
          accumulatedHits,
        );
      case BattleDie.shield:
        return BattleNodeState(
          updater(battleDiceRoll, diceRoll.addShield()),
          accumulatedHits,
        );
      case BattleDie.star:
        return BattleNodeState(
          updater(battleDiceRoll, diceRoll.addStar()),
          accumulatedHits,
        );
    }
  }
}
