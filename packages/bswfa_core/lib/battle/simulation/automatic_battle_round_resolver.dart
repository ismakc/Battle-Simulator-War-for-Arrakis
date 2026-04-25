import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_statistic.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_loss_application_policy.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_round_policy.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_round_resolution.dart';
import 'package:bswfa_core/battle/statistics/battle_statistic_calculator.dart';

/// Resuelve una ronda automática completa:
/// calcula impactos esperados de la ronda actual y aplica la política
/// automática de la app para obtener el escenario de la ronda siguiente.
class AutomaticBattleRoundResolver {
  const AutomaticBattleRoundResolver();

  AutomaticBattleRoundResolution resolve({
    required BattleScenario currentScenario,
    required int nextRoundNumber,
  }) {
    final BattleStatistic roundStatistic = BattleStatisticCalculator.calculate(
      currentScenario,
    );

    final BattleScenario preparedScenario =
        AutomaticBattleRoundPolicy.prepareNextAutomaticRoundScenario(
          currentScenario,
          nextRoundNumber,
        );

    final BattleScenario nextScenario = preparedScenario.copyWith(
      attackingLegion:
          AutomaticBattleLossApplicationPolicy.resolveAttackerLosses(
            preparedScenario.attackingLegion,
            roundStatistic.defenderExpectedHits,
            mustTakeSettlementHitToContinue:
                preparedScenario.defendingLegion.settlementLevel > 0,
          ),
      defendingLegion:
          AutomaticBattleLossApplicationPolicy.resolveDefenderLosses(
            preparedScenario.defendingLegion,
            roundStatistic.attackerExpectedHits,
          ),
    );

    return AutomaticBattleRoundResolution(
      roundStatistic: roundStatistic,
      nextScenario: nextScenario,
    );
  }
}
