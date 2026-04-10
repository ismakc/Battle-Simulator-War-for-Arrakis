import 'dart:math';

import 'package:bswfa_core/domain/legion/named_leader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'defending_legion.freezed.dart';

/// Una clase que representa una legión defensora, que incluye información sobre
/// los líderes genéricos, unidades regulares, unidades élite, unidades élite
/// especiales, cartas usadas, líderes nombrados y el nivel de asentamiento.
@freezed
abstract class DefendingLegion with _$DefendingLegion {
  const DefendingLegion._();

  const factory DefendingLegion({
    @Default(0) int genericLeaders,
    @Default(0) int regularUnits,
    @Default(0) int eliteUnits,
    @Default(0) int specialEliteUnits,
    @Default(0) int usedCards,
    @Default(<NamedLeader>[]) List<NamedLeader> namedLeaders,
    @Default(0) int settlementLevel,
  }) = _DefendingLegion;

  static const DefendingLegion defaultValues = DefendingLegion();

  /// El número de dados que se pueden lanzar en defensa,
  /// que es el mínimo entre 6 y la suma de unidades regulares,
  /// élite, élite especiales, cartas usadas y el nivel de asentamiento.
  int get diceCount {
    return min(
      6,
      regularUnits +
          eliteUnits +
          specialEliteUnits +
          usedCards +
          settlementLevel,
    );
  }

  int get maxStarsCount {
    return min(diceCount, genericLeaders + namedLeaders.length);
  }

  int get unlimitedMaxStarsCount {
    return genericLeaders + namedLeaders.length;
  }

  int get lifeCount {
    return regularUnits +
        eliteUnits * 2 +
        specialEliteUnits * 2 +
        genericLeaders +
        namedLeaders.length;
  }

  int get totalUnits {
    return regularUnits + eliteUnits + specialEliteUnits;
  }

  int get totalLeaders {
    return genericLeaders + namedLeaders.length;
  }

  int get unlimitedMaxDiceCount {
    return regularUnits +
        eliteUnits +
        specialEliteUnits +
        usedCards +
        settlementLevel;
  }
}
