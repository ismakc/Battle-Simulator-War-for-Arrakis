import 'package:bswfa/domain/battle_scenario.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_statistic.freezed.dart';

@freezed
class BattleStatistic with _$BattleStatistic {
  const BattleStatistic._();

  const factory BattleStatistic({
    required double attackerHits,
    required double defenderHits,
    required double squaredAttackerHits,
    required double squaredDefenderHits,
    @Default(BattleScenario.defaultValues) BattleScenario battleScenario,
  }) = _BattleStatistic;

  static const BattleStatistic empty =
      BattleStatistic(attackerHits: 0, defenderHits: 0, squaredAttackerHits: 0, squaredDefenderHits: 0);

  BattleStatistic add(BattleStatistic val) {
    return copyWith(
      attackerHits: attackerHits + val.attackerHits,
      defenderHits: defenderHits + val.defenderHits,
      squaredAttackerHits: squaredAttackerHits + val.squaredAttackerHits,
      squaredDefenderHits: squaredDefenderHits + val.squaredDefenderHits,
    );
  }

  @override
  String toString() {
    return '''
    {
      "AttackerHits": $attackerHits,
      "DefenderHits": $defenderHits,
      "SquaredAttackerHits": $squaredAttackerHits,
      "SquaredDefenderHits": $squaredDefenderHits
    }
    ''';
  }
}
