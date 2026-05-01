import 'package:bswfa_core/legion/legion.dart';

class LegionRecommendationCostPolicy {
  const LegionRecommendationCostPolicy._();

  static const double surpriseAttackCost = 0.25;
  static const double genericLeaderCost = 0.50;
  static const double regularUnitCost = 1.00;
  static const double eliteUnitCost = 1.75;
  static const double specialEliteUnitCost = 2.75;
  static const double settlementLevelCost = regularUnitCost;

  static const double searchGenericLeaderWeight = 0.331;
  static const double searchRegularUnitWeight = 1.000;
  static const double searchEliteUnitWeight = 1.330;
  static const double searchSpecialEliteUnitWeight = 2.053;
  static const double searchSurpriseAttackWeight = 0.216;
  static const double searchSettlementLevelWeight = 2.399;

  static double calculate(Legion legion) {
    return legion.genericLeaders * genericLeaderCost +
        legion.regularUnits * regularUnitCost +
        legion.eliteUnits * eliteUnitCost +
        legion.specialEliteUnits * specialEliteUnitCost +
        legion.map(
          attacking: (AttackingLegion attackingLegion) =>
              attackingLegion.surpriseAttack ? surpriseAttackCost : 0,
          defending: (_) => 0,
        );
  }

  static double calculateBattleValue(Legion legion) {
    return calculate(legion) +
        legion.map(
          attacking: (_) => 0,
          defending: (DefendingLegion defendingLegion) =>
              defendingLegion.settlementLevel * settlementLevelCost,
        );
  }

  /// Valor contextual usado solo para preseleccionar candidatos del
  /// recomendador. Estos pesos son heurísticos internos calibrados offline y
  /// no sustituyen al coste oficial devuelto por [calculate].
  static double calculateSearchBattleValue(Legion legion) {
    return legion.genericLeaders * searchGenericLeaderWeight +
        legion.regularUnits * searchRegularUnitWeight +
        legion.eliteUnits * searchEliteUnitWeight +
        legion.specialEliteUnits * searchSpecialEliteUnitWeight +
        legion.map(
          attacking: (AttackingLegion attackingLegion) =>
              attackingLegion.surpriseAttack ? searchSurpriseAttackWeight : 0,
          defending: (DefendingLegion defendingLegion) =>
              defendingLegion.settlementLevel * searchSettlementLevelWeight,
        );
  }
}
