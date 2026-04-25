import 'dart:math';

import 'package:bswfa_core/legion/legion_change.dart';
import 'package:bswfa_core/legion/legion_limits.dart';
import 'package:bswfa_core/legion/named_leader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'legion.freezed.dart';

@freezed
abstract class Legion with _$Legion {
  const Legion._();

  /// Unidad atacante en una batalla.
  const factory Legion.attacking({
    @Default(0) int genericLeaders,
    @Default(0) int regularUnits,
    @Default(0) int eliteUnits,
    @Default(0) int specialEliteUnits,
    @Default(<NamedLeader>[]) List<NamedLeader> namedLeaders,
    @Default(0) int usedCards,
    @Default(false) bool surpriseAttack,
  }) = AttackingLegion;

  /// Unidad defensora en una batalla.
  const factory Legion.defending({
    @Default(0) int genericLeaders,
    @Default(0) int regularUnits,
    @Default(0) int eliteUnits,
    @Default(0) int specialEliteUnits,
    @Default(<NamedLeader>[]) List<NamedLeader> namedLeaders,
    @Default(0) int usedCards,
    @Default(0) int settlementLevel,
  }) = DefendingLegion;

  /// Total de unidades (regulares, élite y élite especial) en la legión.
  int get totalUnits => regularUnits + eliteUnits + specialEliteUnits;

  /// Total de líderes (genéricos y de renombre) en la legión.
  int get totalLeaders => genericLeaders + namedLeaders.length;

  /// Capacidad total restante para absorber bajas en la legión.
  int get remainingLossCapacity =>
      regularUnits +
      (eliteUnits * 2) +
      (specialEliteUnits * 2) +
      genericLeaders +
      namedLeaders.length;

  /// Indica si la legión atacante tiene un ataque sorpresa activo.
  ///
  /// Lanza un [StateError] si se consulta sobre una legión defensora.
  bool get surpriseAttack => map(
    attacking: (AttackingLegion legion) => legion.surpriseAttack,
    defending: (_) => throw StateError(
      'DefendingLegion cannot have a surpriseAttack.',
    ),
  );

  /// Nivel de asentamiento de la legión defensora.
  ///
  /// Lanza un [StateError] si se consulta sobre una legión atacante.
  int get settlementLevel => map(
    attacking: (_) => throw StateError(
      'AttackingLegion cannot have a settlementLevel.',
    ),
    defending: (DefendingLegion legion) => legion.settlementLevel,
  );

  /// Cantidad de dados que la legión puede lanzar
  /// sin considerar el límite máximo impuesto por las reglas.
  int get unlimitedDiceCount =>
      totalUnits +
      usedCards +
      map(
        attacking: (_) => 0,
        defending: (DefendingLegion legion) => legion.settlementLevel,
      );

  /// Cantidad máxima de dados que la legión puede lanzar,
  /// considerando el límite máximo impuesto por las reglas.
  int get diceCount => min(LegionLimits.maxDiceCount, unlimitedDiceCount);

  /// Cantidad de estrellas que la legión puede obtener
  /// sin considerar el límite máximo impuesto por las reglas.
  int get unlimitedStarsCount =>
      totalLeaders +
      map(
        attacking: (AttackingLegion legion) => legion.surpriseAttack ? 1 : 0,
        defending: (_) => 0,
      );

  /// Cantidad máxima de estrellas que la legión puede obtener,
  /// considerando el límite máximo impuesto por las reglas.
  int get maxStarsCount => min(diceCount, unlimitedStarsCount);

  /// Cantidad de escudos a eliminar de la legión oponente
  /// debido a la presencia de unidades élite especiales.
  int get removedShieldsCount => specialEliteUnits;

  /// Aplica una serie de cambios a la legión, devolviendo una nueva instancia
  /// con los cambios aplicados.
  Legion applyChanges(Iterable<LegionChange> changes) {
    Legion current = this;

    for (final LegionChange change in changes) {
      current = change.apply(current);
    }

    return current;
  }
}