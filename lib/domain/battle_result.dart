import 'package:bswfa/domain/attacking_legion.dart';
import 'package:bswfa/domain/battle_scenario.dart';
import 'package:bswfa/domain/battle_statistic.dart';
import 'package:bswfa/domain/defending_legion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_result.freezed.dart';

@freezed
class BattleResult with _$BattleResult {
  const BattleResult._();

  const factory BattleResult({
    required int rounds,
    required double attackerExpectedHits,
    required double defenderExpectedHits,
    double? squaredAttackerHits,
    double? squaredDefenderHits,
    required BattleScenario battleScenario,
  }) = _BattleStatistic;

  factory BattleResult.from(BattleStatistic battleStatistic) => BattleResult(
        rounds: 1,
        attackerExpectedHits: battleStatistic.attackerHits,
        defenderExpectedHits: battleStatistic.defenderHits,
        battleScenario: battleStatistic.battleScenario,
      );

  static const BattleResult defaultValues = BattleResult(
    rounds: 0,
    attackerExpectedHits: 0.0,
    defenderExpectedHits: 0.0,
    battleScenario: BattleScenario.defaultValues,
  );

  AttackingLegion get attackingLegion => battleScenario.attackingLegion;

  DefendingLegion get defendingLegion => battleScenario.defendingLegion;

  String winner() {
    final AttackingLegion attackingLegion = battleScenario.attackingLegion;
    final DefendingLegion defendingLegion = battleScenario.defendingLegion;
    if (attackingLegion.lifeCount > defendingLegion.lifeCount) {
      return 'Attacker';
    } else if (attackingLegion.lifeCount < defendingLegion.lifeCount) {
      return 'Defender';
    } else {
      return 'Draw';
    }
  }
}
