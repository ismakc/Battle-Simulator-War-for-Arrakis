import 'package:bswfa_core/legion/legion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_scenario.freezed.dart';

@freezed
abstract class BattleScenario with _$BattleScenario {
  const factory BattleScenario({
    @Default(AttackingLegion()) AttackingLegion attackingLegion,
    @Default(DefendingLegion()) DefendingLegion defendingLegion,
  }) = _BattleScenario;
}
