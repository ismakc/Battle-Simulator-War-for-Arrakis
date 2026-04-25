import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/result/automatic_battle_end_reason.dart';

/// Define cuándo la app da por terminado un combate al resolverlo
/// automáticamente sin más intervención del jugador.
class AutomaticBattleEndPolicy {
  const AutomaticBattleEndPolicy._();

  static AutomaticBattleEndReason? resolveEndReason({
    required BattleScenario currentScenario,
    required double totalAttackerExpectedHits,
  }) {
    final AutomaticBattleEndReason? destructionEndReason =
        _resolveDestructionEndReason(currentScenario);

    if (destructionEndReason != null) {
      return destructionEndReason;
    }

    if (_isAttackerUnableToContinue(
      currentScenario: currentScenario,
      totalAttackerExpectedHits: totalAttackerExpectedHits,
    )) {
      return AutomaticBattleEndReason.attackerUnableToContinue;
    }

    return null;
  }

  /// Devuelve el motivo de finalización si alguna legión ha sido destruida.
  static AutomaticBattleEndReason? _resolveDestructionEndReason(
    BattleScenario scenario,
  ) {
    final bool attackerDestroyed = scenario.attackingLegion.totalUnits == 0;
    final bool defenderDestroyed = scenario.defendingLegion.totalUnits == 0;

    if (attackerDestroyed && defenderDestroyed) {
      return AutomaticBattleEndReason.mutualDestruction;
    }

    if (defenderDestroyed) {
      return AutomaticBattleEndReason.defenderDestroyed;
    }

    if (attackerDestroyed) {
      return AutomaticBattleEndReason.attackerDestroyed;
    }

    return null;
  }

  /// La política automática actual considera que el atacante ya no puede
  /// continuar cuando los impactos esperados acumulados del defensor superan
  /// la capacidad total de absorción de la legión atacante.
  ///
  /// Esta es una heurística de la app, no una regla literal del juego.
  static bool _isAttackerUnableToContinue({
    required BattleScenario currentScenario,
    required double totalAttackerExpectedHits,
  }) {
    return totalAttackerExpectedHits >
        currentScenario.attackingLegion.totalUnits +
            currentScenario.attackingLegion.totalLeaders;
  }
}
