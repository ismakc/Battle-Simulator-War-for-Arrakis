import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_statistic.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_loss_application_policy.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_round_policy.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_round_resolution.dart';
import 'package:bswfa_core/battle/statistics/battle_statistic_calculator.dart';
import 'package:bswfa_core/legion/legion.dart';

/// Resuelve una ronda automática completa:
/// calcula impactos esperados de la ronda actual y aplica la política
/// automática de la app para obtener el escenario de la ronda siguiente.
class AutomaticBattleRoundResolver {
  const AutomaticBattleRoundResolver();

  AutomaticBattleRoundResolution resolve({
    required BattleScenario currentScenario,
    required int nextRoundNumber,
  }) {
    final BattleScenario preparedScenario =
        AutomaticBattleRoundPolicy.prepareNextAutomaticRoundScenario(
          currentScenario,
          nextRoundNumber,
        );

    final BattleStatistic roundStatistic = BattleStatisticCalculator.calculate(
      preparedScenario,
    );

    final AttackingLegion attackerAfterCombatHits =
        AutomaticBattleLossApplicationPolicy.resolveAttackerCombatLosses(
          preparedScenario.attackingLegion,
          roundStatistic.defenderExpectedHits,
        );
    final DefendingLegion defenderAfterCombatHits =
        AutomaticBattleLossApplicationPolicy.resolveDefenderLosses(
          preparedScenario.defendingLegion,
          roundStatistic.attackerExpectedHits,
        );

    final bool battleCanContinue =
        attackerAfterCombatHits.totalUnits > 0 &&
        defenderAfterCombatHits.totalUnits > 0;

    final AttackingLegion attackerAfterContinuationHit =
        battleCanContinue && defenderAfterCombatHits.settlementLevel > 0
        ? AutomaticBattleLossApplicationPolicy.resolveAttackerContinuationLoss(
            attackerAfterCombatHits,
          )
        : attackerAfterCombatHits;

    final BattleScenario nextScenario = preparedScenario.copyWith(
      attackingLegion: attackerAfterContinuationHit,
      defendingLegion: defenderAfterCombatHits,
    );

    return AutomaticBattleRoundResolution(
      roundStatistic: roundStatistic,
      nextScenario: nextScenario,
    );
  }
}
