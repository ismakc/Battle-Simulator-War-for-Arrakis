class BattleStatistic {
  const BattleStatistic({
    required this.attackerExpectedHits,
    required this.attackerStdDevHits,
    required this.defenderExpectedHits,
    required this.defenderStdDevHits,
  });

  const BattleStatistic.empty()
      : this(
          attackerExpectedHits: 0.0,
          defenderExpectedHits: 0.0,
          attackerStdDevHits: 0.0,
          defenderStdDevHits: 0.0,
        );

  final double attackerExpectedHits;
  final double attackerStdDevHits;
  final double defenderExpectedHits;
  final double defenderStdDevHits;

  BattleStatistic add(BattleStatistic val) {
    return copyWith(
      attackerExpectedHits: attackerExpectedHits + val.attackerExpectedHits,
      defenderExpectedHits: defenderExpectedHits + val.defenderExpectedHits,
      attackerStdDevHits: attackerStdDevHits + val.attackerStdDevHits,
      defenderStdDevHits: defenderStdDevHits + val.defenderStdDevHits,
    );
  }

  BattleStatistic copyWith({
    double? attackerExpectedHits,
    double? attackerStdDevHits,
    double? defenderExpectedHits,
    double? defenderStdDevHits,
  }) {
    return BattleStatistic(
      attackerExpectedHits: attackerExpectedHits ?? this.attackerExpectedHits,
      attackerStdDevHits: attackerStdDevHits ?? this.attackerStdDevHits,
      defenderExpectedHits: defenderExpectedHits ?? this.defenderExpectedHits,
      defenderStdDevHits: defenderStdDevHits ?? this.defenderStdDevHits,
    );
  }
}
