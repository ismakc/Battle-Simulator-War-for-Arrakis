import 'package:bswfa_core/battle/battle_scenario.dart';

/// Resultado de una rama concreta de una ronda de batalla.
class BattleRoundOutcome {
  const BattleRoundOutcome({
    required this.scenarioAfterRound,
    required this.probability,
    required this.attackerHits,
    required this.defenderHits,
  });

  final BattleScenario scenarioAfterRound;
  final double probability;
  final int attackerHits;
  final int defenderHits;
}
