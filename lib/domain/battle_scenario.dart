import 'package:freezed_annotation/freezed_annotation.dart';

import 'attacking_legion.dart';
import 'defending_legion.dart';

part 'battle_scenario.freezed.dart';

@freezed
class BattleScenario with _$BattleScenario {
  const BattleScenario._();

  const factory BattleScenario({
    required AttackingLegion attackingLegion,
    required DefendingLegion defendingLegion,
  }) = _BattleScenario;

  factory BattleScenario.defaultValues() => BattleScenario(
        attackingLegion: AttackingLegion.defaultValues(),
        defendingLegion: DefendingLegion.defaultValues(),
      );
}
