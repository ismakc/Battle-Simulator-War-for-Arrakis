import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_statistic.dart';

/// Resumen de UI para una sola ronda de combate.
///
/// Conserva el escenario original y la estadística calculada para poder
/// mostrar el resultado de la ronda y relanzar desde ahí una simulación
/// automática completa si el usuario lo pide.
class RoundBattleSummary {
  const RoundBattleSummary({required this.scenario, required this.statistic});

  final BattleScenario scenario;
  final BattleStatistic statistic;
}
