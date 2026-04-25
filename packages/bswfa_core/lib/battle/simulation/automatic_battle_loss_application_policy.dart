import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_optimal_loss_policy.dart';

/// Define cómo la app transforma impactos esperados en bajas automáticas
/// cuando resuelve rondas sin intervención adicional del jugador.
class AutomaticBattleLossApplicationPolicy {
  const AutomaticBattleLossApplicationPolicy._();

  /// Resuelve automáticamente las bajas de combate del atacante a partir de
  /// los impactos esperados del defensor.
  static AttackingLegion resolveAttackerCombatLosses(
    AttackingLegion legion,
    double expectedHits,
  ) {
    return _applyRoundedExpectedHits(legion, expectedHits);
  }

  /// Aplica la baja extra que el atacante debe sufrir si decide continuar
  /// contra un asentamiento tras resolver las bajas de combate.
  static AttackingLegion resolveAttackerContinuationLoss(
    AttackingLegion legion,
  ) {
    return _normalizeDestroyedLegion(_applySingleOptimalLoss(legion));
  }

  /// Resuelve automáticamente las bajas del defensor a partir de los impactos
  /// esperados del atacante usando la política automática actual de la app.
  static DefendingLegion resolveDefenderLosses(
    DefendingLegion legion,
    double expectedHits,
  ) {
    return _applyRoundedExpectedHits(legion, expectedHits);
  }

  /// La política automática actual convierte impactos esperados en bajas
  /// enteras redondeando al entero más cercano.
  static T _applyRoundedExpectedHits<T extends Legion>(
    T legion,
    double expectedHits,
  ) {
    int appliedHits = 0;
    T damagedLegion = legion;

    while (appliedHits < expectedHits.round() &&
        damagedLegion.remainingLossCapacity > 0) {
      damagedLegion = _applySingleOptimalLoss(damagedLegion);
      damagedLegion = _normalizeDestroyedLegion(damagedLegion);
      appliedHits++;
    }

    return damagedLegion;
  }

  static T _applySingleOptimalLoss<T extends Legion>(T legion) {
    return LegionOptimalLossPolicy.selectOptimalLoss(legion).applyTo(legion)
        as T;
  }

  static T _normalizeDestroyedLegion<T extends Legion>(T legion) {
    if (legion.totalUnits > 0 || legion.totalLeaders == 0) {
      return legion;
    }

    return legion.copyWith(genericLeaders: 0, namedLeaders: const []) as T;
  }
}
