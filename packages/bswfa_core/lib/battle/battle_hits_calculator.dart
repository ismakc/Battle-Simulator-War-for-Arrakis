import 'dart:math' as math;

import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_side_contribution.dart';
import 'package:bswfa_core/battle/leader_activation_order_policy.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/named_leader.dart';
import 'package:bswfa_core/roll/battle_dice_roll.dart';
import 'package:bswfa_core/roll/dice_roll.dart';

/// Calcula los impactos infligidos por atacante y defensor a partir de un
/// escenario de batalla y una tirada completa de dados.
class BattleHitsCalculator {
  const BattleHitsCalculator();

  (int attackerHits, int defenderHits) calculateHits(
      BattleScenario scenario,
      BattleDiceRoll diceRoll,
      ) {
    final BattleSideContribution attackerOutcome = _calculateAttackerOutcome(
      legion: scenario.attackingLegion,
      diceRoll: diceRoll.attackerDiceRoll,
    );

    final BattleSideContribution defenderOutcome = _calculateDefenderOutcome(
      legion: scenario.defendingLegion,
      diceRoll: diceRoll.defenderDiceRoll,
    );

    final int attackerHits = _calculateInflictedHits(
      outcome: attackerOutcome,
      opponentOutcome: defenderOutcome,
      removedOpponentShields: scenario.attackingLegion.removedShieldsCount,
    );

    final int defenderHits = _calculateInflictedHits(
      outcome: defenderOutcome,
      opponentOutcome: attackerOutcome,
      removedOpponentShields: scenario.defendingLegion.removedShieldsCount,
    );

    return (attackerHits, defenderHits);
  }

  BattleSideContribution _calculateAttackerOutcome({
    required AttackingLegion legion,
    required DiceRoll diceRoll,
  }) {
    return _calculateSideOutcome(
      namedLeaders: legion.namedLeaders,
      genericLeaders: legion.genericLeaders,
      swordCount: diceRoll.swordCount,
      shieldCount: diceRoll.shieldCount,
      starCount: diceRoll.starCount + (legion.surpriseAttack ? 1 : 0),
    );
  }

  BattleSideContribution _calculateDefenderOutcome({
    required DefendingLegion legion,
    required DiceRoll diceRoll,
  }) {
    return _calculateSideOutcome(
      namedLeaders: legion.namedLeaders,
      genericLeaders: legion.genericLeaders,
      swordCount: diceRoll.swordCount,
      shieldCount: diceRoll.shieldCount,
      starCount: diceRoll.starCount,
    );
  }

  BattleSideContribution _calculateSideOutcome({
    required List<NamedLeader> namedLeaders,
    required int genericLeaders,
    required int swordCount,
    required int shieldCount,
    required int starCount,
  }) {
    final List<NamedLeader> orderedLeaders =
    LeaderActivationOrderPolicy.orderForActivation(namedLeaders);

    int usedNamedLeaderStars = 0;
    int leaderActivatedSwords = 0;
    int leaderActivatedShields = 0;

    while (
    usedNamedLeaderStars < starCount &&
        usedNamedLeaderStars < orderedLeaders.length
    ) {
      final NamedLeader leader = orderedLeaders[usedNamedLeaderStars];
      leaderActivatedSwords += leader.attack;
      leaderActivatedShields += leader.defense;
      usedNamedLeaderStars++;
    }

    final int assignedGenericLeaderStars =
    (starCount - usedNamedLeaderStars).clamp(0, genericLeaders);

    leaderActivatedSwords += assignedGenericLeaderStars;

    return BattleSideContribution(
      swords: swordCount,
      shields: shieldCount,
      leaderActivatedSwords: leaderActivatedSwords,
      leaderActivatedShields: leaderActivatedShields,
    );
  }

  int _calculateInflictedHits({
    required BattleSideContribution outcome,
    required BattleSideContribution opponentOutcome,
    required int removedOpponentShields,
  }) {
    final int effectiveOpponentShields = math.max(
      0,
      opponentOutcome.totalShields - removedOpponentShields,
    );

    return math.max(0, outcome.totalSwords - effectiveOpponentShields);
  }
}
