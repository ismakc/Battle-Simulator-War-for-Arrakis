import 'package:freezed_annotation/freezed_annotation.dart';

import 'attacking_legion.dart';
import 'defending_legion.dart';

part 'battle_scenario.freezed.dart';

@freezed
class BattleScenario with _$BattleScenario {
  const factory BattleScenario({
    int? id,
    required AttackingLegion attackingLegion,
    required DefendingLegion defendingLegion,
  }) = _BattleScenario;

  static const BattleScenario defaultValues = BattleScenario(
    attackingLegion: AttackingLegion.defaultValues,
    defendingLegion: DefendingLegion.defaultValues,
  );
}
