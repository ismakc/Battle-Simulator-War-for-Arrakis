import 'package:bswfa_core/domain/battle/battle_scenario.dart';
import 'package:bswfa_core/domain/battle/battle_statistic.dart';
import 'package:bswfa_core/domain/legion/attacking_legion.dart';
import 'package:bswfa_core/domain/legion/defending_legion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_result.freezed.dart';

@freezed
class BattleResult with _$BattleResult {
  const BattleResult._();

  const factory BattleResult({
    required int playedCombatRounds,
    required BattleScenario scenario,
    required BattleStatistic statistic,
  }) = _BattleStatistic;

  static const BattleResult defaultValues = BattleResult(
    playedCombatRounds: 0,
    scenario: BattleScenario.defaultValues,
    statistic: BattleStatistic.defaultValues,
  );

  AttackingLegion get attackingLegion => scenario.attackingLegion;

  DefendingLegion get defendingLegion => scenario.defendingLegion;

  String winner() {
    final AttackingLegion attackingLegion = scenario.attackingLegion;
    final DefendingLegion defendingLegion = scenario.defendingLegion;
    if (attackingLegion.lifeCount > defendingLegion.lifeCount) {
      return 'Attacker';
    } else if (attackingLegion.lifeCount < defendingLegion.lifeCount) {
      return 'Defender';
    } else {
      return 'Draw';
    }
  }
}
