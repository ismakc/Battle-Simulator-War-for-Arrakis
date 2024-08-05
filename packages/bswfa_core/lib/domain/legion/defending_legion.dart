part of 'legion.dart';

class DefendingLegion extends Legion {
  const DefendingLegion({
    required super.genericLeaders,
    required super.regularUnits,
    required super.eliteUnits,
    required super.specialEliteUnits,
    required super.usedCards,
    required super.namedLeaders,
    required this.settlementLevel,
  });

  const DefendingLegion.empty()
      : this(
          genericLeaders: 0,
          regularUnits: 0,
          eliteUnits: 0,
          specialEliteUnits: 0,
          usedCards: 0,
          namedLeaders: const <NamedLeader>[],
          settlementLevel: 0,
        );

  final int settlementLevel;

  @override
  bool get _surpriseAttack => false;

  @override
  int get _settlementLevel => settlementLevel;

  @override
  DefendingLegion copyWith({
    int? genericLeaders,
    int? regularUnits,
    int? eliteUnits,
    int? specialEliteUnits,
    int? usedCards,
    List<NamedLeader>? namedLeaders,
    int? settlementLevel,
  }) {
    return DefendingLegion(
      genericLeaders: genericLeaders ?? this.genericLeaders,
      regularUnits: regularUnits ?? this.regularUnits,
      eliteUnits: eliteUnits ?? this.eliteUnits,
      specialEliteUnits: specialEliteUnits ?? this.specialEliteUnits,
      usedCards: usedCards ?? this.usedCards,
      namedLeaders: namedLeaders ?? List<NamedLeader>.unmodifiable(this.namedLeaders),
      settlementLevel: settlementLevel ?? this.settlementLevel,
    );
  }
}
