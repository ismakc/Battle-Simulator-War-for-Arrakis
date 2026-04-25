import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution_resolver.dart';
import 'package:bswfa_core/battle/distribution/battle_round_distribution_resolver.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:test/test.dart';

void main() {
  group('battle distribution', () {
    test('resolves one round without collapsing to expected hits', () {
      final BattleDistributionResolver resolver = BattleDistributionResolver();

      final distribution = resolver.resolve(
        initialScenario: BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 1),
          defendingLegion: DefendingLegion(regularUnits: 1),
        ),
        maxRounds: 1,
      );

      expect(distribution.playedRounds, 1);
      expect(distribution.attackerWinProbability, closeTo(1 / 12, 0.000001));
      expect(distribution.defenderWinProbability, closeTo(1 / 12, 0.000001));
      expect(distribution.drawProbability, closeTo(1 / 4, 0.000001));
      expect(distribution.unresolvedProbability, closeTo(7 / 12, 0.000001));
      expect(distribution.resolvedProbability, closeTo(5 / 12, 0.000001));
    });

    test('keeps total probability at one after several rounds', () {
      final BattleDistributionResolver resolver = BattleDistributionResolver();

      final distribution = resolver.resolve(
        initialScenario: BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 2),
          defendingLegion: DefendingLegion(regularUnits: 2),
        ),
        maxRounds: 3,
      );

      expect(
        distribution.resolvedProbability + distribution.unresolvedProbability,
        closeTo(1, 0.000001),
      );
    });

    test('round resolver groups equivalent dice sequences', () {
      final BattleRoundDistributionResolver resolver =
          BattleRoundDistributionResolver();

      final outcomes = resolver.resolve(
        BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 1),
          defendingLegion: DefendingLegion(regularUnits: 1),
        ),
      );

      final double totalProbability = outcomes.fold(
        0,
        (double total, outcome) => total + outcome.probability,
      );

      expect(totalProbability, closeTo(1, 0.000001));
      expect(outcomes.length, lessThan(36));
    });
  });
}
