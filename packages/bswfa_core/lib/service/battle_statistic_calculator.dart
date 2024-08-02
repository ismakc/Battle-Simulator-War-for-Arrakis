import 'dart:math' as math;

import 'package:bswfa_core/domain/battle/battle_scenario.dart';
import 'package:bswfa_core/domain/battle/battle_statistic.dart';
import 'package:bswfa_core/domain/roll/die.dart';
import 'package:bswfa_core/service/battle_hits_calculator.dart';
import 'package:bswfa_core/service/tree/battle_node_state.dart';
import 'package:bswfa_core/service/tree/battle_tree_dice_permutator.dart';
import 'package:bswfa_core/service/tree/battle_tree_processor.dart';
import 'package:bswfa_core/service/tree/cache.dart';
import 'package:bswfa_core/service/tree/node.dart';

class BattleStatisticCalculator {
  BattleStatisticCalculator._();

  static BattleStatistic calc(BattleScenario scenario) {
    final BattleHitsCalculator hitsCalculator = BattleHitsCalculator.instance;
    final Cache<int, BattleNodeState> cache = Cache<int, BattleNodeState>.create();
    final BattleTreeProcessor battleTreeProcessor = BattleTreeProcessor(scenario, hitsCalculator, cache);
    final BattleTreeDicePermutator permutator = BattleTreeDicePermutator(battleTreeProcessor);

    final Node<BattleNodeState> battleTree = permutator.createBattleTree();
    final BattleNodeState finalState = battleTree.value;

    final int occurrences = totalOccurrences(scenario);

    final double attackerExpectedHits = calcAttackerExpectedHits(finalState, occurrences);
    final double attackerStdDeviationHits = calcAttackerStdDevHits(finalState, attackerExpectedHits, occurrences);

    final double defenderExpectedHits = calcDefenderExpectedHits(finalState, occurrences);
    final double defenderStdDeviationHits = calcDefenderStdDevHits(finalState, defenderExpectedHits, occurrences);

    return BattleStatistic(
      attackerExpectedHits: attackerExpectedHits,
      attackerStdDeviationHits: attackerStdDeviationHits,
      defenderExpectedHits: defenderExpectedHits,
      defenderStdDeviationHits: defenderStdDeviationHits,
    );
  }

  static double calcAttackerExpectedHits(BattleNodeState finalState, int occurrences) {
    final int attackerHits = finalState.accumulator.attackerHits;
    final double result = attackerHits / occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static double calcAttackerStdDevHits(
    BattleNodeState finalState,
    double attackerExpectedHits,
    int occurrences,
  ) {
    final int attackerHits = finalState.accumulator.attackerHits;
    final int squaredAttackerHits = finalState.accumulator.squaredAttackerHits;
    final double result = (squaredAttackerHits +
            occurrences * (attackerExpectedHits * attackerExpectedHits) -
            2 * attackerExpectedHits * attackerHits) /
        occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static double calcDefenderExpectedHits(BattleNodeState finalState, int occurrences) {
    final int defenderHits = finalState.accumulator.defenderHits;
    final double result = defenderHits / occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static double calcDefenderStdDevHits(
    BattleNodeState finalState,
    double defenderExpectedHits,
    int occurrences,
  ) {
    final int defenderHits = finalState.accumulator.defenderHits;
    final int squaredDefenderHits = finalState.accumulator.squaredDefenderHits;
    final double result = (squaredDefenderHits +
            occurrences * (defenderExpectedHits * defenderExpectedHits) -
            2 * defenderExpectedHits * defenderHits) /
        occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static int totalOccurrences(BattleScenario battleScenario) {
    return math
        .pow(
          Die.faces.length,
          battleScenario.attackingLegion.diceCount + battleScenario.defendingLegion.diceCount,
        )
        .toInt();
  }
}
