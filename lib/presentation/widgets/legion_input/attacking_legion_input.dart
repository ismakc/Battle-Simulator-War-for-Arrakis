import 'package:bswfa/bloc/battle_scenario_bloc.dart';
import 'package:bswfa/domain/attacking_legion.dart';
import 'package:bswfa/presentation/widgets/common/label_border_field_set.dart';
import 'package:bswfa/presentation/widgets/legion_input/named_leader_input.dart';
import 'package:bswfa/presentation/widgets/legion_input/surprise_attack_input.dart';
import 'package:bswfa/presentation/widgets/legion_input/unit_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttackingLegionInput extends StatelessWidget {
  const AttackingLegionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BattleScenarioBloc, BattleScenarioState, AttackingLegion>(
      selector: (state) => state.battleScenario.attackingLegion,
      builder: (context, state) {
        return LabeledBorderFieldset(
          label:
              'Attacking Legion (${state.diceCount()}\u{1F3B2}/${state.maxStarsCount()}\u{2B50} of ${state.unlimitedMaxStarsCount()})',
          borderColor: Colors.amber,
          textColor: Colors.black87,
          child: Wrap(
            runSpacing: 8.0,
            children: [
              UnitInput(
                label: 'Leader',
                startPosition: state.genericLeaders,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(genericLeaders: value)));
                },
              ),
              UnitInput(
                label: 'Regular',
                startPosition: state.regularUnits,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(regularUnits: value)));
                },
              ),
              UnitInput(
                label: 'Elite',
                startPosition: state.eliteUnits,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(eliteUnits: value)));
                },
              ),
              UnitInput(
                label: 'Special',
                startPosition: state.specialEliteUnits,
                onValueChanged: (value) {
                  context.read<BattleScenarioBloc>().add(
                        BattleScenarioEvent.updateAttackingLegion(state.copyWith(specialEliteUnits: value)),
                      );
                },
              ),
              UnitInput(
                label: 'Cards',
                startPosition: state.usedCards,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(usedCards: value)));
                },
              ),
              NamedLeaderInput(
                label: 'Named',
                values: state.namedLeaders,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(namedLeaders: value)));
                },
              ),
              SurpriseAttackInput(
                label: 'Surprise',
                value: state.surpriseAttack,
                onValueChanged: (value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(surpriseAttack: value)));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
