import 'package:bswfa_core/domain/legion/legion.dart';

class BattleScenario {
  const BattleScenario({
    required this.attacker,
    required this.defender,
  });

  const BattleScenario.empty()
      : this(
          attacker: const AttackingLegion.empty(),
          defender: const DefendingLegion.empty(),
        );

  final AttackingLegion attacker;
  final DefendingLegion defender;

  BattleScenario copyWith({
    AttackingLegion? attacker,
    DefendingLegion? defender,
  }) {
    return BattleScenario(
      attacker: attacker ?? this.attacker,
      defender: defender ?? this.defender,
    );
  }
}
