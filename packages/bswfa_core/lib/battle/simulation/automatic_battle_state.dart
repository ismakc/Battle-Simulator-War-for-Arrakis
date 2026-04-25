import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_statistic.dart';
import 'package:bswfa_core/battle/result/automatic_battle_end_reason.dart';
import 'package:bswfa_core/battle/result/battle_result.dart';

/// Estado acumulado de una simulación automática de combate.
class AutomaticBattleState {
  const AutomaticBattleState({
    required this.currentScenario,
    required this.playedCombatRounds,
    required this.totalAttackerExpectedHits,
    required this.totalDefenderExpectedHits,
  });

  factory AutomaticBattleState.initial(BattleScenario initialScenario) {
    return AutomaticBattleState(
      currentScenario: initialScenario,
      playedCombatRounds: 0,
      totalAttackerExpectedHits: 0,
      totalDefenderExpectedHits: 0,
    );
  }

  final BattleScenario currentScenario;
  final int playedCombatRounds;
  final double totalAttackerExpectedHits;
  final double totalDefenderExpectedHits;

  AutomaticBattleState nextRound({
    required BattleScenario nextScenario,
    required BattleStatistic roundStatistic,
  }) {
    return AutomaticBattleState(
      currentScenario: nextScenario,
      playedCombatRounds: playedCombatRounds + 1,
      totalAttackerExpectedHits:
          totalAttackerExpectedHits + roundStatistic.attackerExpectedHits,
      totalDefenderExpectedHits:
          totalDefenderExpectedHits + roundStatistic.defenderExpectedHits,
    );
  }

  BattleResult buildResult({required AutomaticBattleEndReason endReason}) {
    return BattleResult(
      playedCombatRounds: playedCombatRounds,
      endReason: endReason,
      statistic: BattleStatistic(
        attackerExpectedHits: totalAttackerExpectedHits,
        attackerHitsStdDeviation: 0.0,
        defenderExpectedHits: totalDefenderExpectedHits,
        defenderHitsStdDeviation: 0.0,
      ),
      resultingScenario: currentScenario,
    );
  }
}
