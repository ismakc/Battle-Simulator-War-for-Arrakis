import 'package:bswfa_ui/bloc/battle_scenario_bloc.dart';
import 'package:bswfa_core/domain/legion/defending_legion.dart';
import 'package:bswfa_core/domain/legion/named_leader.dart';
import 'package:bswfa_ui/presentation/widgets/common/label_border_field_set.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/named_leader_input.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/unit_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefendingLegionInput extends StatelessWidget {
  const DefendingLegionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BattleScenarioBloc, BattleScenarioState, DefendingLegion>(
      selector: (BattleScenarioState state) => state.battleScenario.defendingLegion,
      builder: (BuildContext context, DefendingLegion state) {
        return LabeledBorderFieldset(
          label:
              'Defending Legion ( ${state.diceCount}\u{1F3B2}of ${state.unlimitedMaxDiceCount}/  ${state.maxStarsCount}\u{2B50}of ${state.unlimitedMaxStarsCount}  /  -${state.specialEliteUnits}\u{1F6E1}  /  ${state.lifeCount}\u{2764}\u{FE0F} )',
          borderColor: Colors.black87,
          textColor: Colors.black87,
          child: Wrap(
            runSpacing: 5.0,
            children: <Widget>[
              UnitInput(
                label: 'Leader',
                startPosition: state.genericLeaders,
                onValueChanged: (int value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(genericLeaders: value)));
                },
              ),
              UnitInput(
                label: 'Regular',
                startPosition: state.regularUnits,
                onValueChanged: (int value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(regularUnits: value)));
                },
              ),
              UnitInput(
                label: 'Elite',
                startPosition: state.eliteUnits,
                onValueChanged: (int value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(eliteUnits: value)));
                },
              ),
              UnitInput(
                label: 'Special',
                startPosition: state.specialEliteUnits,
                onValueChanged: (int value) {
                  context.read<BattleScenarioBloc>().add(
                        BattleScenarioEvent.updateDefendingLegion(state.copyWith(specialEliteUnits: value)),
                      );
                },
              ),
              UnitInput(
                label: 'Cards',
                startPosition: state.usedCards,
                onValueChanged: (int value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(usedCards: value)));
                },
              ),
              NamedLeaderInput(
                label: 'Named',
                values: state.namedLeaders,
                onValueChanged: (List<NamedLeader> value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(namedLeaders: value)));
                },
              ),
              UnitInput(
                label: 'Settl.',
                startPosition: state.settlementLevel,
                onValueChanged: (int value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateDefendingLegion(state.copyWith(settlementLevel: value)));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
