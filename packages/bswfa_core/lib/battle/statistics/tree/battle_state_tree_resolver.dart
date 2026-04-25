import 'package:bswfa_core/battle/statistics/tree/battle_accumulated_hits.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_node_state.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_node_state_resolver.dart';
import 'package:bswfa_core/roll/battle_die.dart';

/// Resuelve el estado agregado del combate explorando todas las tiradas
/// posibles y reutilizando estados ya resueltos cuando existen en cache.
class BattleStateTreeResolver {
  BattleStateTreeResolver(
    this.nodeStateResolver, {
    required int attackerDiceCount,
    required int defenderDiceCount,
  }) : initialDiceCounts = (
         attacker: attackerDiceCount,
         defender: defenderDiceCount,
       );

  final BattleNodeStateResolver nodeStateResolver;
  final ({int attacker, int defender}) initialDiceCounts;

  BattleAccumulatedHits resolveAccumulatedHits() {
    return _resolveState(
      BattleNodeState.initialState(),
      initialDiceCounts.attacker,
      initialDiceCounts.defender,
    ).accumulatedHits;
  }

  BattleNodeState _resolveState(
    BattleNodeState state,
    int remainingAttackerDice,
    int remainingDefenderDice,
  ) {
    if (remainingAttackerDice > 0) {
      return _expandRoll(
        state,
        remainingAttackerDice: remainingAttackerDice - 1,
        remainingDefenderDice: remainingDefenderDice,
        nextStateBuilder: (BattleNodeState currentState, BattleDie die) =>
            currentState.withAttackerDie(die),
      );
    }

    if (remainingDefenderDice > 0) {
      return _expandRoll(
        state,
        remainingAttackerDice: remainingAttackerDice,
        remainingDefenderDice: remainingDefenderDice - 1,
        nextStateBuilder: (BattleNodeState currentState, BattleDie die) =>
            currentState.withDefenderDie(die),
      );
    }

    return nodeStateResolver.resolveLeafState(state);
  }

  BattleNodeState _expandRoll(
    BattleNodeState state, {
    required int remainingAttackerDice,
    required int remainingDefenderDice,
    required BattleNodeState Function(BattleNodeState, BattleDie)
    nextStateBuilder,
  }) {
    final List<BattleNodeState> childStates = _buildChildStates(
      state,
      remainingAttackerDice,
      remainingDefenderDice,
      nextStateBuilder,
    );

    return nodeStateResolver.resolveParentState(state, childStates);
  }

  List<BattleNodeState> _buildChildStates(
    BattleNodeState state,
    int remainingAttackerDice,
    int remainingDefenderDice,
    BattleNodeState Function(BattleNodeState, BattleDie) nextStateBuilder,
  ) {
    final List<BattleNodeState> childStates = <BattleNodeState>[];

    for (final BattleDie face in BattleDie.faces) {
      final BattleNodeState nextState = nextStateBuilder(state, face);
      final BattleNodeState resolvedChildState = _resolveChildState(
        nextState,
        remainingAttackerDice,
        remainingDefenderDice,
      );
      childStates.add(resolvedChildState);
    }

    return childStates;
  }

  BattleNodeState _resolveChildState(
    BattleNodeState nextState,
    int remainingAttackerDice,
    int remainingDefenderDice,
  ) {
    final BattleNodeState? memoizedState = nodeStateResolver.getCachedState(
      nextState,
    );

    if (memoizedState != null) {
      // Se omite el cálculo de un estado ya resuelto.
      return memoizedState;
    }

    return _resolveState(
      nextState,
      remainingAttackerDice,
      remainingDefenderDice,
    );
  }
}
