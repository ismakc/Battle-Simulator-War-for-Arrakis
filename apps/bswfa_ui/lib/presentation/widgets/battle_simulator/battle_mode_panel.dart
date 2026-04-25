import 'package:bswfa_ui/presentation/widgets/battle_simulator/battle_scenario_setup.dart';
import 'package:bswfa_ui/presentation/widgets/battle_simulator/battle_simulator_button.dart';
import 'package:bswfa_ui/presentation/widgets/battle_simulator/legion_recommendation_setup.dart';
import 'package:flutter/material.dart';

enum _BattleMode { simulate, recommend }

class BattleModePanel extends StatefulWidget {
  const BattleModePanel({super.key});

  @override
  State<BattleModePanel> createState() => _BattleModePanelState();
}

class _BattleModePanelState extends State<BattleModePanel> {
  _BattleMode _mode = _BattleMode.simulate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SegmentedButton<_BattleMode>(
          segments: const <ButtonSegment<_BattleMode>>[
            ButtonSegment<_BattleMode>(
              value: _BattleMode.simulate,
              icon: Icon(Icons.casino_outlined),
              label: Text('Simular batalla'),
            ),
            ButtonSegment<_BattleMode>(
              value: _BattleMode.recommend,
              icon: Icon(Icons.manage_search_outlined),
              label: Text('Recomendar legion'),
            ),
          ],
          selected: <_BattleMode>{_mode},
          onSelectionChanged: (Set<_BattleMode> value) {
            setState(() {
              _mode = value.first;
            });
          },
        ),
        const SizedBox(height: 8.0),
        switch (_mode) {
          _BattleMode.simulate => const Wrap(
            runSpacing: 8.0,
            children: <Widget>[BattleScenarioSetup(), BattleSimulatorButton()],
          ),
          _BattleMode.recommend => const LegionRecommendationSetup(),
        },
      ],
    );
  }
}
