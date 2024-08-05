import 'package:bswfa_core/domain/battle/battle_result.dart';
import 'package:bswfa_core/domain/battle/battle_scenario.dart';
import 'package:bswfa_core/domain/battle/battle_statistic.dart';
import 'package:bswfa_core/domain/legion/legion.dart';
import 'package:bswfa_core/domain/legion/named_leader.dart';
import 'package:bswfa_core/service/battle_statistic_calculator.dart';
import 'package:bswfa_core/service/legion_casualty_calculator.dart';

class BattleSimulator {
  BattleSimulator._();

  static final BattleSimulator _instance = BattleSimulator._();

  static BattleSimulator get instance => _instance;

  BattleResult simulateSingleRound(BattleScenario battleScenario) {
    final BattleStatistic battleStatistic = BattleStatisticCalculator.calc(battleScenario);
    return BattleResult(
      rounds: 1,
      statistic: battleStatistic,
      scenario: battleScenario,
    );
  }

  BattleResult simulateMultipleRounds(BattleScenario battleScenario) {
    bool combatEnds = false;
    int rounds = 0;
    double totalAttackerExpectedHits = 0;
    double totalDefenderExpectedHits = 0;
    BattleScenario battleScenarioForSeveralRounds = battleScenario;
    while (!combatEnds) {
      rounds++;
      final BattleResult result = simulateSingleRound(battleScenarioForSeveralRounds);

      totalAttackerExpectedHits += result.statistic.attackerExpectedHits;
      totalDefenderExpectedHits += result.statistic.defenderExpectedHits;
      if (rounds == 2) {
        battleScenarioForSeveralRounds = battleScenarioForSeveralRounds.copyWith(
          attacker: battleScenarioForSeveralRounds.attacker.copyWith(usedCards: 0, surpriseAttack: false),
          defender: battleScenarioForSeveralRounds.defender.copyWith(
            usedCards: 0,
          ),
        );
      }
      final AttackingLegion damagedAttackingLegion = battleScenarioForSeveralRounds.attacker.copyWith(
        genericLeaders: _updateLegionAfterAttack(
          battleScenarioForSeveralRounds.attacker,
          result.statistic.defenderExpectedHits,
          battleScenarioForSeveralRounds.defender.settlementLevel > 0,
        ).genericLeaders,
        regularUnits: _updateLegionAfterAttack(
          battleScenarioForSeveralRounds.attacker,
          result.statistic.defenderExpectedHits,
          battleScenarioForSeveralRounds.defender.settlementLevel > 0,
        ).regularUnits,
        eliteUnits: _updateLegionAfterAttack(
          battleScenarioForSeveralRounds.attacker,
          result.statistic.defenderExpectedHits,
          battleScenarioForSeveralRounds.defender.settlementLevel > 0,
        ).eliteUnits,
        specialEliteUnits: _updateLegionAfterAttack(
          battleScenarioForSeveralRounds.attacker,
          result.statistic.defenderExpectedHits,
          battleScenarioForSeveralRounds.defender.settlementLevel > 0,
        ).specialEliteUnits,
        usedCards: _updateLegionAfterAttack(
          battleScenarioForSeveralRounds.attacker,
          result.statistic.defenderExpectedHits,
          battleScenarioForSeveralRounds.defender.settlementLevel > 0,
        ).usedCards,
        namedLeaders: List<NamedLeader>.from(
          _updateLegionAfterAttack(
            battleScenarioForSeveralRounds.attacker,
            result.statistic.defenderExpectedHits,
            battleScenarioForSeveralRounds.defender.settlementLevel > 0,
          ).namedLeaders,
        ),
      );

      final DefendingLegion damagedDefendingLegion = battleScenarioForSeveralRounds.defender.copyWith(
        genericLeaders: _updateLegionAfterAttack(
          battleScenarioForSeveralRounds.defender,
          result.statistic.attackerExpectedHits,
          false,
        ).genericLeaders,
        regularUnits: _updateLegionAfterAttack(
          battleScenarioForSeveralRounds.defender,
          result.statistic.attackerExpectedHits,
          false,
        ).regularUnits,
        eliteUnits: _updateLegionAfterAttack(
          battleScenarioForSeveralRounds.defender,
          result.statistic.attackerExpectedHits,
          false,
        ).eliteUnits,
        specialEliteUnits: _updateLegionAfterAttack(
          battleScenarioForSeveralRounds.defender,
          result.statistic.attackerExpectedHits,
          false,
        ).specialEliteUnits,
        usedCards: _updateLegionAfterAttack(
          battleScenarioForSeveralRounds.defender,
          result.statistic.attackerExpectedHits,
          false,
        ).usedCards,
        namedLeaders: List<NamedLeader>.from(
          _updateLegionAfterAttack(
            battleScenarioForSeveralRounds.defender,
            result.statistic.attackerExpectedHits,
            false,
          ).namedLeaders,
        ),
      );

      battleScenarioForSeveralRounds = battleScenarioForSeveralRounds.copyWith(
        attacker: damagedAttackingLegion,
        defender: damagedDefendingLegion,
      );

      if (battleScenarioForSeveralRounds.attacker.totalUnits == 0 ||
          battleScenarioForSeveralRounds.defender.totalUnits == 0 ||
          totalAttackerExpectedHits >
              battleScenarioForSeveralRounds.attacker.totalUnits +
                  battleScenarioForSeveralRounds.attacker.totalLeaders ||
          totalDefenderExpectedHits >
              battleScenarioForSeveralRounds.defender.totalUnits +
                  battleScenarioForSeveralRounds.defender.totalLeaders) {
        combatEnds = true;
      }
    }

    return BattleResult(
      rounds: rounds,
      statistic: BattleStatistic(
        attackerExpectedHits: totalAttackerExpectedHits,
        attackerStdDevHits: 0.0,
        defenderExpectedHits: totalDefenderExpectedHits,
        defenderStdDevHits: 0.0,
      ),
      scenario: BattleScenario(
        attacker: battleScenarioForSeveralRounds.attacker,
        defender: battleScenarioForSeveralRounds.defender,
      ),
    );
  }

  Legion _updateLegionAfterAttack(
    Legion legion,
    double expectedHits,
    bool additionalHitToContinue,
  ) {
    int i = 1;
    Legion damagedLegion = legion;
    while (i <= expectedHits.round() && damagedLegion.totalUnits > 0) {
      damagedLegion = OptimalLegionCasualtyCalculator.instance.calculateOptimalCasualty(legion);
      i++;
    }

    if (damagedLegion.totalUnits > 0 && additionalHitToContinue) {
      damagedLegion = OptimalLegionCasualtyCalculator.instance.calculateOptimalCasualty(legion);
    }
    return damagedLegion;
  }
}
