import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_statistic.dart';

/// Resultado de resolver una ronda automática completa a partir de un
/// escenario dado.
///
/// Incluye tanto la estadística de impactos de la ronda como el escenario ya
/// transformado para la siguiente ronda automática según la política actual de
/// la app.
class AutomaticBattleRoundResolution {
  const AutomaticBattleRoundResolution({
    required this.roundStatistic,
    required this.nextScenario,
  });

  final BattleStatistic roundStatistic;
  final BattleScenario nextScenario;
}
