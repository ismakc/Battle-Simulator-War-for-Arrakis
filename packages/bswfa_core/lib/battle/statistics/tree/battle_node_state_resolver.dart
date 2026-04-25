import 'package:bswfa_core/battle/battle_hits_calculator.dart';
import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_accumulated_hits.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_node_state.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_node_state_cache.dart';

/// Resuelve estados de combate, calculando impactos en hojas, agregando
/// resultados en estados padre y reutilizando estados ya cacheados.
class BattleNodeStateResolver {
  BattleNodeStateResolver(this.scenario, this.stateCache);

  final BattleScenario scenario;
  final BattleNodeStateCache<int, BattleNodeState> stateCache;

  BattleNodeState resolveLeafState(BattleNodeState state) {
    final BattleAccumulatedHits accumulatedHits = _calculateLeafHits(state);
    final BattleNodeState updatedState = state.withAccumulatedHits(
      accumulatedHits,
    );

    return _cacheState(updatedState);
  }

  BattleNodeState resolveParentState(
    BattleNodeState state,
    List<BattleNodeState> childStates,
  ) {
    final BattleAccumulatedHits aggregatedHits = childStates
        .map((BattleNodeState childState) => childState.accumulatedHits)
        .reduce(
          (
            BattleAccumulatedHits left,
            BattleAccumulatedHits right,
          ) => left.add(right),
        );

    final BattleNodeState updatedState = state.withAccumulatedHits(
      aggregatedHits,
    );

    return _cacheState(updatedState);
  }

  BattleNodeState? getCachedState(BattleNodeState state) {
    return stateCache[state.battleDiceRoll.cacheKey];
  }

  BattleAccumulatedHits _calculateLeafHits(BattleNodeState state) {
    final BattleHitsCalculator hitsCalculator = BattleHitsCalculator();
    final (int attackerHits, int defenderHits) = hitsCalculator.calculateHits(
      scenario,
      state.battleDiceRoll,
    );

    return BattleAccumulatedHits(
      attackerHits: attackerHits,
      defenderHits: defenderHits,
      squaredAttackerHits: attackerHits * attackerHits,
      squaredDefenderHits: defenderHits * defenderHits,
    );
  }

  BattleNodeState _cacheState(BattleNodeState state) {
    stateCache[state.battleDiceRoll.cacheKey] = state;
    return state;
  }
}
