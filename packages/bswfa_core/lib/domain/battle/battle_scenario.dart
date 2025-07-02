import 'package:bswfa_core/domain/legion/attacking_legion.dart';
import 'package:bswfa_core/domain/legion/defending_legion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_scenario.freezed.dart';

@freezed
abstract class BattleScenario with _$BattleScenario {
  const factory BattleScenario({required AttackingLegion attackingLegion, required DefendingLegion defendingLegion}) =
      _BattleScenario;

  static const BattleScenario defaultValues = BattleScenario(
    attackingLegion: AttackingLegion.defaultValues,
    defendingLegion: DefendingLegion.defaultValues,
  );
}
