import 'dart:math';

import 'package:bswfa/domain/named_leader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'defending_legion.freezed.dart';

@freezed
class DefendingLegion with _$DefendingLegion {
  const DefendingLegion._();

  const factory DefendingLegion({
    @Default(0) int genericLeaders,
    @Default(0) int regularUnits,
    @Default(0) int eliteUnits,
    @Default(0) int specialEliteUnits,
    @Default(0) int usedCards,
    @Default([]) List<NamedLeader> namedLeaders,
    @Default(0) int settlementLevel,
  }) = _DefendingLegion;

  factory DefendingLegion.defaultValues() => const DefendingLegion();

  int diceCount() {
    return min(6, regularUnits + eliteUnits + specialEliteUnits + usedCards + settlementLevel);
  }

  int maxStarsCount() {
    return min(diceCount(), genericLeaders + namedLeaders.length);
  }

  int unlimitedMaxStarsCount() {
    return genericLeaders + namedLeaders.length;
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
