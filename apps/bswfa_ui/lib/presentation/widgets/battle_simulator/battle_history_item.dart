import 'package:bswfa_core/domain/battle/battle_result.dart';
import 'package:bswfa_ui/bloc/full_battle_simulation_bloc.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/full_battle_simulation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BattleHistoryItem extends StatelessWidget {
  const BattleHistoryItem({required this.battleResult, required this.displayIndex, super.key});

  final BattleResult battleResult;
  final int displayIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<FullBattleSimulationBloc>().add(
          FullBattleSimulationEvent.simulateFullBattle(battleResult.scenario),
        );
        _showPopup(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        decoration: BoxDecoration(
          border: Border.all(color: displayIndex % 2 == 0 ? Colors.amber : Colors.black87, width: 1.6),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -5.0,
              right: -5.0,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Text('#$displayIndex', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildRow(
                      label: 'Att.Hits:',
                      hits: battleResult.statistic.attackerExpectedHits,
                      legion: battleResult.attackingLegion,
                      isAttacker: true,
                    ),
                    const SizedBox(height: 3.0),
                    _buildRow(
                      label: 'Def.Hits:',
                      hits: battleResult.statistic.defenderExpectedHits,
                      legion: battleResult.defendingLegion,
                      isAttacker: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({required String label, required double hits, required dynamic legion, required bool isAttacker}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children:
            <RenderObjectWidget>[
                  DecoratedBox(
                    decoration: BoxDecoration(color: isAttacker ? Colors.black87 : Colors.amber),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 67,
                          child: Text(
                            label,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isAttacker ? Colors.amber : Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 60,
                          child: Text(
                            '${hits.toStringAsFixed(2)}\u{2694}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isAttacker ? Colors.amber : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildRichText('L', '${legion.genericLeaders}'),
                  _buildRichText('R', '${legion.regularUnits}'),
                  _buildRichText('E', '${legion.eliteUnits}'),
                  _buildRichText('S', '${legion.specialEliteUnits}'),
                  _buildRichText('C', '${legion.usedCards}'),
                  _buildRichText('N', '${legion.namedLeaders.length}'),
                  _buildRichText(
                    isAttacker ? 'A' : 'S:',
                    isAttacker ? ' ${legion.surpriseAttack ? 'yes' : 'no'}' : ' ${legion.settlementLevel}',
                  ),
                ]
                .map(
                  (RenderObjectWidget child) =>
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0), child: child),
                )
                .toList(),
      ),
    );
  }

  Row _buildRichText(String t1, String t2) {
    return Row(
      children: <Widget>[
        Text(t1, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(t2, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FullBattleSimulationPopupDialog(
          battleResult: context.watch<FullBattleSimulationBloc>().state.battleResult,
        );
      },
    );
  }
}
