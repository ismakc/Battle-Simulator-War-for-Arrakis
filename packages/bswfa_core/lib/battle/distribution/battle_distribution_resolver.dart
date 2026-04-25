import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution.dart';
import 'package:bswfa_core/battle/distribution/battle_round_distribution_resolver.dart';
import 'package:bswfa_core/battle/distribution/battle_round_outcome.dart';
import 'package:bswfa_core/battle/result/battle_winner.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_round_policy.dart';

/// Propaga una distribución exacta de estados durante varias rondas.
///
/// La política automática asumida es:
/// - el atacante continúa mientras ambos bandos tienen unidades;
/// - el defensor no se retira;
/// - las cartas usadas se limpian tras la primera ronda;
/// - el ataque sorpresa solo aplica en la primera ronda.
class BattleDistributionResolver {
  const BattleDistributionResolver({
    this.roundResolver = const BattleRoundDistributionResolver(),
  });

  final BattleRoundDistributionResolver roundResolver;

  BattleDistribution resolve({
    required BattleScenario initialScenario,
    required int maxRounds,
  }) {
    if (maxRounds < 0) {
      throw ArgumentError.value(
        maxRounds,
        'maxRounds',
        'maxRounds cannot be negative.',
      );
    }

    Map<BattleScenario, double> activeStates = <BattleScenario, double>{
      initialScenario: 1,
    };
    double attackerWinProbability = 0;
    double defenderWinProbability = 0;
    double drawProbability = 0;
    int playedRounds = 0;

    for (int round = 1; round <= maxRounds; round++) {
      if (activeStates.isEmpty) {
        break;
      }

      final Map<BattleScenario, double> nextStates = <BattleScenario, double>{};

      for (final MapEntry<BattleScenario, double> stateEntry
          in activeStates.entries) {
        final BattleWinner? initialWinner = _resolveWinner(stateEntry.key);

        if (initialWinner != null) {
          switch (initialWinner) {
            case BattleWinner.attacker:
              attackerWinProbability += stateEntry.value;
            case BattleWinner.defender:
              defenderWinProbability += stateEntry.value;
            case BattleWinner.draw:
              drawProbability += stateEntry.value;
          }
          continue;
        }

        final BattleScenario preparedScenario =
            AutomaticBattleRoundPolicy.prepareNextAutomaticRoundScenario(
              stateEntry.key,
              round,
            );

        for (final BattleRoundOutcome outcome in roundResolver.resolve(
          preparedScenario,
        )) {
          final double branchProbability =
              stateEntry.value * outcome.probability;
          final BattleWinner? winner = _resolveWinner(
            outcome.scenarioAfterRound,
          );

          if (winner == null) {
            nextStates.update(
              outcome.scenarioAfterRound,
              (double current) => current + branchProbability,
              ifAbsent: () => branchProbability,
            );
            continue;
          }

          switch (winner) {
            case BattleWinner.attacker:
              attackerWinProbability += branchProbability;
            case BattleWinner.defender:
              defenderWinProbability += branchProbability;
            case BattleWinner.draw:
              drawProbability += branchProbability;
          }
        }
      }

      activeStates = nextStates;
      playedRounds = round;
    }

    return BattleDistribution(
      playedRounds: playedRounds,
      attackerWinProbability: attackerWinProbability,
      defenderWinProbability: defenderWinProbability,
      drawProbability: drawProbability,
      unresolvedStates: Map<BattleScenario, double>.unmodifiable(activeStates),
    );
  }

  BattleWinner? _resolveWinner(BattleScenario scenario) {
    final bool attackerDestroyed = scenario.attackingLegion.totalUnits == 0;
    final bool defenderDestroyed = scenario.defendingLegion.totalUnits == 0;

    if (attackerDestroyed && defenderDestroyed) {
      return BattleWinner.draw;
    }
    if (defenderDestroyed) {
      return BattleWinner.attacker;
    }
    if (attackerDestroyed) {
      return BattleWinner.defender;
    }

    return null;
  }
}
