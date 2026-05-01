import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_side_contribution.freezed.dart';

/// Representa la aportación ofensiva y defensiva de un bando en una tirada de
/// combate, distinguiendo entre resultados directos y resultados generados
/// al activar habilidades de líderes mediante estrellas.
@freezed
abstract class BattleSideContribution with _$BattleSideContribution {
  const BattleSideContribution._();

  const factory BattleSideContribution({
    @Default(0) int swords,
    @Default(0) int shields,
    @Default(0) int leaderActivatedSwords,
    @Default(0) int leaderActivatedShields,
  }) = _BattleSideContribution;

  int get totalSwords => swords + leaderActivatedSwords;

  int get totalShields => shields + leaderActivatedShields;
}
