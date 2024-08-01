import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_statistic.freezed.dart';

@freezed
class BattleStatistic with _$BattleStatistic {
  const BattleStatistic._();

  const factory BattleStatistic({
    required double attackerExpectedHits,
    required double attackerStdDeviationHits,
    required double defenderExpectedHits,
    required double defenderStdDeviationHits,
  }) = _BattleStatistic;

  static const BattleStatistic defaultValues = BattleStatistic(
    attackerExpectedHits: .0,
    defenderExpectedHits: .0,
    attackerStdDeviationHits: .0,
    defenderStdDeviationHits: .0,
  );

  BattleStatistic add(BattleStatistic val) {
    return copyWith(
      attackerExpectedHits: attackerExpectedHits + val.attackerExpectedHits,
      defenderExpectedHits: defenderExpectedHits + val.defenderExpectedHits,
      attackerStdDeviationHits: attackerStdDeviationHits + val.attackerStdDeviationHits,
      defenderStdDeviationHits: defenderStdDeviationHits + val.defenderStdDeviationHits,
    );
  }
}
