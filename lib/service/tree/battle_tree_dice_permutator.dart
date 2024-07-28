import 'package:bswfa/domain/die.dart';
import 'package:bswfa/service/tree/battle_node_state.dart';
import 'package:bswfa/service/tree/battle_tree_processor.dart';
import 'package:bswfa/service/tree/node.dart';

class BattleTreeDicePermutator {
  BattleTreeDicePermutator(this.battleTreeProcessor);

  final BattleTreeProcessor battleTreeProcessor;

  Node<BattleNodeState> createBattleTree() {
    final Node<BattleNodeState> rootNode = Node(BattleNodeState.initialState());
    buildBattleTree(rootNode, battleTreeProcessor.getAttackerDiceCount(), battleTreeProcessor.getDefenderDiceCount());
    return rootNode;
  }

  void buildBattleTree(Node<BattleNodeState> node, int attackerDiceCount, int defenderDiceCount) {
    if (attackerDiceCount > 0) {
      buildChildNodes(node, attackerDiceCount - 1, defenderDiceCount, (state, die) => state.withAttackerDie(die));
      processParentNode(node);
    } else if (defenderDiceCount > 0) {
      buildChildNodes(node, attackerDiceCount, defenderDiceCount - 1, (state, die) => state.withDefenderDie(die));
      processParentNode(node);
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

  void processParentNode(Node<BattleNodeState> node) {
    final List<BattleNodeState> childrenStates = node.children.map((child) => child.value).toList();
    final BattleNodeState updatedState = battleTreeProcessor.updateNodeState(node.value, childrenStates);
    node.updateNodeValue(updatedState);
  }
}
