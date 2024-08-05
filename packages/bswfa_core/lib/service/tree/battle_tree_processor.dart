import 'package:bswfa_core/domain/battle/battle_scenario.dart';
import 'package:bswfa_core/service/battle_hits_calculator.dart';
import 'package:bswfa_core/service/tree/battle_accumulated_hits.dart';
import 'package:bswfa_core/service/tree/battle_node_state.dart';
import 'package:bswfa_core/service/tree/cache.dart';

class BattleTreeProcessor {
  BattleTreeProcessor(this.scenario, this.hitsCalculator, this.memo);

  final BattleScenario scenario;
  final BattleHitsCalculator hitsCalculator;
  final Cache<int, BattleNodeState> memo;

  BattleNodeState processLeafState(BattleNodeState state) {
    final (int attackerHits, int defenderHits) = hitsCalculator.calculateHits(scenario, state.battleDiceRoll);
    final BattleNodeState updatedState = state.copyWith(
      accumulator: BattleHitsAccumulator(
        attackerHits: attackerHits,
        defenderHits: defenderHits,
        squaredAttackerHits: attackerHits * attackerHits,
        squaredDefenderHits: defenderHits * defenderHits,
      ),
    );
    memo.put(state.battleDiceRoll.combinedBitMask, updatedState);
    return updatedState;
  }

  BattleNodeState updateNodeState(BattleNodeState state, List<BattleNodeState> childStates) {
    final BattleHitsAccumulator newAccumulatedHits = childStates
        .map((BattleNodeState e) => e.accumulator)
        .reduce((BattleHitsAccumulator a, BattleHitsAccumulator b) => a.accumulate(b));
    final BattleNodeState updatedState = state.copyWith(accumulator: newAccumulatedHits);
    memo.put(state.battleDiceRoll.combinedBitMask, updatedState);
    return updatedState;
  }

  BattleNodeState? memoization(BattleNodeState state) {
    if (memo.hasKey(state.battleDiceRoll.combinedBitMask)) {
      return memo.get(state.battleDiceRoll.combinedBitMask);
    } else {
      return null;
    }
  }
}
