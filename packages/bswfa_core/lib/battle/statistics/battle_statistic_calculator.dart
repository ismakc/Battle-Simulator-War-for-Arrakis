import 'dart:math' as math;

import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_statistic.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_accumulated_hits.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_node_state.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_node_state_cache.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_node_state_resolver.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_state_tree_resolver.dart';
import 'package:bswfa_core/roll/battle_die.dart';

/// Calcula las estadísticas de un combate a partir de la resolución exhaustiva
/// de todas las combinaciones posibles de tiradas.
class BattleStatisticCalculator {
  BattleStatisticCalculator._();

  static BattleStatistic calculate(BattleScenario scenario) {
    final BattleAccumulatedHits accumulatedHits = _resolveAccumulatedHits(
      scenario,
    );
    final int totalOutcomes = _calculateTotalOutcomes(scenario);

    return _buildBattleStatistic(accumulatedHits, totalOutcomes);
  }

  static BattleAccumulatedHits _resolveAccumulatedHits(
    BattleScenario scenario,
  ) {
    final BattleNodeStateCache<int, BattleNodeState> stateCache =
        InMemoryBattleNodeStateCache<int, BattleNodeState>();

    final BattleNodeStateResolver nodeStateResolver = BattleNodeStateResolver(
      scenario,
      stateCache,
    );

    final BattleStateTreeResolver stateTreeResolver = BattleStateTreeResolver(
      nodeStateResolver,
      attackerDiceCount: scenario.attackingLegion.diceCount,
      defenderDiceCount: scenario.defendingLegion.diceCount,
    );

    return stateTreeResolver.resolveAccumulatedHits();
  }

  static BattleStatistic _buildBattleStatistic(
    BattleAccumulatedHits accumulatedHits,
    int totalOutcomes,
  ) {
    final ({double expectedHits, double hitsStdDeviation}) attackerStatistics =
        _buildHitsStatistics(
          hits: accumulatedHits.attackerHits,
          squaredHits: accumulatedHits.squaredAttackerHits,
          totalOutcomes: totalOutcomes,
        );

    final ({double expectedHits, double hitsStdDeviation}) defenderStatistics =
        _buildHitsStatistics(
          hits: accumulatedHits.defenderHits,
          squaredHits: accumulatedHits.squaredDefenderHits,
          totalOutcomes: totalOutcomes,
        );

    return BattleStatistic(
      attackerExpectedHits: attackerStatistics.expectedHits,
      attackerHitsStdDeviation: attackerStatistics.hitsStdDeviation,
      defenderExpectedHits: defenderStatistics.expectedHits,
      defenderHitsStdDeviation: defenderStatistics.hitsStdDeviation,
    );
  }

  static ({double expectedHits, double hitsStdDeviation}) _buildHitsStatistics({
    required int hits,
    required int squaredHits,
    required int totalOutcomes,
  }) {
    final double exactExpectedHits = _calculateExactExpectedHits(
      hits,
      totalOutcomes,
    );

    return (
      expectedHits: _roundToTwoDecimals(exactExpectedHits),
      hitsStdDeviation: _calculateHitsStdDeviation(
        squaredHits,
        exactExpectedHits,
        totalOutcomes,
      ),
    );
  }

  static double _calculateExactExpectedHits(int hits, int totalOutcomes) {
    return hits / totalOutcomes;
  }

  static double _calculateHitsStdDeviation(
    int squaredHits,
    double exactExpectedHits,
    int totalOutcomes,
  ) {
    final double variance =
        (squaredHits / totalOutcomes) - (exactExpectedHits * exactExpectedHits);
    final double nonNegativeVariance = math.max(0, variance);
    final double stdDeviation = math.sqrt(nonNegativeVariance);

    return _roundToTwoDecimals(stdDeviation);
  }

  static double _roundToTwoDecimals(double value) {
    return double.parse(value.toStringAsFixed(2));
  }

  static int _calculateTotalOutcomes(BattleScenario scenario) {
    return math
        .pow(
          BattleDie.faces.length,
          scenario.attackingLegion.diceCount +
              scenario.defendingLegion.diceCount,
        )
        .toInt();
  }
}
