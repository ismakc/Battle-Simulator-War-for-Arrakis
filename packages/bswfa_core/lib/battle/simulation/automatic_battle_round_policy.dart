import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/legion/legion.dart';

/// Define cómo prepara la app las rondas posteriores cuando el combate se
/// sigue resolviendo automáticamente sin nueva intervención del jugador.
class AutomaticBattleRoundPolicy {
  const AutomaticBattleRoundPolicy._();

  /// Prepara el escenario para la siguiente ronda automática.
  ///
  /// - El ataque sorpresa solo aplica en la primera ronda por reglas del juego.
  /// - Las cartas usadas se reinician por la política actual de la app:
  ///   las rondas posteriores no solicitan nuevas cartas al jugador.
  static BattleScenario prepareNextAutomaticRoundScenario(
    BattleScenario scenario,
    int playedRounds,
  ) {
    if (playedRounds != 2) {
      return scenario;
    }

    return scenario.copyWith(
      attackingLegion: _prepareAttackingLegionForNextRound(
        scenario.attackingLegion,
      ),
      defendingLegion: _prepareDefendingLegionForNextRound(
        scenario.defendingLegion,
      ),
    );
  }

  /// El ataque sorpresa desaparece tras la primera ronda por reglas del juego.
  /// Las cartas usadas se reinician por la política actual de simulación.
  static AttackingLegion _prepareAttackingLegionForNextRound(
    AttackingLegion legion,
  ) {
    return legion.copyWith(usedCards: 0, surpriseAttack: false);
  }

  /// Las cartas usadas se reinician por la política actual de simulación.
  static DefendingLegion _prepareDefendingLegionForNextRound(
    DefendingLegion legion,
  ) {
    return legion.copyWith(usedCards: 0);
  }
}
