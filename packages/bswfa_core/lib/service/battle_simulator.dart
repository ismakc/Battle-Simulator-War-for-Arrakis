import 'package:bswfa_core/domain/battle/battle_result.dart';
import 'package:bswfa_core/domain/battle/battle_scenario.dart';
import 'package:bswfa_core/domain/battle/battle_statistic.dart';
import 'package:bswfa_core/domain/legion/attacking_legion.dart';
import 'package:bswfa_core/domain/legion/defending_legion.dart';
import 'package:bswfa_core/domain/legion/legion.dart';
import 'package:bswfa_core/service/battle_statistic_calculator.dart';

class BattleSimulator {
  BattleSimulator._();

  static final BattleSimulator _instance = BattleSimulator._();

  static BattleSimulator get instance => _instance;

  BattleResult simulateSingleRound(BattleScenario battleScenario) {
    final BattleStatistic battleStatistic = BattleStatisticCalculator.calc(battleScenario);
    return BattleResult(
      playedCombatRounds: 1,
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
          attackingLegion: battleScenarioForSeveralRounds.attackingLegion.copyWith(usedCards: 0, surpriseAttack: false),
          defendingLegion: battleScenarioForSeveralRounds.defendingLegion.copyWith(
            usedCards: 0,
          ),
        );
      }
      final AttackingLegion damagedAttackingLegion = _updateLegionAfterAttack(
        Legion.fromAttackingLegion(battleScenarioForSeveralRounds.attackingLegion),
        result.statistic.defenderExpectedHits,
        battleScenarioForSeveralRounds.defendingLegion.settlementLevel > 0,
      ).overwriteAttackingLegionWithLegion(battleScenarioForSeveralRounds.attackingLegion);

      final DefendingLegion damagedDefendingLegion = _updateLegionAfterAttack(
        Legion.fromDefendingLegion(battleScenarioForSeveralRounds.defendingLegion),
        result.statistic.attackerExpectedHits,
        false,
      ).overwriteDefendingLegionWithLegion(battleScenarioForSeveralRounds.defendingLegion);

      battleScenarioForSeveralRounds = battleScenarioForSeveralRounds.copyWith(
        attackingLegion: damagedAttackingLegion,
        defendingLegion: damagedDefendingLegion,
      );

      if (battleScenarioForSeveralRounds.attackingLegion.totalUnits == 0 ||
          battleScenarioForSeveralRounds.defendingLegion.totalUnits == 0 ||
          totalAttackerExpectedHits >
              battleScenarioForSeveralRounds.attackingLegion.totalUnits +
                  battleScenarioForSeveralRounds.attackingLegion.totalLeaders ||
          totalDefenderExpectedHits >
              battleScenarioForSeveralRounds.defendingLegion.totalUnits +
                  battleScenarioForSeveralRounds.defendingLegion.totalLeaders) {
        combatEnds = true;
      }
    }

    return BattleResult(
      playedCombatRounds: rounds,
      statistic: BattleStatistic(
        attackerExpectedHits: totalAttackerExpectedHits,
        attackerStdDeviationHits: 0.0,
        defenderExpectedHits: totalDefenderExpectedHits,
        defenderStdDeviationHits: 0.0,
      ),
      scenario: BattleScenario(
        attackingLegion: battleScenarioForSeveralRounds.attackingLegion,
        defendingLegion: battleScenarioForSeveralRounds.defendingLegion,
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
      damagedLegion = damagedLegion.calculateOptimalLoss();
      i++;
    }

    if (damagedLegion.totalUnits > 0 && additionalHitToContinue) {
      damagedLegion = damagedLegion.calculateOptimalLoss();
    }
    return damagedLegion;
  }
}
