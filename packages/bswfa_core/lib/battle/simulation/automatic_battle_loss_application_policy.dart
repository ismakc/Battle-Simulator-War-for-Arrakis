import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_optimal_loss_policy.dart';

/// Define cómo la app transforma impactos esperados en bajas automáticas
/// cuando resuelve rondas sin intervención adicional del jugador.
class AutomaticBattleLossApplicationPolicy {
  const AutomaticBattleLossApplicationPolicy._();

  /// Resuelve automáticamente las bajas del atacante a partir de los impactos
  /// esperados del defensor. Si el combate continúa contra un asentamiento,
  /// añade además la baja extra exigida por las reglas para seguir atacando.
  static AttackingLegion resolveAttackerLosses(
    AttackingLegion legion,
    double expectedHits, {
    required bool mustTakeSettlementHitToContinue,
  }) {
    AttackingLegion damagedLegion = _applyRoundedExpectedHits(
      legion,
      expectedHits,
    );

    if (mustTakeSettlementHitToContinue && damagedLegion.totalUnits > 0) {
      damagedLegion = _applySingleOptimalLoss(damagedLegion);
    }

    return damagedLegion;
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

    while (appliedHits < expectedHits.round() && damagedLegion.totalUnits > 0) {
      damagedLegion = _applySingleOptimalLoss(damagedLegion);
      appliedHits++;
    }

    return damagedLegion;
  }

  static T _applySingleOptimalLoss<T extends Legion>(T legion) {
    return LegionOptimalLossPolicy.selectOptimalLoss(legion).applyTo(legion)
        as T;
  }
}
