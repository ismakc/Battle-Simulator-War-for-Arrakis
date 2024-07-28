import 'package:bswfa/domain/battle_scenario.dart';
import 'package:bswfa/domain/battle_statistic.dart';
import 'package:bswfa/service/battle_hits_calculator.dart';
import 'package:bswfa/service/tree/battle_node_state.dart';

class BattleTreeProcessor {
  BattleTreeProcessor(this.battleScenario);

  final MemoizationCache<int, BattleNodeState> memo = MemoizationCache<int, BattleNodeState>();
  final BattleScenario battleScenario;

  BattleNodeState processLeafState(BattleNodeState state) {
    final double attackerHits =
        BattleHitsCalculator.calculateAttackerHits(battleScenario.attackingLegion, state.battleDiceRoll);
    final double defenderHits =
        BattleHitsCalculator.calculateDefenderHits(battleScenario.defendingLegion, state.battleDiceRoll);
    final BattleNodeState updatedState = state.withBattleStatistic(
      BattleStatistic(
        attackerHits: attackerHits,
        defenderHits: defenderHits,
        squaredAttackerHits: attackerHits * attackerHits,
        squaredDefenderHits: defenderHits * defenderHits,
      ),
    );
    return memo.put(state.battleDiceRoll.fullDiceRollBitMask(), updatedState);
  }

  BattleNodeState updateNodeState(BattleNodeState state, List<BattleNodeState> childStates) {
    final BattleStatistic newBattleStatistic = childStates.map((e) => e.battleStatistic).reduce((a, b) => a.add(b));
    final BattleNodeState updatedState = state.withBattleStatistic(newBattleStatistic);
    return memo.put(state.battleDiceRoll.fullDiceRollBitMask(), updatedState);
  }

  BattleNodeState? memoization(BattleNodeState state) {
    if (memo.containsKey(state.battleDiceRoll.fullDiceRollBitMask())) {
      return memo.get(state.battleDiceRoll.fullDiceRollBitMask());
    } else {
      return null;
    }
  }

  int getAttackerDiceCount() {
    return battleScenario.attackingLegion.diceCount;
  }

  int getDefenderDiceCount() {
    return battleScenario.defendingLegion.diceCount;
  }
}

class MemoizationCache<K, V> {
  final Map<K, V> _cache = {};

  V? get(K key) {
    return _cache[key];
  }

  V put(K key, V value) {
    _cache[key] = value;
    return value;
  }

  bool containsKey(K key) {
    return _cache.containsKey(key);
  }
}
