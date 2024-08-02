import 'package:bswfa_ui/bloc/battle_history_bloc.dart';
import 'package:bswfa_core/domain/battle/battle_result.dart';
import 'package:bswfa_ui/presentation/widgets/battle_simulator/battle_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BattleHistory extends StatelessWidget {
  const BattleHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BattleHistoryBloc, BattleHistoryState>(
      builder: (BuildContext context, BattleHistoryState state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.battleHistory.length,
          itemBuilder: (BuildContext context, int index) {
            final BattleResult battleResult = state.battleHistory[index];
            return BattleHistoryItem(
              key: ValueKey<int>(index),
              battleResult: battleResult,
              displayIndex: state.battleHistory.length - index,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 3.0),
            );
          },
        );
      },
    );
  }
}
