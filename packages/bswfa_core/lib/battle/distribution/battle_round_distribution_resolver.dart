import 'dart:math' as math;

import 'package:bswfa_core/battle/battle_hits_calculator.dart';
import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/distribution/battle_round_outcome.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_loss_application_policy.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_optimal_loss_policy.dart';
import 'package:bswfa_core/roll/battle_dice_roll.dart';
import 'package:bswfa_core/roll/dice_roll.dart';

/// Resuelve una ronda como distribución exacta de estados posteriores.
class BattleRoundDistributionResolver {
  const BattleRoundDistributionResolver({
    this.hitsCalculator = const BattleHitsCalculator(),
  });

  static final Map<BattleScenario, List<BattleRoundOutcome>>
  _resolvedScenarioCache = <BattleScenario, List<BattleRoundOutcome>>{};
  static final Map<int, List<_DiceRollOutcome>> _diceRollOutcomeCache =
      <int, List<_DiceRollOutcome>>{};

  final BattleHitsCalculator hitsCalculator;

  List<BattleRoundOutcome> resolve(BattleScenario scenario) {
    final List<BattleRoundOutcome>? cachedOutcomes =
        _resolvedScenarioCache[scenario];
    if (cachedOutcomes != null) {
      return cachedOutcomes;
    }

    final List<_DiceRollOutcome> attackerRolls = _buildDiceRollOutcomes(
      scenario.attackingLegion.diceCount,
    );
    final List<_DiceRollOutcome> defenderRolls = _buildDiceRollOutcomes(
      scenario.defendingLegion.diceCount,
    );

    final Map<_RoundOutcomeKey, double> probabilities =
        <_RoundOutcomeKey, double>{};

    for (final _DiceRollOutcome attackerRoll in attackerRolls) {
      for (final _DiceRollOutcome defenderRoll in defenderRolls) {
        final (int attackerHits, int defenderHits) = hitsCalculator
            .calculateHits(
              scenario,
              BattleDiceRoll(
                attackerDiceRoll: attackerRoll.diceRoll,
                defenderDiceRoll: defenderRoll.diceRoll,
              ),
            );

        final BattleScenario scenarioAfterRound = _applyRoundHits(
          scenario,
          attackerHits: attackerHits,
          defenderHits: defenderHits,
        );
        final double probability =
            attackerRoll.probability * defenderRoll.probability;
        final _RoundOutcomeKey key = _RoundOutcomeKey(
          scenario: scenarioAfterRound,
          attackerHits: attackerHits,
          defenderHits: defenderHits,
        );

        probabilities.update(
          key,
          (double current) => current + probability,
          ifAbsent: () => probability,
        );
      }
    }

    final List<BattleRoundOutcome> outcomes = <BattleRoundOutcome>[
      for (final MapEntry<_RoundOutcomeKey, double> entry
          in probabilities.entries)
        BattleRoundOutcome(
          scenarioAfterRound: entry.key.scenario,
          probability: entry.value,
          attackerHits: entry.key.attackerHits,
          defenderHits: entry.key.defenderHits,
        ),
    ];

    _resolvedScenarioCache[scenario] = outcomes;
    return outcomes;
  }

  BattleScenario _applyRoundHits(
    BattleScenario scenario, {
    required int attackerHits,
    required int defenderHits,
  }) {
    final AttackingLegion attackerAfterCombatHits = _applyHits(
      scenario.attackingLegion,
      defenderHits,
    );
    final DefendingLegion defenderAfterCombatHits = _applyHits(
      scenario.defendingLegion,
      attackerHits,
    );

    final bool battleCanContinue =
        attackerAfterCombatHits.totalUnits > 0 &&
        defenderAfterCombatHits.totalUnits > 0;

    final AttackingLegion attackerAfterContinuationHit =
        battleCanContinue && defenderAfterCombatHits.settlementLevel > 0
        ? AutomaticBattleLossApplicationPolicy.resolveAttackerContinuationLoss(
            attackerAfterCombatHits,
          )
        : attackerAfterCombatHits;

    return scenario.copyWith(
      attackingLegion: attackerAfterContinuationHit,
      defendingLegion: defenderAfterCombatHits,
    );
  }

