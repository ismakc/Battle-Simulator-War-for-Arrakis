import 'package:bswfa_ui/bloc/battle_history_bloc.dart';
import 'package:bswfa_ui/bloc/battle_scenario_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BattleSimulatorButton extends StatelessWidget {
  const BattleSimulatorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
      ),
      onPressed: () {
        final BattleScenarioState battleScenario = context.read<BattleScenarioBloc>().state;
        context.read<BattleHistoryBloc>().add(BattleHistoryEvent.simulateBattle(battleScenario.battleScenario));
      },
      child: const Align(
        heightFactor: 1.6,
        child: Text(
          'Simulate Battle',
          style: TextStyle(fontSize: 18, color: Colors.amber, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
