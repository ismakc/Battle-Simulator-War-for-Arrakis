import 'package:bswfa/bloc/battle_scenario_bloc.dart';
import 'package:bswfa/domain/defending_legion.dart';
import 'package:bswfa/presentation/widgets/common/label_border_field_set.dart';
import 'package:bswfa/presentation/widgets/legion_input/named_leader_input.dart';
import 'package:bswfa/presentation/widgets/legion_input/unit_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefendingLegionInput extends StatelessWidget {
  const DefendingLegionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return LabeledBorderFieldset(
      label: 'Defending Legion',
      borderColor: Colors.black87,
      textColor: Colors.black87,
      child: BlocSelector<BattleScenarioBloc, BattleScenarioState, DefendingLegion>(
        selector: (state) => state.battleScenario.defendingLegion,
        builder: (context, state) {
          return Wrap(
            runSpacing: 5.0,
            children: [
              UnitInput(
                label: 'Leader',
                startPosition: state.genericLeaders,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(genericLeaders: value)));
                },
              ),
              UnitInput(
                label: 'Regular',
                startPosition: state.regularUnits,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(regularUnits: value)));
                },
              ),
              UnitInput(
                label: 'Elite',
                startPosition: state.eliteUnits,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(eliteUnits: value)));
                },
              ),
              UnitInput(
                label: 'Special',
                startPosition: state.specialEliteUnits,
                onValueChanged: (value) {
                  context.read<BattleScenarioBloc>().add(
                        BattleScenarioEvent.updateDefendingLegion(state.copyWith(specialEliteUnits: value)),
                      );
                },
              ),
              UnitInput(
                label: 'Cards',
                startPosition: state.usedCards,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(usedCards: value)));
                },
              ),
              UnitInput(
                label: 'Settl.',
                startPosition: state.settlementLevel,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(settlementLevel: value)));
                },
              ),
              NamedLeaderInput(
                label: 'Named',
                values: state.namedLeaders,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(namedLeaders: value)));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
