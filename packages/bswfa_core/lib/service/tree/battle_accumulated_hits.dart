class BattleHitsAccumulator {
  const BattleHitsAccumulator({
    required this.attackerHits,
    required this.squaredAttackerHits,
    required this.defenderHits,
    required this.squaredDefenderHits,
  });

  const BattleHitsAccumulator.empty()
      : this(
          attackerHits: 0,
          squaredAttackerHits: 0,
          defenderHits: 0,
          squaredDefenderHits: 0,
        );

  final int attackerHits;
  final int squaredAttackerHits;
  final int defenderHits;
  final int squaredDefenderHits;

  BattleHitsAccumulator accumulate(BattleHitsAccumulator other) {
    return copyWith(
      attackerHits: attackerHits + other.attackerHits,
      squaredAttackerHits: squaredAttackerHits + other.squaredAttackerHits,
      defenderHits: defenderHits + other.defenderHits,
      squaredDefenderHits: squaredDefenderHits + other.squaredDefenderHits,
    );
  }

  BattleHitsAccumulator copyWith({
    int? attackerHits,
    int? squaredAttackerHits,
    int? defenderHits,
    int? squaredDefenderHits,
  }) {
    return BattleHitsAccumulator(
      attackerHits: attackerHits ?? this.attackerHits,
      squaredAttackerHits: squaredAttackerHits ?? this.squaredAttackerHits,
      defenderHits: defenderHits ?? this.defenderHits,
      squaredDefenderHits: squaredDefenderHits ?? this.squaredDefenderHits,
    );
  }
}
