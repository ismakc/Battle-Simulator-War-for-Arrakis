import 'dart:math';

import 'package:bswfa_core/domain/legion/named_leader.dart';

part 'attacking_legion.dart';
part 'defending_legion.dart';

sealed class Legion {
  const Legion({
    required this.genericLeaders,
    required this.regularUnits,
    required this.eliteUnits,
    required this.specialEliteUnits,
    required this.usedCards,
    required this.namedLeaders,
  });

  final int genericLeaders;
  final int regularUnits;
  final int eliteUnits;
  final int specialEliteUnits;
  final int usedCards;
  final List<NamedLeader> namedLeaders;

  /// Only useful for DefendingLegion. This variable is always zero for AttackingLegion
  int get _settlementLevel;

  /// Only useful for AttackingLegion. This variable is always false for DefendingLegion
  bool get _surpriseAttack;

  int get totalUnits => regularUnits + eliteUnits + specialEliteUnits;

  int get totalLeaders => genericLeaders + namedLeaders.length;

  int get lifeCount => regularUnits + eliteUnits * 2 + specialEliteUnits * 2 + totalLeaders;

  int get diceCount => min(6, totalUnits + usedCards + _settlementLevel);

  int get unlimitedDiceCount => totalUnits + usedCards + _settlementLevel;

  int get starsCount => min(diceCount + (_surpriseAttack ? 1 : 0), totalLeaders);

  int get unlimitedStarsCount => totalLeaders;

  Legion copyWith({
    int? genericLeaders,
    int? regularUnits,
    int? eliteUnits,
    int? specialEliteUnits,
    int? usedCards,
    List<NamedLeader>? namedLeaders,
  });
}
