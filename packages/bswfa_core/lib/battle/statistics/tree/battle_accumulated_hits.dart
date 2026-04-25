import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_accumulated_hits.freezed.dart';

@freezed
abstract class BattleAccumulatedHits with _$BattleAccumulatedHits {
  const BattleAccumulatedHits._();

  const factory BattleAccumulatedHits({
    required int attackerHits,
    required int squaredAttackerHits,
    required int defenderHits,
    required int squaredDefenderHits,
  }) = _AccumulatedHits;

  static const BattleAccumulatedHits zero = BattleAccumulatedHits(
    attackerHits: 0,
    defenderHits: 0,
    squaredAttackerHits: 0,
    squaredDefenderHits: 0,
  );

  BattleAccumulatedHits add(BattleAccumulatedHits other) {
    return copyWith(
      attackerHits: attackerHits + other.attackerHits,
      defenderHits: defenderHits + other.defenderHits,
      squaredAttackerHits: squaredAttackerHits + other.squaredAttackerHits,
      squaredDefenderHits: squaredDefenderHits + other.squaredDefenderHits,
    );
  }
}
