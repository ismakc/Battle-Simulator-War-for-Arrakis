import 'dart:math';

import 'package:bswfa/domain/legion/attacking_legion.dart';
import 'package:bswfa/domain/legion/defending_legion.dart';
import 'package:bswfa/domain/legion/named_leader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'legion.freezed.dart';

@freezed
class Legion with _$Legion {
  const Legion._();

  const factory Legion({
    @Default(0) int genericLeaders,
    @Default(0) int regularUnits,
    @Default(0) int eliteUnits,
    @Default(0) int specialEliteUnits,
    @Default(0) int usedCards,
    @Default(<NamedLeader>[]) List<NamedLeader> namedLeaders,
  }) = _Legion;

  factory Legion.fromAttackingLegion(AttackingLegion attackingLegion) {
    return Legion(
      genericLeaders: attackingLegion.genericLeaders,
      regularUnits: attackingLegion.regularUnits,
      eliteUnits: attackingLegion.eliteUnits,
      specialEliteUnits: attackingLegion.specialEliteUnits,
      usedCards: attackingLegion.usedCards,
      namedLeaders: List<NamedLeader>.from(attackingLegion.namedLeaders),
    );
  }

  factory Legion.fromDefendingLegion(DefendingLegion defendingLegion) {
    return Legion(
      genericLeaders: defendingLegion.genericLeaders,
      regularUnits: defendingLegion.regularUnits,
      eliteUnits: defendingLegion.eliteUnits,
      specialEliteUnits: defendingLegion.specialEliteUnits,
      usedCards: defendingLegion.usedCards,
      namedLeaders: List<NamedLeader>.from(defendingLegion.namedLeaders),
    );
  }

  static const Legion defaultValues = Legion();

  AttackingLegion overwriteAttackingLegionWithLegion(
    AttackingLegion attackingLegion,
  ) {
    return attackingLegion.copyWith(
      genericLeaders: genericLeaders,
      regularUnits: regularUnits,
      eliteUnits: eliteUnits,
      specialEliteUnits: specialEliteUnits,
      usedCards: usedCards,
      namedLeaders: List<NamedLeader>.from(namedLeaders),
    );
  }

  DefendingLegion overwriteDefendingLegionWithLegion(DefendingLegion defendingLegion) {
    return defendingLegion.copyWith(
      genericLeaders: genericLeaders,
      regularUnits: regularUnits,
      eliteUnits: eliteUnits,
      specialEliteUnits: specialEliteUnits,
      usedCards: usedCards,
      namedLeaders: List<NamedLeader>.from(namedLeaders),
    );
  }

  int get diceCount {
    return min(6, regularUnits + eliteUnits + specialEliteUnits + usedCards);
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

  Legion calculateOptimalLoss() {
    final Map<String, Legion?> damagedLegions = <String, Legion?>{
      'minusLeader': genericLeaders == 0 ? null : copyWith(genericLeaders: genericLeaders - 1),
      'minusRegular': regularUnits == 0 ? null : copyWith(regularUnits: regularUnits - 1),
      'minusElite': eliteUnits == 0 ? null : copyWith(regularUnits: regularUnits + 1, eliteUnits: eliteUnits - 1),
      'minusSpecial': specialEliteUnits == 0
          ? null
          : copyWith(regularUnits: regularUnits + 1, specialEliteUnits: specialEliteUnits - 1),
      'minusNamed': namedLeaders.isEmpty
          ? null
          : copyWith(
              namedLeaders: List<NamedLeader>.from(namedLeaders)
                ..sort(
                  (NamedLeader a, NamedLeader b) =>
                      b.attack != a.attack ? b.attack.compareTo(a.attack) : b.defense.compareTo(a.defense),
                )
                ..removeLast(),
            ),
    };

    MapEntry<String, Legion?>? selectedEntry;
    int? maxValue;

    for (final MapEntry<String, Legion?> entry in damagedLegions.entries) {
      final Legion? legion = entry.value;
      if (legion == null) {
        continue;
      }

      final int diceCount = legion.diceCount;
      final bool shouldUpdate = maxValue == null ||
          diceCount > maxValue ||
          (diceCount == maxValue && shouldReplaceSelectedEntry(selectedEntry, entry, diceCount));

      if (shouldUpdate) {
        selectedEntry = entry;
        maxValue = diceCount;
      }
    }

    return selectedEntry?.value ?? Legion.defaultValues;
  }

  bool shouldReplaceSelectedEntry(
    MapEntry<String, Legion?>? selectedEntry,
    MapEntry<String, Legion?> entry,
    int diceCount,
  ) {
    if (selectedEntry == null) {
      return true;
    }

    switch (entry.key) {
      case 'minusLeader':
        return genericLeaders > 0 && (genericLeaders + namedLeaders.length) > diceCount;
      case 'minusElite':
        return selectedEntry.key != 'minusElite';
      case 'minusSpecial':
        return selectedEntry.key != 'minusElite' && selectedEntry.key != 'minusSpecial';
      case 'minusNamed':
        return totalUnits == 1 || selectedEntry.key != 'minusRegular';
      case 'minusRegular':
        return selectedEntry.key != 'minusRegular';
      default:
        return false;
    }
  }
}
