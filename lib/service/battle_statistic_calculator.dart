import 'dart:math' as math;

import 'package:bswfa/domain/battle_scenario.dart';
import 'package:bswfa/domain/battle_statistic.dart';
import 'package:bswfa/domain/die.dart';
import 'package:bswfa/service/tree/battle_node_state.dart';
import 'package:bswfa/service/tree/battle_tree_dice_permutator.dart';
import 'package:bswfa/service/tree/battle_tree_processor.dart';
import 'package:bswfa/service/tree/node.dart';

class BattleStatisticCalculator {
  BattleStatisticCalculator._(); // Private constructor to prevent instantiation

  static BattleStatistic createBattleStatistic(BattleScenario battleScenario) {
    final BattleTreeDicePermutator permutator = BattleTreeDicePermutator(BattleTreeProcessor(battleScenario));
    final Node<BattleNodeState> battleTree = permutator.createBattleTree();
    final BattleNodeState finalState = battleTree.value;

    final double occurrences = totalOccurrences(battleScenario);
    final attackerExpectedHits = calculateAttackerExpectedHits(finalState, occurrences);
    final double attackerStdDeviationHits = calculateAttackerStdDevHits(finalState, attackerExpectedHits, occurrences);
    final double defenderExpectedHits = calculateDefenderExpectedHits(finalState, occurrences);
    final double defenderStdDeviationHits = calculateDefenderStdDevHits(finalState, defenderExpectedHits, occurrences);

    return BattleStatistic.empty.copyWith(
      battleScenario: battleScenario,
      attackerHits: attackerExpectedHits,
      squaredAttackerHits: attackerStdDeviationHits,
      defenderHits: defenderExpectedHits,
      squaredDefenderHits: defenderStdDeviationHits,
    );
  }

  static double calculateAttackerExpectedHits(BattleNodeState finalState, double occurrences) {
    final double attackerHits = finalState.battleStatistic.attackerHits;
    final double result = attackerHits / occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static double calculateAttackerStdDevHits(
    BattleNodeState finalState,
    double attackerExpectedHits,
    double occurrences,
  ) {
    final double attackerHits = finalState.battleStatistic.attackerHits;
    final double squaredAttackerHits = finalState.battleStatistic.squaredAttackerHits;
    final double result = (squaredAttackerHits +
            occurrences * (attackerExpectedHits * attackerExpectedHits) -
            2 * attackerExpectedHits * attackerHits) /
        occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static double calculateDefenderExpectedHits(BattleNodeState finalState, double occurrences) {
    final double defenderHits = finalState.battleStatistic.defenderHits;
    final double result = defenderHits / occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static double calculateDefenderStdDevHits(
    BattleNodeState finalState,
    double defenderExpectedHits,
    double occurrences,
  ) {
    final double defenderHits = finalState.battleStatistic.defenderHits;
    final double squaredDefenderHits = finalState.battleStatistic.squaredDefenderHits;
    final double result = (squaredDefenderHits +
            occurrences * (defenderExpectedHits * defenderExpectedHits) -
            2 * defenderExpectedHits * defenderHits) /
        occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static double totalOccurrences(BattleScenario battleScenario) {
    return math
        .pow(
          Die.faces.length,
          battleScenario.attackingLegion.diceCount + battleScenario.defendingLegion.diceCount,
        )
        .toDouble();
  }
}
