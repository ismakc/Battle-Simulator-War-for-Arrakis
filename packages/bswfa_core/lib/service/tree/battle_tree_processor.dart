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
    final BattleNodeState updatedState = state.withAccumulatedHits(
      BattleAccumulatedHits(
        attackerHits: attackerHits,
        defenderHits: defenderHits,
        squaredAttackerHits: attackerHits * attackerHits,
        squaredDefenderHits: defenderHits * defenderHits,
      ),
    );
    return memo.put(state.battleDiceRoll.fullDiceRollBitMask(), updatedState);
  }

  BattleNodeState updateNodeState(BattleNodeState state, List<BattleNodeState> childStates) {
    final BattleAccumulatedHits newAccumulatedHits = childStates
        .map((BattleNodeState e) => e.accumulator)
        .reduce((BattleAccumulatedHits a, BattleAccumulatedHits b) => a.add(b));
    final BattleNodeState updatedState = state.withAccumulatedHits(newAccumulatedHits);
    return memo.put(state.battleDiceRoll.fullDiceRollBitMask(), updatedState);
  }

  BattleNodeState? memoization(BattleNodeState state) {
    if (memo.containsKey(state.battleDiceRoll.fullDiceRollBitMask())) {
      return memo.get(state.battleDiceRoll.fullDiceRollBitMask());
    } else {
      return null;
    }
  }
}
