import 'package:bswfa_core/battle/simulation/automatic_battle_loss_application_policy.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_change.dart';
import 'package:bswfa_core/legion/legion_limits.dart';
import 'package:bswfa_core/legion/legion_optimal_loss_policy.dart';
import 'package:bswfa_core/legion/named_leader.dart';
import 'package:test/test.dart';

void main() {
  group('legion contract', () {
    test('caps dice and stars using the public legion limits', () {
      final legion = AttackingLegion(
        genericLeaders: 2,
        regularUnits: 6,
        usedCards: 3,
        surpriseAttack: true,
      );

      expect(legion.unlimitedDiceCount, 9);
      expect(legion.diceCount, LegionLimits.maxDiceCount);
      expect(legion.unlimitedStarsCount, 3);
      expect(legion.maxStarsCount, 3);
    });

    test(
      'adds settlement to defender dice and rejects attacker-only properties',
      () {
        final legion = DefendingLegion(
          genericLeaders: 1,
          regularUnits: 5,
          usedCards: 2,
          settlementLevel: 3,
        );

        expect(legion.unlimitedDiceCount, 10);
        expect(legion.diceCount, LegionLimits.maxDiceCount);
        expect(() => legion.surpriseAttack, throwsStateError);
      },
    );

    test('rejects defender-only properties on attackers', () {
      final legion = AttackingLegion(regularUnits: 1);

      expect(() => legion.settlementLevel, throwsStateError);
    });

    test('applies changes in order', () {
      final legion = AttackingLegion(regularUnits: 1, eliteUnits: 1);

      final updated = legion.applyChanges(<LegionChange>[
        const LegionChange.downgradeEliteUnit(),
        const LegionChange.removeRegularUnit(),
      ]);

      expect(updated.regularUnits, 1);
      expect(updated.eliteUnits, 0);
    });

    test('preserves units by losing excess generic leaders first', () {
      final legion = AttackingLegion(genericLeaders: 1, regularUnits: 6);

      final updated =
          LegionOptimalLossPolicy.selectOptimalLoss(legion).applyTo(legion)
              as AttackingLegion;

      expect(updated.genericLeaders, 0);
      expect(updated.regularUnits, 6);
    });

    test(
      'prefers removing a named leader instead of the last remaining unit',
      () {
        final legion = AttackingLegion(
          regularUnits: 1,
          namedLeaders: <NamedLeader>[NamedLeader.leader2_1],
        );

        final updated =
            LegionOptimalLossPolicy.selectOptimalLoss(legion).applyTo(legion)
                as AttackingLegion;

        expect(updated.regularUnits, 1);
        expect(updated.namedLeaders, isEmpty);
      },
    );

    test('prefers downgrading a regular elite before a special elite', () {
      final legion = AttackingLegion(eliteUnits: 1, specialEliteUnits: 1);

      final updated =
          LegionOptimalLossPolicy.selectOptimalLoss(legion).applyTo(legion)
              as AttackingLegion;

      expect(updated.eliteUnits, 0);
      expect(updated.specialEliteUnits, 1);
      expect(updated.regularUnits, 1);
    });

    test('downgrades a special elite when no regular elite is available', () {
      final legion = AttackingLegion(specialEliteUnits: 1);

      final updated =
          LegionOptimalLossPolicy.selectOptimalLoss(legion).applyTo(legion)
              as AttackingLegion;

      expect(updated.specialEliteUnits, 0);
      expect(updated.regularUnits, 1);
    });

    test('removes the least weighted named leader when losing a leader', () {
      final legion = AttackingLegion(
        namedLeaders: <NamedLeader>[
          NamedLeader.leader2_1,
          NamedLeader.leader0_2,
          NamedLeader.leader1_0,
        ],
      );

      final updated =
          LegionOptimalLossPolicy.selectOptimalLoss(legion).applyTo(legion)
              as AttackingLegion;

      expect(updated.namedLeaders, <NamedLeader>[
        NamedLeader.leader2_1,
        NamedLeader.leader0_2,
      ]);
    });

    test(
      'preserves named leaders by downgrading an elite when it is stronger',
      () {
        final legion = AttackingLegion(
          eliteUnits: 1,
          specialEliteUnits: 2,
          namedLeaders: <NamedLeader>[NamedLeader.leader1_1],
        );

        final updated =
            LegionOptimalLossPolicy.selectOptimalLoss(legion).applyTo(legion)
                as AttackingLegion;

        expect(updated.eliteUnits, 0);
        expect(updated.specialEliteUnits, 2);
        expect(updated.regularUnits, 1);
        expect(updated.namedLeaders, <NamedLeader>[NamedLeader.leader1_1]);
      },
    );

    test('preserves defensive named leaders over a special elite', () {
      final legion = DefendingLegion(
        regularUnits: 4,
        specialEliteUnits: 1,
        namedLeaders: <NamedLeader>[NamedLeader.leader0_2],
      );

      final updated =
          LegionOptimalLossPolicy.selectOptimalLoss(legion).applyTo(legion)
              as DefendingLegion;

      expect(updated.regularUnits, 5);
      expect(updated.specialEliteUnits, 0);
      expect(updated.namedLeaders, <NamedLeader>[NamedLeader.leader0_2]);
    });

    test('rounds expected hits before applying automatic losses', () {
      final legion = AttackingLegion(regularUnits: 3);

      final updated =
          AutomaticBattleLossApplicationPolicy.resolveAttackerCombatLosses(
            legion,
            1.5,
          );

      expect(updated.regularUnits, 1);
    });

    test('applies exactly one continuation hit to the attacker', () {
      final legion = AttackingLegion(eliteUnits: 1);

      final updated =
          AutomaticBattleLossApplicationPolicy.resolveAttackerContinuationLoss(
            legion,
          );

      expect(updated.eliteUnits, 0);
      expect(updated.regularUnits, 1);
    });

    test('stops applying automatic losses at remaining loss capacity', () {
      final legion = AttackingLegion(regularUnits: 1);

      final updated =
          AutomaticBattleLossApplicationPolicy.resolveAttackerCombatLosses(
            legion,
            4.6,
          );

      expect(updated.totalUnits, 0);
      expect(updated.totalLeaders, 0);
    });
  });
}
