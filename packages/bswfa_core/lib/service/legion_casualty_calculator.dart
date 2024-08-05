import 'package:bswfa_core/domain/legion/legion.dart';
import 'package:bswfa_core/domain/legion/named_leader.dart';

enum CasualtyType {
  reduceGenericLeader,
  reduceRegularUnit,
  reduceEliteUnit,
  reduceSpecialEliteUnit,
  reduceNamedLeader,
}

class OptimalLegionCasualtyCalculator {
  OptimalLegionCasualtyCalculator._();

  static final OptimalLegionCasualtyCalculator _instance = OptimalLegionCasualtyCalculator._();

  static OptimalLegionCasualtyCalculator get instance => _instance;

  /// Calcula la baja óptima de unidades para la legión dada.
  Legion calculateOptimalCasualty(Legion legion) {
    final Map<CasualtyType, Legion?> potentialCasualties = <CasualtyType, Legion?>{
      CasualtyType.reduceGenericLeader: _calculateReducedGenericLeader(legion),
      CasualtyType.reduceRegularUnit: _calculateReducedRegularUnit(legion),
      CasualtyType.reduceEliteUnit: _calculateReducedEliteUnit(legion),
      CasualtyType.reduceSpecialEliteUnit: _calculateReducedSpecialEliteUnit(legion),
      CasualtyType.reduceNamedLeader: _calculateReducedNamedLeader(legion),
    };

    return _selectOptimalLegion(potentialCasualties, legion);
  }

  Legion? _calculateReducedGenericLeader(Legion legion) {
    if (legion.genericLeaders == 0) {
      return null;
    }
    return legion.copyWith(genericLeaders: legion.genericLeaders - 1);
  }

  Legion? _calculateReducedRegularUnit(Legion legion) {
    if (legion.regularUnits == 0) {
      return null;
    }
    return legion.copyWith(regularUnits: legion.regularUnits - 1);
  }

  Legion? _calculateReducedEliteUnit(Legion legion) {
    if (legion.eliteUnits == 0) {
      return null;
    }
    return legion.copyWith(regularUnits: legion.regularUnits + 1, eliteUnits: legion.eliteUnits - 1);
  }

  Legion? _calculateReducedSpecialEliteUnit(Legion legion) {
    if (legion.specialEliteUnits == 0) {
      return null;
    }
    return legion.copyWith(regularUnits: legion.regularUnits + 1, specialEliteUnits: legion.specialEliteUnits - 1);
  }

  Legion? _calculateReducedNamedLeader(Legion legion) {
    if (legion.namedLeaders.isEmpty) {
      return null;
    }
    final List<NamedLeader> sortedLeaders = List<NamedLeader>.from(legion.namedLeaders)
      ..sort(
        (NamedLeader a, NamedLeader b) =>
            b.attack != a.attack ? b.attack.compareTo(a.attack) : b.defense.compareTo(a.defense),
      )
      ..removeLast();
    return legion.copyWith(namedLeaders: sortedLeaders);
  }

  Legion _selectOptimalLegion(Map<CasualtyType, Legion?> potentialCasualties, Legion legion) {
    MapEntry<CasualtyType, Legion?>? selectedCasualtyEntry;
    int? highestDiceCount;

    for (final MapEntry<CasualtyType, Legion?> entry in potentialCasualties.entries) {
      final Legion? currentLegion = entry.value;
      if (currentLegion == null) {
        continue;
      }

      final int diceCount = currentLegion.diceCount;
      final bool shouldUpdate = highestDiceCount == null ||
          diceCount > highestDiceCount ||
          (diceCount == highestDiceCount &&
              _shouldReplaceSelectedCasualty(currentLegion, selectedCasualtyEntry, entry, diceCount));

      if (shouldUpdate) {
        selectedCasualtyEntry = entry;
        highestDiceCount = diceCount;
      }
    }

    return selectedCasualtyEntry?.value ?? _createEmptyLegion(legion);
  }

  bool _shouldReplaceSelectedCasualty(
    Legion legion,
    MapEntry<CasualtyType, Legion?>? selectedCasualtyEntry,
    MapEntry<CasualtyType, Legion?> entry,
    int diceCount,
  ) {
    if (selectedCasualtyEntry == null) {
      return true;
    }

    switch (entry.key) {
      case CasualtyType.reduceGenericLeader:
        return legion.genericLeaders > 0 && (legion.genericLeaders + legion.namedLeaders.length) > diceCount;
      case CasualtyType.reduceEliteUnit:
        return selectedCasualtyEntry.key != CasualtyType.reduceEliteUnit;
      case CasualtyType.reduceSpecialEliteUnit:
        return selectedCasualtyEntry.key != CasualtyType.reduceEliteUnit &&
            selectedCasualtyEntry.key != CasualtyType.reduceSpecialEliteUnit;
      case CasualtyType.reduceNamedLeader:
        return legion.totalUnits == 1 || selectedCasualtyEntry.key != CasualtyType.reduceRegularUnit;
      case CasualtyType.reduceRegularUnit:
        return selectedCasualtyEntry.key != CasualtyType.reduceRegularUnit;
      default:
        return false;
    }
  }

  Legion _createEmptyLegion(Legion legion) {
    if (legion is AttackingLegion) {
      return AttackingLegion.empty();
    } else if (legion is DefendingLegion) {
      return DefendingLegion.empty();
    }
    throw UnsupportedError('Unknown Legion type');
  }
}
