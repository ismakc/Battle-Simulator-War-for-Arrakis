import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_statistic.dart';
import 'package:bswfa_core/battle/result/automatic_battle_end_reason.dart';
import 'package:bswfa_core/battle/result/battle_winner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_result.freezed.dart';

@freezed
abstract class BattleResult with _$BattleResult {
  const BattleResult._();

  const factory BattleResult({
    required int playedCombatRounds,
    required AutomaticBattleEndReason endReason,
    required BattleScenario resultingScenario,
    required BattleStatistic statistic,
  }) = _BattleResult;

  bool get isCombatResolved =>
      endReason != AutomaticBattleEndReason.notResolved;

  BattleWinner? winner() {
    switch (endReason) {
      case AutomaticBattleEndReason.notResolved:
        return null;
      case AutomaticBattleEndReason.defenderDestroyed:
        return BattleWinner.attacker;
      case AutomaticBattleEndReason.attackerDestroyed:
      case AutomaticBattleEndReason.attackerUnableToContinue:
        return BattleWinner.defender;
      case AutomaticBattleEndReason.mutualDestruction:
        return BattleWinner.draw;
    }
  }
}
