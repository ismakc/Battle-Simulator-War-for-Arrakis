import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_statistic.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_result.freezed.dart';

@freezed
abstract class BattleResult with _$BattleResult {
  const BattleResult._();

  const factory BattleResult({
    required int playedCombatRounds,
    required BattleScenario scenario,
    required BattleStatistic statistic,
  }) = _BattleResult;

  String winner() {
    final Legion attackingLegion = scenario.attackingLegion;
    final Legion defendingLegion = scenario.defendingLegion;
    ;
    if (attackingLegion.lifeCount > defendingLegion.lifeCount) {
      return 'Attacker';
    } else if (attackingLegion.lifeCount < defendingLegion.lifeCount) {
      return 'Defender';
    } else {
      return 'Draw';
    }
  }
}
