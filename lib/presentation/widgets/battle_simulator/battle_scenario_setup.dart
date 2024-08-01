import 'package:bswfa/presentation/widgets/legion_input/attacking_legion_input.dart';
import 'package:bswfa/presentation/widgets/legion_input/defending_legion_input.dart';
import 'package:flutter/material.dart';

class BattleScenarioSetup extends StatelessWidget {
  const BattleScenarioSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      runSpacing: 8.0,
      children: <Widget>[
        AttackingLegionInput(),
        DefendingLegionInput(),
      ],
    );
  }
}
