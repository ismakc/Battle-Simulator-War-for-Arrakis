import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_side_contribution.freezed.dart';

@freezed
abstract class BattleSideContribution with _$BattleSideContribution {
  const BattleSideContribution._();

  const factory BattleSideContribution({
    @Default(0) int swords,
    @Default(0) int shields,
    @Default(0) int starSwords,
    @Default(0) int starShields,
  }) = _BattleSideContribution;

  int get totalSwords => swords + starSwords;

  int get totalShields => shields + starShields;
}
