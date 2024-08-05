import 'package:bswfa_core/domain/legion/legion.dart';
import 'package:bswfa_core/domain/legion/named_leader.dart';
import 'package:bswfa_ui/bloc/battle_scenario_bloc.dart';
import 'package:bswfa_ui/presentation/widgets/common/label_border_field_set.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/named_leader_input.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/surprise_attack_input.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/unit_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttackingLegionInput extends StatelessWidget {
  const AttackingLegionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BattleScenarioBloc, BattleScenarioState, AttackingLegion>(
      selector: (BattleScenarioState state) => state.battleScenario.attacker,
      builder: (BuildContext context, AttackingLegion state) {
        return LabeledBorderFieldset(
          label:
              'Attacking Legion ( ${state.diceCount}\u{1F3B2}of ${state.unlimitedDiceCount}  /  ${state.starsCount}\u{2B50}of ${state.unlimitedStarsCount}  /  -${state.specialEliteUnits}\u{1F6E1}  /  ${state.lifeCount}\u{2764}\u{FE0F} )',
          borderColor: Colors.amber,
          textColor: Colors.black87,
          child: Wrap(
            runSpacing: 8.0,
            children: <Widget>[
              UnitInput(
                label: 'Leader',
                startPosition: state.genericLeaders,
                onValueChanged: (int value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(genericLeaders: value)));
                },
              ),
              UnitInput(
                label: 'Regular',
                startPosition: state.regularUnits,
                onValueChanged: (int value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(regularUnits: value)));
                },
              ),
              UnitInput(
                label: 'Elite',
                startPosition: state.eliteUnits,
                onValueChanged: (int value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(eliteUnits: value)));
                },
              ),
              UnitInput(
                label: 'Special',
                startPosition: state.specialEliteUnits,
                onValueChanged: (int value) {
                  context.read<BattleScenarioBloc>().add(
                        BattleScenarioEvent.updateAttackingLegion(state.copyWith(specialEliteUnits: value)),
                      );
                },
              ),
              UnitInput(
                label: 'Cards',
                startPosition: state.usedCards,
                onValueChanged: (int value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(usedCards: value)));
                },
              ),
              NamedLeaderInput(
                label: 'Named',
                values: state.namedLeaders,
                onValueChanged: (List<NamedLeader> value) {
                  context
                      .read<BattleScenarioBloc>()
                      .add(BattleScenarioEvent.updateAttackingLegion(state.copyWith(namedLeaders: value)));
                },
              ),
              SurpriseAttackInput(
                label: 'Surprise',
                value: state.surpriseAttack,
                onValueChanged: (bool value) {
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
