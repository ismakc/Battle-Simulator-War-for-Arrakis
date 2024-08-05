import 'package:bswfa_core/domain/battle/battle_scenario.dart';
import 'package:bswfa_core/domain/battle/battle_statistic.dart';

class BattleResult {
  const BattleResult({
    required this.rounds,
    required this.scenario,
    required this.statistic,
  });

  const BattleResult.empty()
      : this(
          rounds: 0,
          scenario: const BattleScenario.empty(),
          statistic: const BattleStatistic.empty(),
        );

  final int rounds;
  final BattleScenario scenario;
  final BattleStatistic statistic;

  String winner() {
    if (scenario.attacker.lifeCount > scenario.defender.lifeCount) {
      return 'Attacker';
    } else if (scenario.attacker.lifeCount < scenario.defender.lifeCount) {
      return 'Defender';
    } else {
      return 'Draw';
    }
  }

  BattleResult copyWith({
    int? rounds,
    BattleScenario? scenario,
    BattleStatistic? statistic,
  }) {
    return BattleResult(
      rounds: rounds ?? this.rounds,
      scenario: scenario ?? this.scenario,
      statistic: statistic ?? this.statistic,
    );
  }
}
