import 'dart:math';

import 'package:bswfa/domain/attacking_legion.dart';
import 'package:bswfa/domain/battle_result.dart';
import 'package:bswfa/domain/battle_scenario.dart';
import 'package:bswfa/domain/defending_legion.dart';
import 'package:bswfa/domain/named_leader.dart';

class BattleSimulator {
  BattleSimulator._();

  static const double swords = 3;
  static const double shields = 2;
  static const double stars = 1;
  static const double totalFaces = swords + shields + stars;

  static BattleSimulator? _instance;

  static BattleSimulator getInstance() {
    _instance ??= BattleSimulator._();
    return _instance!;
  }

  BattleResult simulate(BattleScenario battleScenario) {
    final double attackerDamage = _calculateExpectedHits(
      attacker: battleScenario.attackingLegion,
      defender: battleScenario.defendingLegion,
      isAttacker: true,
    );

    final double defenderDamage = _calculateExpectedHits(
      attacker: battleScenario.attackingLegion,
      defender: battleScenario.defendingLegion,
      isAttacker: false,
    );

    return BattleResult(
      attackerExpectedHits: _roundDouble(attackerDamage),
      defenderExpectedHits: _roundDouble(defenderDamage),
      attackingLegion: battleScenario.attackingLegion,
      defendingLegion: battleScenario.defendingLegion,
    );
  }

  double _calculateExpectedHits({
    required AttackingLegion attacker,
    required DefendingLegion defender,
    required bool isAttacker,
  }) {
    final int attackerDice = attacker.diceCount();
    final int defenderDice = defender.diceCount();

    final double attackerExpectedStars = _calculateAttackerExpectedStars(attacker, attackerDice);
    final double defenderExpectedStars = _calculateDefenderExpectedStars(defender, defenderDice);

    final (double attackerStarHits, double attackerStarShields) =
        _calculateStarHitsAndShields(attacker.namedLeaders, attackerExpectedStars);
    final (double defenderStarHits, double defenderStarShields) =
        _calculateStarHitsAndShields(defender.namedLeaders, defenderExpectedStars);

    final double initialDamage = (isAttacker ? attackerDice : defenderDice) * (swords / totalFaces) +
        (isAttacker ? attackerStarHits : defenderStarHits);

    final double effectiveShields = max(
      0,
      (isAttacker ? defenderDice : attackerDice) * (shields / totalFaces) +
          (isAttacker ? defenderStarShields : attackerStarShields) -
          (isAttacker ? attacker.specialEliteUnits : defender.specialEliteUnits),
    );

    return max(0, initialDamage - effectiveShields);
  }

  double _calculateAttackerExpectedStars(AttackingLegion legion, int diceCount) {
    return min(diceCount, legion.genericLeaders + legion.namedLeaders.length) * (stars / totalFaces) +
        (legion.surpriseAttack ? 1 : 0);
  }

  double _calculateDefenderExpectedStars(DefendingLegion legion, int diceCount) {
    return min(diceCount, legion.genericLeaders + legion.namedLeaders.length) * (stars / totalFaces);
  }

  (double starHits, double starShields) _calculateStarHitsAndShields(
    List<NamedLeader> namedLeaders,
    double expectedStars,
  ) {
    double starHits = 0.0;
    double starShields = 0.0;
    final int wholePart = expectedStars.floor();
    final double fractionalPart = expectedStars - wholePart;

    final List<NamedLeader> orderedNamedLeaders = List.from(namedLeaders)
      ..sort((a, b) => b.attack != a.attack ? b.attack.compareTo(a.attack) : b.defense.compareTo(a.defense));

    for (int i = 0; i < wholePart; i++) {
      if (i < orderedNamedLeaders.length) {
        starHits += orderedNamedLeaders[i].attack;
        starShields += orderedNamedLeaders[i].defense;
      } else {
        starHits += 1;
      }
    }

    if (fractionalPart > 0.0 && wholePart < orderedNamedLeaders.length) {
      final NamedLeader leader = orderedNamedLeaders[wholePart];
      starHits += leader.attack * fractionalPart;
      starShields += leader.defense * fractionalPart;
    } else if (fractionalPart > 0.0) {
      starHits += fractionalPart;
    }

    return (starHits, starShields);
  }

  double _roundDouble(double value) {
    return double.parse(value.toStringAsFixed(2));
  }
}
