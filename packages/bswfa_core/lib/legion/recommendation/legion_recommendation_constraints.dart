/// Restricciones de disponibilidad para generar legiones recomendables.
class LegionRecommendationConstraints {
  const LegionRecommendationConstraints({
    required this.maxRegularUnits,
    required this.maxEliteUnits,
    required this.maxSpecialEliteUnits,
    required this.maxGenericLeaders,
    this.allowSurpriseAttack = false,
    this.settlementLevel = 0,
  });

  final int maxRegularUnits;
  final int maxEliteUnits;
  final int maxSpecialEliteUnits;
  final int maxGenericLeaders;

  /// Solo aplica cuando se recomiendan legiones atacantes.
  final bool allowSurpriseAttack;

  /// Solo aplica cuando se recomiendan legiones defensoras.
  final int settlementLevel;
}
