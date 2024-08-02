import 'package:bswfa_ui/bloc/full_battle_simulation_bloc.dart';
import 'package:bswfa_core/domain/battle/battle_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FullBattleSimulationPopupDialog extends StatelessWidget {
  const FullBattleSimulationPopupDialog({required this.battleResult, super.key});

  final BattleResult battleResult;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 10,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 45, 20, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber, width: 2),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: BlocBuilder<FullBattleSimulationBloc, FullBattleSimulationState>(
              builder: (BuildContext context, FullBattleSimulationState state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildAlignedText(context, 'Rounds: ', '${battleResult.playedCombatRounds} \u{23F3}'),
                    _buildAlignedText(
                      context,
                      'Att.Hits: ',
                      '${battleResult.statistic.attackerExpectedHits.toStringAsFixed(2)} \u{2694}',
                    ),
                    _buildAlignedText(
                      context,
                      'Def.Hits: ',
                      '${battleResult.statistic.defenderExpectedHits.toStringAsFixed(2)} \u{2694}',
                    ),
                    _buildAlignedText(context, 'Probable Winner: ', '${battleResult.winner()}\u{1F3C6}'),
                  ],
                );
              },
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black54),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          const Positioned(
            top: 10,
            left: 20,
            child: Text(
              'Full Battle Simulation',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlignedText(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
