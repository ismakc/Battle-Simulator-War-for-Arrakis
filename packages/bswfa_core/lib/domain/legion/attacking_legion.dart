part of 'legion.dart';

class AttackingLegion extends Legion {
  const AttackingLegion({
    required super.genericLeaders,
    required super.regularUnits,
    required super.eliteUnits,
    required super.specialEliteUnits,
    required super.usedCards,
    required super.namedLeaders,
    required this.surpriseAttack,
  });

  const AttackingLegion.empty()
      : this(
          genericLeaders: 0,
          regularUnits: 0,
          eliteUnits: 0,
          specialEliteUnits: 0,
          usedCards: 0,
          namedLeaders: const <NamedLeader>[],
          surpriseAttack: false,
        );

  final bool surpriseAttack;

  @override
  int get _settlementLevel => 0;

  @override
  bool get _surpriseAttack => surpriseAttack;

  @override
  AttackingLegion copyWith({
    int? genericLeaders,
    int? regularUnits,
    int? eliteUnits,
    int? specialEliteUnits,
    int? usedCards,
    List<NamedLeader>? namedLeaders,
    bool? surpriseAttack,
  }) {
    return AttackingLegion(
      genericLeaders: genericLeaders ?? this.genericLeaders,
      regularUnits: regularUnits ?? this.regularUnits,
      eliteUnits: eliteUnits ?? this.eliteUnits,
      specialEliteUnits: specialEliteUnits ?? this.specialEliteUnits,
      usedCards: usedCards ?? this.usedCards,
      namedLeaders: namedLeaders ?? List<NamedLeader>.unmodifiable(this.namedLeaders),
      surpriseAttack: surpriseAttack ?? this.surpriseAttack,
    );
  }
}
