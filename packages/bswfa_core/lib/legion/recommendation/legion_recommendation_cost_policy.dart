import 'package:bswfa_core/legion/legion.dart';

class LegionRecommendationCostPolicy {
  const LegionRecommendationCostPolicy._();

  static const double surpriseAttackCost = 0.25;
  static const double genericLeaderCost = 0.50;
  static const double regularUnitCost = 1.00;
  static const double eliteUnitCost = 1.75;
  static const double specialEliteUnitCost = 2.75;

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
}
