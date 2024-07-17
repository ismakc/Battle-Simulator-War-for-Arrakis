import 'package:bswfa/domain/attacking_legion.dart';
import 'package:bswfa/domain/defending_legion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_result.freezed.dart';

@freezed
class BattleResult with _$BattleResult {
  const factory BattleResult({
    required double attackerExpectedHits,
    required double defenderExpectedHits,
    required AttackingLegion attackingLegion,
    required DefendingLegion defendingLegion,
  }) = _BattleStatistic;
}
