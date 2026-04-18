/// Límites de dominio para la composición de legiones.
///
/// Centraliza reglas numéricas del juego para evitar números mágicos en
/// entidades y servicios.
class LegionLimits {
  const LegionLimits._();

  static const int maxLeaders = 6;
  static const int maxNamedLeaders = 6;
  static const int maxUnitsPerType = 6;
  static const int maxUsedCards = 6;
  static const int maxSettlementLevel = 6;

  /// El juego limita a 6 la suma de unidades y cartas.
  static const int maxUnitsAndCards = 6;

  /// El máximo de dados tirables en un combate también es 6.
  static const int maxDiceCount = 6;
}
