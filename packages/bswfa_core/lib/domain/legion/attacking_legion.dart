import 'dart:math';

import 'package:bswfa_core/domain/legion/named_leader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attacking_legion.freezed.dart';

@freezed
abstract class AttackingLegion with _$AttackingLegion {
  const AttackingLegion._();

  const factory AttackingLegion({
    @Default(0) int genericLeaders,
    @Default(0) int regularUnits,
    @Default(0) int eliteUnits,
    @Default(0) int specialEliteUnits,
    @Default(0) int usedCards,
    @Default(<NamedLeader>[]) List<NamedLeader> namedLeaders,
    @Default(false) bool surpriseAttack,
  }) = _AttackingLegion;

  static const AttackingLegion defaultValues = AttackingLegion();

  int get diceCount {
    return min(6, regularUnits + eliteUnits + specialEliteUnits + usedCards);
  }

  int get maxStarsCount {
    return min(diceCount, genericLeaders + namedLeaders.length + (surpriseAttack ? 1 : 0));
  }

  int get unlimitedMaxStarsCount {
    return genericLeaders + namedLeaders.length + (surpriseAttack ? 1 : 0);
  }

  int get lifeCount {
    return regularUnits + eliteUnits * 2 + specialEliteUnits * 2 + genericLeaders + namedLeaders.length;
  }

  int get totalUnits {
    return regularUnits + eliteUnits + specialEliteUnits;
  }

  int get totalLeaders {
    return genericLeaders + namedLeaders.length;
  }

  int get unlimitedMaxDiceCount {
    return regularUnits + eliteUnits + specialEliteUnits + usedCards;
  }
}
