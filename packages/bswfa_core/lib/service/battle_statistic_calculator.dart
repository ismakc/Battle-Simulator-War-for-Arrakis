import 'dart:math' as math;

import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_statistic.dart';
import 'package:bswfa_core/roll/battle_die.dart';
import 'package:bswfa_core/service/tree/battle_node_state.dart';
import 'package:bswfa_core/service/tree/battle_tree_dice_permutator.dart';
import 'package:bswfa_core/service/tree/battle_tree_processor.dart';
import 'package:bswfa_core/service/tree/cache.dart';
import 'package:bswfa_core/service/tree/node.dart';

/// Una clase que calcula las estadísticas de una batalla dada un escenario de
/// batalla. Utiliza un árbol de batalla para procesar todas las combinaciones
/// posibles de resultados de dados y acumula las estadísticas necesarias para
/// calcular el número esperado de golpes y la desviación estándar para el
/// atacante y el defensor.
class BattleStatisticCalculator {
  BattleStatisticCalculator._();

  static BattleStatistic calc(BattleScenario scenario) {
    final Cache<int, BattleNodeState> cache = Cache<int, BattleNodeState>.create();

    final BattleTreeProcessor battleTreeProcessor = BattleTreeProcessor(
      scenario,
      cache,
    );

    final BattleTreeDicePermutator permutator = BattleTreeDicePermutator(
      battleTreeProcessor,
    );

    final Node<BattleNodeState> battleTree = permutator.createBattleTree();

    final BattleNodeState finalState = battleTree.value;

    final int occurrences = _totalOccurrences(scenario);

    final double attackerExpectedHits = _calcAttackerExpectedHits(
      finalState,
      occurrences,
    );

    final double attackerStdDeviationHits = _calcAttackerStdDevHits(
      finalState,
      attackerExpectedHits,
      occurrences,
    );

    final double defenderExpectedHits = _calcDefenderExpectedHits(
      finalState,
      occurrences,
    );

    final double defenderStdDeviationHits = _calcDefenderStdDevHits(
      finalState,
      defenderExpectedHits,
      occurrences,
    );

    return BattleStatistic(
      attackerExpectedHits: attackerExpectedHits,
      attackerStdDeviationHits: attackerStdDeviationHits,
      defenderExpectedHits: defenderExpectedHits,
      defenderStdDeviationHits: defenderStdDeviationHits,
    );
  }

  static double _calcAttackerExpectedHits(
    BattleNodeState finalState,
    int occurrences,
  ) {
    final int attackerHits = finalState.accumulator.attackerHits;
    final double result = attackerHits / occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static double _calcAttackerStdDevHits(
    BattleNodeState finalState,
    double attackerExpectedHits,
    int occurrences,
  ) {
    final int attackerHits = finalState.accumulator.attackerHits;
    final int squaredAttackerHits = finalState.accumulator.squaredAttackerHits;
    final double result =
        (squaredAttackerHits +
            occurrences * (attackerExpectedHits * attackerExpectedHits) -
            2 * attackerExpectedHits * attackerHits) /
        occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static double _calcDefenderExpectedHits(
    BattleNodeState finalState,
    int occurrences,
  ) {
    final int defenderHits = finalState.accumulator.defenderHits;
    final double result = defenderHits / occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static double _calcDefenderStdDevHits(
    BattleNodeState finalState,
    double defenderExpectedHits,
    int occurrences,
  ) {
    final int defenderHits = finalState.accumulator.defenderHits;
    final int squaredDefenderHits = finalState.accumulator.squaredDefenderHits;
    final double result =
        (squaredDefenderHits +
            occurrences * (defenderExpectedHits * defenderExpectedHits) -
            2 * defenderExpectedHits * defenderHits) /
        occurrences;
    return double.parse(result.toStringAsFixed(2));
  }

  static int _totalOccurrences(BattleScenario battleScenario) {
    return math
        .pow(
          BattleDie.faces.length,
          battleScenario.attackingLegion.diceCount +
              battleScenario.defendingLegion.diceCount,
        )
        .toInt();
  }
}
