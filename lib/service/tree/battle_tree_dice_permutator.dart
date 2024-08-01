import 'package:bswfa/domain/roll/die.dart';
import 'package:bswfa/service/tree/battle_node_state.dart';
import 'package:bswfa/service/tree/battle_tree_processor.dart';
import 'package:bswfa/service/tree/node.dart';

class BattleTreeDicePermutator {
  BattleTreeDicePermutator(this.battleTreeProcessor);

  final BattleTreeProcessor battleTreeProcessor;

  Node<BattleNodeState> createBattleTree() {
    final Node<BattleNodeState> rootNode = Node<BattleNodeState>(BattleNodeState.initialState());
    buildBattleTree(
      rootNode,
      battleTreeProcessor.scenario.attackingLegion.diceCount,
      battleTreeProcessor.scenario.defendingLegion.diceCount,
    );
    return rootNode;
  }

  void buildBattleTree(Node<BattleNodeState> node, int attackerDiceCount, int defenderDiceCount) {
    if (attackerDiceCount > 0) {
      buildChildNodes(
        node,
        attackerDiceCount - 1,
        defenderDiceCount,
        (BattleNodeState state, Die die) => state.withAttackerDie(die),
      );
      postProcessParentNode(node);
    } else if (defenderDiceCount > 0) {
      buildChildNodes(
        node,
        attackerDiceCount,
        defenderDiceCount - 1,
        (BattleNodeState state, Die die) => state.withDefenderDie(die),
      );
      postProcessParentNode(node);
    } else {
      processLeafNode(node);
    }
  }

  void buildChildNodes(
    Node<BattleNodeState> node,
    int attackerDiceCount,
    int defenderDiceCount,
    BattleNodeState Function(BattleNodeState, Die) stateUpdater,
  ) {
    for (final Die face in Die.faces) {
      final BattleNodeState nextState = stateUpdater(node.value, face);
      final BattleNodeState? memoizedState = battleTreeProcessor.memoization(nextState);
      if (memoizedState != null) {
        node.addNodeChild(memoizedState);
        // Skipping already calculated state
      } else {
        final Node<BattleNodeState> childNode = node.addNodeChild(nextState);
        buildBattleTree(childNode, attackerDiceCount, defenderDiceCount);
      }
    }
  }

  void processLeafNode(Node<BattleNodeState> node) {
    final BattleNodeState updatedState = battleTreeProcessor.processLeafState(node.value);
    node.updateNodeValue(updatedState);
  }

  void postProcessParentNode(Node<BattleNodeState> node) {
    final List<BattleNodeState> childrenStates =
        node.children.map((Node<BattleNodeState> child) => child.value).toList();
    final BattleNodeState updatedState = battleTreeProcessor.updateNodeState(node.value, childrenStates);
    node.updateNodeValue(updatedState);
  }
}
