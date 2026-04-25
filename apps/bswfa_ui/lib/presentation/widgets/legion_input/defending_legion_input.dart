import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/named_leader.dart';
import 'package:bswfa_ui/bloc/battle_scenario_bloc.dart';
import 'package:bswfa_ui/presentation/widgets/common/label_border_field_set.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/legion_summary_strip.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/named_leader_input.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/unit_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefendingLegionInput extends StatelessWidget {
  const DefendingLegionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      BattleScenarioBloc,
      BattleScenarioState,
      DefendingLegion
    >(
      selector: (BattleScenarioState state) =>
          state.battleScenario.defendingLegion,
      builder: (BuildContext context, DefendingLegion state) {
        return LabeledBorderFieldset(
          label: 'Defending Legion',
          borderColor: Colors.black87,
          textColor: Colors.black87,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LegionSummaryStrip(
                entries:
                    <
                      ({String label, String value, IconData icon, Color color})
                    >[
                      (
                        label: 'Dice',
                        value: _cappedValue(
                          state.diceCount,
                          state.unlimitedDiceCount,
                        ),
                        icon: Icons.casino_outlined,
                        color: Colors.deepPurple,
                      ),
                      (
                        label: 'Stars',
                        value:
                            '${state.maxStarsCount}/${state.unlimitedStarsCount}',
                        icon: Icons.auto_awesome,
                        color: Colors.amber.shade800,
                      ),
                      (
                        label: 'Cancel shields',
                        value: '${state.removedShieldsCount}',
                        icon: Icons.shield_outlined,
                        color: Colors.lightBlue,
                      ),
                      (
                        label: 'Can take',
                        value: '${state.remainingLossCapacity}',
                        icon: Icons.favorite_outline,
                        color: Colors.redAccent,
                      ),
                    ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Main Force',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 10.0),
              Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: <Widget>[
                  _SizedInput(
                    child: UnitInput(
                      label: 'Leader',
                      startPosition: state.genericLeaders,
                      onValueChanged: (int value) {
                        context.read<BattleScenarioBloc>().add(
                          BattleScenarioEvent.updateDefendingLegion(
                            state.copyWith(genericLeaders: value),
                          ),
                        );
                      },
                    ),
                  ),
                  _SizedInput(
                    child: UnitInput(
                      label: 'Regular',
                      startPosition: state.regularUnits,
                      onValueChanged: (int value) {
                        context.read<BattleScenarioBloc>().add(
                          BattleScenarioEvent.updateDefendingLegion(
                            state.copyWith(regularUnits: value),
                          ),
                        );
                      },
                    ),
                  ),
                  _SizedInput(
                    child: UnitInput(
                      label: 'Elite',
                      startPosition: state.eliteUnits,
                      onValueChanged: (int value) {
                        context.read<BattleScenarioBloc>().add(
                          BattleScenarioEvent.updateDefendingLegion(
                            state.copyWith(eliteUnits: value),
                          ),
                        );
                      },
                    ),
                  ),
                  _SizedInput(
                    child: UnitInput(
                      label: 'Special',
                      startPosition: state.specialEliteUnits,
                      onValueChanged: (int value) {
                        context.read<BattleScenarioBloc>().add(
                          BattleScenarioEvent.updateDefendingLegion(
                            state.copyWith(specialEliteUnits: value),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Theme(
                data: Theme.of(
                  context,
                ).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: const EdgeInsets.only(bottom: 4.0),
                  title: const Text(
                    'Round Options',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54,
                      letterSpacing: 0.2,
                    ),
                  ),
                  subtitle: Text(
                    '${state.usedCards} cards, ${state.namedLeaders.length} named, settlement ${state.settlementLevel}',
                    style: const TextStyle(fontSize: 12.0),
                  ),
                  children: <Widget>[
                    const SizedBox(height: 8.0),
                    Wrap(
                      spacing: 12.0,
                      runSpacing: 12.0,
                      children: <Widget>[
                        _SizedInput(
                          child: UnitInput(
                            label: 'Cards',
                            startPosition: state.usedCards,
                            onValueChanged: (int value) {
                              context.read<BattleScenarioBloc>().add(
                                BattleScenarioEvent.updateDefendingLegion(
                                  state.copyWith(usedCards: value),
                                ),
                              );
                            },
                          ),
                        ),
                        _SizedInput(
                          child: UnitInput(
                            label: 'Settl.',
                            startPosition: state.settlementLevel,
                            onValueChanged: (int value) {
                              context.read<BattleScenarioBloc>().add(
                                BattleScenarioEvent.updateDefendingLegion(
                                  state.copyWith(settlementLevel: value),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    NamedLeaderInput(
                      label: 'Named',
                      values: state.namedLeaders,
                      onValueChanged: (List<NamedLeader> value) {
                        context.read<BattleScenarioBloc>().add(
                          BattleScenarioEvent.updateDefendingLegion(
                            state.copyWith(namedLeaders: value),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SizedInput extends StatelessWidget {
  const _SizedInput({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 276.0, child: child);
  }
}

String _cappedValue(int value, int uncappedValue) {
  if (uncappedValue <= value) {
    return '$value';
  }

  return '$value/$uncappedValue cap';
}
