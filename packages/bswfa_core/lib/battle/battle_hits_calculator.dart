import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_side_contribution.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/named_leader.dart';
import 'package:bswfa_core/roll/battle_dice_roll.dart';
import 'package:bswfa_core/roll/dice_roll.dart';

class BattleHitsCalculator {
  const BattleHitsCalculator();

  (int attackerHits, int defenderHits) calculateHits(
    BattleScenario battleScenario,
    BattleDiceRoll battleDiceRoll,
  ) {
    final BattleSideContribution attackerContribution =
        _calculateAttackerContribution(
          legion: battleScenario.attackingLegion,
          diceRoll: battleDiceRoll.attackerDiceRoll,
        );

    final BattleSideContribution defenderContribution =
        _calculateDefenderContribution(
          legion: battleScenario.defendingLegion,
          diceRoll: battleDiceRoll.defenderDiceRoll,
        );

    final int attackerHits = _calculateInflictedHits(
      contribution: attackerContribution,
      opponentContribution: defenderContribution,
      removedOpponentShields:
          battleScenario.attackingLegion.removedShieldsCount,
    );

    final int defenderHits = _calculateInflictedHits(
      contribution: defenderContribution,
      opponentContribution: attackerContribution,
      removedOpponentShields:
          battleScenario.defendingLegion.removedShieldsCount,
    );

    return (attackerHits, defenderHits);
  }

  BattleSideContribution _calculateAttackerContribution({
    required AttackingLegion legion,
    required DiceRoll diceRoll,
  }) {
    return _calculateContribution(
      namedLeaders: legion.namedLeaders,
      genericLeaders: legion.genericLeaders,
      swordCount: diceRoll.swordCount,
      shieldCount: diceRoll.shieldCount,
      starCount: diceRoll.starCount + (legion.surpriseAttack ? 1 : 0),
    );
  }

  BattleSideContribution _calculateDefenderContribution({
    required DefendingLegion legion,
    required DiceRoll diceRoll,
  }) {
    return _calculateContribution(
      namedLeaders: legion.namedLeaders,
      genericLeaders: legion.genericLeaders,
      swordCount: diceRoll.swordCount,
      shieldCount: diceRoll.shieldCount,
      starCount: diceRoll.starCount,
    );
  }

  BattleSideContribution _calculateContribution({
    required List<NamedLeader> namedLeaders,
    required int genericLeaders,
    required int swordCount,
    required int shieldCount,
    required int starCount,
  }) {
    final List<NamedLeader> orderedLeaders = _orderLeaders(namedLeaders);

    int usedStars = 0;
    int starSwords = 0;
    int starShields = 0;

    while (usedStars < starCount && usedStars < orderedLeaders.length) {
      final NamedLeader leader = orderedLeaders[usedStars];
      starSwords += leader.attack;
      starShields += leader.defense;
      usedStars++;
    }

    final int genericLeaderStars = (starCount - usedStars).clamp(
      0,
      genericLeaders,
    );

    starSwords += genericLeaderStars;

    return BattleSideContribution(
      swords: swordCount,
      shields: shieldCount,
      starSwords: starSwords,
      starShields: starShields,
    );
  }

  int _calculateInflictedHits({
    required BattleSideContribution contribution,
    required BattleSideContribution opponentContribution,
    required int removedOpponentShields,
  }) {
    final int effectiveOpponentShields =
        (opponentContribution.totalShields - removedOpponentShields)
            .clamp(0, double.infinity)
            .toInt();

    return (contribution.totalSwords - effectiveOpponentShields)
        .clamp(0, double.infinity)
        .toInt();
  }

  List<NamedLeader> _orderLeaders(List<NamedLeader> namedLeaders) {
    return List<NamedLeader>.from(namedLeaders)..sort(
      (NamedLeader a, NamedLeader b) => b.attack != a.attack
          ? b.attack.compareTo(a.attack)
          : b.defense.compareTo(a.defense),
    );
  }
}
