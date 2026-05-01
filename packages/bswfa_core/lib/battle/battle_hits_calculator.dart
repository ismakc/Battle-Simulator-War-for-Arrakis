import 'dart:math' as math;

import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_side_contribution.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/named_leader.dart';
import 'package:bswfa_core/roll/battle_dice_roll.dart';
import 'package:bswfa_core/roll/dice_roll.dart';

/// Calcula los impactos infligidos por atacante y defensor a partir de un
/// escenario de batalla y una tirada completa de dados.
class BattleHitsCalculator {
  const BattleHitsCalculator();

  static final Map<_SideOutcomeCacheKey, List<BattleSideContribution>>
  _sideOutcomeCache = <_SideOutcomeCacheKey, List<BattleSideContribution>>{};

  (int attackerHits, int defenderHits) calculateHits(
    BattleScenario scenario,
    BattleDiceRoll diceRoll,
  ) {
    final List<BattleSideContribution> attackerOutcomes =
        _calculateAttackerOutcomes(
          legion: scenario.attackingLegion,
          diceRoll: diceRoll.attackerDiceRoll,
        );

    final List<BattleSideContribution> defenderOutcomes =
        _calculateDefenderOutcomes(
          legion: scenario.defendingLegion,
          diceRoll: diceRoll.defenderDiceRoll,
        );

    final (
      BattleSideContribution attackerOutcome,
      BattleSideContribution defenderOutcome,
    ) = _selectLeaderActivationOutcomes(
      attackerOutcomes: attackerOutcomes,
      defenderOutcomes: defenderOutcomes,
      attackerRemovedOpponentShields:
          scenario.attackingLegion.removedShieldsCount,
      defenderRemovedOpponentShields:
          scenario.defendingLegion.removedShieldsCount,
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

  List<BattleSideContribution> _calculateAttackerOutcomes({
    required AttackingLegion legion,
    required DiceRoll diceRoll,
  }) {
    return _calculateSideOutcomes(
      namedLeaders: legion.namedLeaders,
      genericLeaders: legion.genericLeaders,
      swordCount: diceRoll.swordCount,
      shieldCount: diceRoll.shieldCount,
      starCount: diceRoll.starCount + (legion.surpriseAttack ? 1 : 0),
    );
  }

  List<BattleSideContribution> _calculateDefenderOutcomes({
    required DefendingLegion legion,
    required DiceRoll diceRoll,
  }) {
    return _calculateSideOutcomes(
      namedLeaders: legion.namedLeaders,
      genericLeaders: legion.genericLeaders,
      swordCount: diceRoll.swordCount,
      shieldCount: diceRoll.shieldCount,
      starCount: diceRoll.starCount,
    );
  }

  List<BattleSideContribution> _calculateSideOutcomes({
    required List<NamedLeader> namedLeaders,
    required int genericLeaders,
    required int swordCount,
    required int shieldCount,
    required int starCount,
  }) {
    final _SideOutcomeCacheKey cacheKey = _SideOutcomeCacheKey(
      leaderProfilesKey: _buildLeaderProfilesKey(namedLeaders, genericLeaders),
      swordCount: swordCount,
      shieldCount: shieldCount,
      starCount: starCount,
    );
    final List<BattleSideContribution>? cachedOutcomes =
        _sideOutcomeCache[cacheKey];
    if (cachedOutcomes != null) {
      return cachedOutcomes;
    }

    final List<({int swords, int shields})> leaderProfiles =
        <({int swords, int shields})>[
          for (final NamedLeader leader in namedLeaders)
            (swords: leader.attack, shields: leader.defense),
          for (int i = 0; i < genericLeaders; i++) (swords: 1, shields: 0),
        ];

    final int activations = math.min(starCount, leaderProfiles.length);
    final Set<({int swords, int shields})> activatedProfiles =
        _buildActivatedLeaderProfiles(leaderProfiles, activations);

    final List<BattleSideContribution> outcomes = <BattleSideContribution>[
      for (final ({int swords, int shields}) profile in activatedProfiles)
        BattleSideContribution(
          swords: swordCount,
          shields: shieldCount,
          leaderActivatedSwords: profile.swords,
          leaderActivatedShields: profile.shields,
        ),
    ];

    _sideOutcomeCache[cacheKey] = outcomes;
    return outcomes;
  }

  String _buildLeaderProfilesKey(
    List<NamedLeader> namedLeaders,
    int genericLeaders,
  ) {
    final List<int> profileCodes = <int>[
      for (final NamedLeader leader in namedLeaders)
        _encodeLeaderProfile(leader.attack, leader.defense),
      for (int i = 0; i < genericLeaders; i++) _encodeLeaderProfile(1, 0),
    ]..sort();

    return profileCodes.join(',');
  }

  int _encodeLeaderProfile(int swords, int shields) {
    return (swords << 4) | shields;
  }

  Set<({int swords, int shields})> _buildActivatedLeaderProfiles(
    List<({int swords, int shields})> leaderProfiles,
    int activations,
  ) {
    final Set<({int swords, int shields})> profiles =
        <({int swords, int shields})>{};

    void visit(int startIndex, int remaining, int swords, int shields) {
      if (remaining == 0) {
        profiles.add((swords: swords, shields: shields));
        return;
      }

      for (int i = startIndex; i <= leaderProfiles.length - remaining; i++) {
        final ({int swords, int shields}) leader = leaderProfiles[i];
        visit(
          i + 1,
          remaining - 1,
          swords + leader.swords,
          shields + leader.shields,
        );
      }
    }

    visit(0, activations, 0, 0);
    return profiles;
  }

  (BattleSideContribution, BattleSideContribution)
  _selectLeaderActivationOutcomes({
    required List<BattleSideContribution> attackerOutcomes,
    required List<BattleSideContribution> defenderOutcomes,
    required int attackerRemovedOpponentShields,
    required int defenderRemovedOpponentShields,
  }) {
    BattleSideContribution? selectedAttackerOutcome;
    BattleSideContribution? selectedDefenderOutcome;
    int? selectedAttackerHits;
    int? selectedDefenderHits;

    for (final BattleSideContribution attackerOutcome in attackerOutcomes) {
      final _ResolvedOutcome defenderBestResponse = _selectDefenderBestResponse(
        attackerOutcome: attackerOutcome,
        defenderOutcomes: defenderOutcomes,
        attackerRemovedOpponentShields: attackerRemovedOpponentShields,
        defenderRemovedOpponentShields: defenderRemovedOpponentShields,
      );

      final bool shouldReplace =
          selectedAttackerOutcome == null ||
          defenderBestResponse.attackerHits > selectedAttackerHits! ||
          (defenderBestResponse.attackerHits == selectedAttackerHits &&
              defenderBestResponse.defenderHits < selectedDefenderHits!);

      if (shouldReplace) {
        selectedAttackerOutcome = attackerOutcome;
        selectedDefenderOutcome = defenderBestResponse.defenderOutcome;
        selectedAttackerHits = defenderBestResponse.attackerHits;
        selectedDefenderHits = defenderBestResponse.defenderHits;
      }
    }

    return (selectedAttackerOutcome!, selectedDefenderOutcome!);
  }

  _ResolvedOutcome _selectDefenderBestResponse({
    required BattleSideContribution attackerOutcome,
    required List<BattleSideContribution> defenderOutcomes,
    required int attackerRemovedOpponentShields,
    required int defenderRemovedOpponentShields,
  }) {
    _ResolvedOutcome? selected;

    for (final BattleSideContribution defenderOutcome in defenderOutcomes) {
      final int attackerHits = _calculateInflictedHits(
        outcome: attackerOutcome,
        opponentOutcome: defenderOutcome,
        removedOpponentShields: attackerRemovedOpponentShields,
      );
      final int defenderHits = _calculateInflictedHits(
        outcome: defenderOutcome,
        opponentOutcome: attackerOutcome,
        removedOpponentShields: defenderRemovedOpponentShields,
      );

      final bool shouldReplace =
          selected == null ||
          defenderHits > selected.defenderHits ||
          (defenderHits == selected.defenderHits &&
              attackerHits < selected.attackerHits);

      if (shouldReplace) {
        selected = _ResolvedOutcome(
          defenderOutcome: defenderOutcome,
          attackerHits: attackerHits,
          defenderHits: defenderHits,
        );
      }
    }

    return selected!;
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

class _SideOutcomeCacheKey {
  const _SideOutcomeCacheKey({
    required this.leaderProfilesKey,
    required this.swordCount,
    required this.shieldCount,
    required this.starCount,
  });

  final String leaderProfilesKey;
  final int swordCount;
  final int shieldCount;
  final int starCount;

  @override
  bool operator ==(Object other) {
    return other is _SideOutcomeCacheKey &&
        leaderProfilesKey == other.leaderProfilesKey &&
        swordCount == other.swordCount &&
        shieldCount == other.shieldCount &&
        starCount == other.starCount;
  }

  @override
  int get hashCode => Object.hash(
    leaderProfilesKey,
    swordCount,
    shieldCount,
    starCount,
  );
}

class _ResolvedOutcome {
  const _ResolvedOutcome({
    required this.defenderOutcome,
    required this.attackerHits,
    required this.defenderHits,
  });

  final BattleSideContribution defenderOutcome;
  final int attackerHits;
  final int defenderHits;
}