  T _applyHits<T extends Legion>(T legion, int hits) {
    T damagedLegion = legion;

    for (
      int appliedHits = 0;
      appliedHits < hits && damagedLegion.remainingLossCapacity > 0;
      appliedHits++
    ) {
      damagedLegion =
          LegionOptimalLossPolicy.selectOptimalLoss(
                damagedLegion,
              ).applyTo(damagedLegion)
              as T;
      damagedLegion = _normalizeDestroyedLegion(damagedLegion);
    }

    return damagedLegion;
  }

  T _normalizeDestroyedLegion<T extends Legion>(T legion) {
    if (legion.totalUnits > 0 || legion.totalLeaders == 0) {
      return legion;
    }

    return legion.copyWith(genericLeaders: 0, namedLeaders: const []) as T;
  }

  List<_DiceRollOutcome> _buildDiceRollOutcomes(int diceCount) {
    final List<_DiceRollOutcome>? cachedOutcomes =
        _diceRollOutcomeCache[diceCount];
    if (cachedOutcomes != null) {
      return cachedOutcomes;
    }

    final int totalOutcomes = math.pow(6, diceCount).toInt();
    final List<_DiceRollOutcome> outcomes = <_DiceRollOutcome>[];

    for (int swords = 0; swords <= diceCount; swords++) {
      for (int shields = 0; shields <= diceCount - swords; shields++) {
        final int stars = diceCount - swords - shields;
        final int outcomeCount = _multinomialCount(
          diceCount: diceCount,
          swords: swords,
          shields: shields,
          stars: stars,
        );

        outcomes.add(
          _DiceRollOutcome(
            diceRoll: _buildDiceRoll(
              swords: swords,
              shields: shields,
              stars: stars,
            ),
            probability: outcomeCount / totalOutcomes,
          ),
        );
      }
    }

    _diceRollOutcomeCache[diceCount] = outcomes;
    return outcomes;
  }

  int _multinomialCount({
    required int diceCount,
    required int swords,
    required int shields,
    required int stars,
  }) {
    final int arrangements =
        _factorial(diceCount) ~/
        (_factorial(swords) * _factorial(shields) * _factorial(stars));

    return arrangements *
        math.pow(3, swords).toInt() *
        math.pow(2, shields).toInt();
  }

  int _factorial(int value) {
    int result = 1;

    for (int i = 2; i <= value; i++) {
      result *= i;
    }

    return result;
  }

  DiceRoll _buildDiceRoll({
    required int swords,
    required int shields,
    required int stars,
  }) {
    DiceRoll roll = DiceRoll.zero;

    for (int i = 0; i < swords; i++) {
      roll = roll.addSword();
    }
    for (int i = 0; i < shields; i++) {
      roll = roll.addShield();
    }
    for (int i = 0; i < stars; i++) {
      roll = roll.addStar();
    }

    return roll;
  }
}

class _DiceRollOutcome {
  const _DiceRollOutcome({required this.diceRoll, required this.probability});

  final DiceRoll diceRoll;
  final double probability;
}

class _RoundOutcomeKey {
  const _RoundOutcomeKey({
    required this.scenario,
    required this.attackerHits,
    required this.defenderHits,
  });

  final BattleScenario scenario;
  final int attackerHits;
  final int defenderHits;

  @override
  bool operator ==(Object other) {
    return other is _RoundOutcomeKey &&
        scenario == other.scenario &&
        attackerHits == other.attackerHits &&
        defenderHits == other.defenderHits;
  }

  @override
  int get hashCode => Object.hash(scenario, attackerHits, defenderHits);
}
