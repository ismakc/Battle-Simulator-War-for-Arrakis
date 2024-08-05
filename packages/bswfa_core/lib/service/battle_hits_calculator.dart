import 'package:bswfa_core/domain/battle/battle_scenario.dart';
import 'package:bswfa_core/domain/legion/named_leader.dart';
import 'package:bswfa_core/domain/roll/battle_dice_roll.dart';
import 'package:bswfa_core/service/leader_selector_policy.dart';

class BattleHitsCalculator {
  BattleHitsCalculator._();

  static final BattleHitsCalculator _instance = BattleHitsCalculator._();

  static BattleHitsCalculator get instance => _instance;

  (int attackerHits, int defenderHits) calculateHits(BattleScenario battleScenario, BattleDiceRoll battleDiceRoll) {
    final BattleStats attackerStats = BattleStats();
    final BattleStats defenderStats = BattleStats();

    attackerStats.accumulateSwordHits(battleDiceRoll.attackerRoll.swordCount);
    defenderStats.accumulateSwordHits(battleDiceRoll.defenderRoll.swordCount);

    attackerStats.accumulateShields(battleDiceRoll.attackerRoll.shieldCount);
    defenderStats.accumulateShields(battleDiceRoll.defenderRoll.shieldCount);

    attackerStats.accumulateStarHitsAndStarShields(
      namedLeaders: battleScenario.attacker.namedLeaders,
      genericLeaders: battleScenario.attacker.genericLeaders,
      starCount: battleDiceRoll.attackerRoll.starCount + (battleScenario.attacker.surpriseAttack ? 1 : 0),
      policyOrderFunction: LeaderSelectorPolicy.orderAttackerLeaders,
    );
    defenderStats.accumulateStarHitsAndStarShields(
      namedLeaders: battleScenario.defender.namedLeaders,
      genericLeaders: battleScenario.defender.genericLeaders,
      starCount: battleDiceRoll.defenderRoll.starCount,
      policyOrderFunction: LeaderSelectorPolicy.orderDefenderLeaders,
    );

    final int attackerHits = attackerStats.calculateTotalHits(
      specialEliteUnits: battleScenario.attacker.specialEliteUnits,
      opponentShields: defenderStats.totalShields,
    );

    final int defenderHits = defenderStats.calculateTotalHits(
      specialEliteUnits: battleScenario.defender.specialEliteUnits,
      opponentShields: attackerStats.totalShields,
    );

    return (attackerHits, defenderHits);
  }
}

class BattleStats {
  int swordHits = 0;
  int starHits = 0;
  int starShields = 0;
  int shields = 0;

  int get totalShields => shields + starShields;

  int get totalSwords => swordHits + starHits;

  void accumulateSwordHits(int swordCount) {
    swordHits = swordCount;
  }

  void accumulateShields(int shieldCount) {
    shields = shieldCount;
  }

  void accumulateStarHitsAndStarShields({
    required List<NamedLeader> namedLeaders,
    required int genericLeaders,
    required int starCount,
    required List<NamedLeader> Function(List<NamedLeader>) policyOrderFunction,
  }) {
    final List<NamedLeader> orderedLeaders = policyOrderFunction(namedLeaders);

    int usedStars = 0;
    while (usedStars < starCount && usedStars < orderedLeaders.length) {
      starHits += orderedLeaders[usedStars].attack;
      starShields += orderedLeaders[usedStars].defense;
      usedStars++;
    }
    while (usedStars < starCount && usedStars - orderedLeaders.length < genericLeaders) {
      starHits++;
      usedStars++;
    }
  }

  int calculateTotalHits({required int specialEliteUnits, required int opponentShields}) {
    final int usefulShields = (opponentShields - specialEliteUnits).clamp(0, double.infinity).toInt();
    return (totalSwords - usefulShields).clamp(0, double.infinity).toInt();
  }
}
