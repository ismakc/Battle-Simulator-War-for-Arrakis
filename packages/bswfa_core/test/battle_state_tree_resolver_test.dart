import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_accumulated_hits.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_node_state.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_node_state_cache.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_node_state_resolver.dart';
import 'package:bswfa_core/battle/statistics/tree/battle_state_tree_resolver.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:test/test.dart';

void main() {
  group('battle state tree resolver', () {
    test(
      'aggregates the full exhaustive outcome space for one attacker die',
      () {
        final BattleScenario scenario = BattleScenario(
          attackingLegion: AttackingLegion(regularUnits: 1),
        );
        final BattleNodeStateResolver nodeStateResolver =
            BattleNodeStateResolver(
              scenario,
              InMemoryBattleNodeStateCache<int, BattleNodeState>(),
            );
        final BattleStateTreeResolver treeResolver = BattleStateTreeResolver(
          nodeStateResolver,
          attackerDiceCount: scenario.attackingLegion.diceCount,
          defenderDiceCount: scenario.defendingLegion.diceCount,
        );

        final BattleAccumulatedHits accumulatedHits = treeResolver
            .resolveAccumulatedHits();

        expect(accumulatedHits.attackerHits, 3);
        expect(accumulatedHits.squaredAttackerHits, 3);
        expect(accumulatedHits.defenderHits, 0);
        expect(accumulatedHits.squaredDefenderHits, 0);
      },
    );

    test('returns the same accumulated hits with and without caching', () {
      final BattleScenario scenario = BattleScenario(
        attackingLegion: AttackingLegion(regularUnits: 2),
        defendingLegion: DefendingLegion(regularUnits: 1),
      );

      BattleAccumulatedHits resolveWithCache(
        BattleNodeStateCache<int, BattleNodeState> cache,
      ) {
        final BattleNodeStateResolver nodeStateResolver =
            BattleNodeStateResolver(scenario, cache);
        final BattleStateTreeResolver treeResolver = BattleStateTreeResolver(
          nodeStateResolver,
          attackerDiceCount: scenario.attackingLegion.diceCount,
          defenderDiceCount: scenario.defendingLegion.diceCount,
        );

        return treeResolver.resolveAccumulatedHits();
      }

      final BattleAccumulatedHits cachedHits = resolveWithCache(
        InMemoryBattleNodeStateCache<int, BattleNodeState>(),
      );
      final BattleAccumulatedHits nonCachedHits = resolveWithCache(
        NonCachingBattleNodeStateCache<int, BattleNodeState>(),
      );

      expect(cachedHits, nonCachedHits);
    });
  });
}
