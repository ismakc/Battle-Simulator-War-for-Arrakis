import 'package:bswfa_core/legion/legion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_scenario.freezed.dart';

/// Representa el escenario de entrada de un combate entre una legión atacante
/// y una legión defensora.
@freezed
abstract class BattleScenario with _$BattleScenario {
  const factory BattleScenario({
    @Default(AttackingLegion()) AttackingLegion attackingLegion,
    @Default(DefendingLegion()) DefendingLegion defendingLegion,
  }) = _BattleScenario;
}
