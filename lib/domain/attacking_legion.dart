import 'dart:math';

import 'package:bswfa/domain/named_leader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attacking_legion.freezed.dart';

@freezed
class AttackingLegion with _$AttackingLegion {
  const AttackingLegion._();

  const factory AttackingLegion({
    @Default(0) int genericLeaders,
    @Default(0) int regularUnits,
    @Default(0) int eliteUnits,
    @Default(0) int specialEliteUnits,
    @Default(0) int usedCards,
    @Default([]) List<NamedLeader> namedLeaders,
    @Default(false) bool surpriseAttack,
  }) = _AttackingLegion;

  factory AttackingLegion.defaultValues() => const AttackingLegion();

  int diceCount() {
    return min(6, regularUnits + eliteUnits + specialEliteUnits + usedCards);
  }

  int maxStarsCount() {
    return min(diceCount(), genericLeaders + namedLeaders.length + (surpriseAttack ? 1 : 0));
  }

  int unlimitedMaxStarsCount() {
    return genericLeaders + namedLeaders.length + (surpriseAttack ? 1 : 0);
  }

  int lifeCount() {
    return regularUnits + eliteUnits * 2 + specialEliteUnits * 2 + genericLeaders + namedLeaders.length;
  }

  int totalUnits() {
    return regularUnits + eliteUnits + specialEliteUnits;
  }

  int totalLeaders() {
    return genericLeaders + namedLeaders.length;
  }
}
