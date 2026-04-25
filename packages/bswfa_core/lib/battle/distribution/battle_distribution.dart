import 'package:bswfa_core/battle/battle_scenario.dart';

/// Resultado probabilístico de simular una batalla durante un número máximo
/// de rondas automáticas.
class BattleDistribution {
  const BattleDistribution({
    required this.playedRounds,
    required this.attackerWinProbability,
    required this.defenderWinProbability,
    required this.drawProbability,
    required this.unresolvedStates,
  });

  final int playedRounds;
  final double attackerWinProbability;
  final double defenderWinProbability;
  final double drawProbability;
  final Map<BattleScenario, double> unresolvedStates;

  double get resolvedProbability =>
      attackerWinProbability + defenderWinProbability + drawProbability;

  double get unresolvedProbability => unresolvedStates.values.fold(
    0,
    (double total, double probability) => total + probability,
  );
}
