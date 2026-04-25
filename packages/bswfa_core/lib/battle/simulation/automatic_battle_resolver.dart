import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/result/automatic_battle_end_reason.dart';
import 'package:bswfa_core/battle/result/battle_result.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_end_policy.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_round_resolution.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_round_resolver.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_state.dart';

/// Resuelve automáticamente un combate completo a partir de un escenario
/// inicial, simulando rondas sucesivas sin intervención adicional del jugador.
class AutomaticBattleResolver {
  const AutomaticBattleResolver({
    this.roundResolver = const AutomaticBattleRoundResolver(),
  });

  final AutomaticBattleRoundResolver roundResolver;

  BattleResult resolve(BattleScenario initialScenario) {
    AutomaticBattleState state = AutomaticBattleState.initial(initialScenario);
    AutomaticBattleEndReason? endReason;

    while (endReason == null) {
      final AutomaticBattleRoundResolution roundResolution = roundResolver
          .resolve(
            currentScenario: state.currentScenario,
            nextRoundNumber: state.playedCombatRounds + 1,
          );

      state = state.nextRound(
        nextScenario: roundResolution.nextScenario,
        roundStatistic: roundResolution.roundStatistic,
      );

      endReason = AutomaticBattleEndPolicy.resolveEndReason(
        currentScenario: state.currentScenario,
        totalDefenderExpectedHits: state.totalDefenderExpectedHits,
      );
    }

    return state.buildResult(endReason: endReason);
  }
}
