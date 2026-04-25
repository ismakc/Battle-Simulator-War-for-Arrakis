import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_statistic.freezed.dart';

/// Resume las estadísticas de impactos de un combate para atacante y defensor,
/// incluyendo impactos esperados y desviación estándar de esos impactos.
///
/// No representa directamente las bajas finales, ya que la conversión de
/// impactos en bajas depende de la política aplicada posteriormente.
@freezed
abstract class BattleStatistic with _$BattleStatistic {
  const BattleStatistic._();

  const factory BattleStatistic({
    @Default(.0) double attackerExpectedHits,
    @Default(.0) double attackerHitsStdDeviation,
    @Default(.0) double defenderExpectedHits,
    @Default(.0) double defenderHitsStdDeviation,
  }) = _BattleStatistic;
}