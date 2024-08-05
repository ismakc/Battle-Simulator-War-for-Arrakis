import 'package:bswfa_core/domain/roll/battle_dice_roll.dart';
import 'package:bswfa_core/service/tree/battle_accumulated_hits.dart';

class BattleNodeState {
  const BattleNodeState(this.battleDiceRoll, this.accumulator);

  const BattleNodeState.empty()
      : battleDiceRoll = const BattleDiceRoll.empty(),
        accumulator = const BattleHitsAccumulator.empty();

  final BattleDiceRoll battleDiceRoll;
  final BattleHitsAccumulator accumulator;

  BattleNodeState copyWith({
    BattleDiceRoll? battleDiceRoll,
    BattleHitsAccumulator? accumulator,
  }) {
    return BattleNodeState(
      battleDiceRoll ?? this.battleDiceRoll,
      accumulator ?? this.accumulator,
    );
  }
}
