import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_statistic.freezed.dart';

@freezed
abstract class BattleStatistic with _$BattleStatistic {
  const BattleStatistic._();

  const factory BattleStatistic({
    @Default(.0) double attackerExpectedHits,
    @Default(.0) double attackerStdDeviationHits,
    @Default(.0) double defenderExpectedHits,
    @Default(.0) double defenderStdDeviationHits,
  }) = _BattleStatistic;
}
