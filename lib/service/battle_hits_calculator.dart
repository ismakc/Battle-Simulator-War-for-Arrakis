import 'package:bswfa/domain/attacking_legion.dart';
import 'package:bswfa/domain/battle_dice_roll.dart';
import 'package:bswfa/domain/defending_legion.dart';

class BattleHitsCalculator {
  BattleHitsCalculator._(); // Private constructor to prevent instantiation

  static double calculateAttackerHits(AttackingLegion attackingLegion, BattleDiceRoll battleDiceRoll) {
    int stars = battleDiceRoll.attackerDiceRoll.starCount();
    if (attackingLegion.surpriseAttack) {
      stars += 1;
    }
    final int leaderHits = stars.clamp(0, attackingLegion.genericLeaders);

    final int swordHits = battleDiceRoll.attackerDiceRoll.swordCount();

    final int defenderShields = (battleDiceRoll.defenderDiceRoll.shieldCount() - attackingLegion.specialEliteUnits)
        .clamp(0, double.infinity)
        .toInt();

    return (swordHits + leaderHits - defenderShields).clamp(0, double.infinity).toDouble();
  }

  static double calculateDefenderHits(DefendingLegion defendingLegion, BattleDiceRoll battleDiceRoll) {
    final int stars = battleDiceRoll.defenderDiceRoll.starCount();
    final int leaderHits = stars.clamp(0, defendingLegion.genericLeaders);

    final int swordHits = battleDiceRoll.defenderDiceRoll.swordCount();

    final int attackerShields = (battleDiceRoll.attackerDiceRoll.shieldCount() - defendingLegion.specialEliteUnits)
        .clamp(0, double.infinity)
        .toInt();

    return (swordHits + leaderHits - attackerShields).clamp(0, double.infinity).toDouble();
  }
}
