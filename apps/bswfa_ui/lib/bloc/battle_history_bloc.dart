import 'dart:async';

import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/statistics/battle_statistic_calculator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bswfa_ui/model/round_battle_summary.dart';

part 'battle_history_bloc.freezed.dart';

class BattleHistoryBloc extends Bloc<BattleHistoryEvent, BattleHistoryState> {
  BattleHistoryBloc() : super(BattleHistoryState.initial()) {
    on<_SimulateBattle>(_onSimulateBattle);
    on<_Reset>(_onReset);
  }

  FutureOr<void> _onSimulateBattle(
    _SimulateBattle event,
    Emitter<BattleHistoryState> emit,
  ) {
    final RoundBattleSummary roundSummary = RoundBattleSummary(
      scenario: event.battleScenario,
      statistic: BattleStatisticCalculator.calculate(event.battleScenario),
    );

    emit(
      BattleHistoryState(
        battleHistory: List<RoundBattleSummary>.of(state.battleHistory)
          ..insert(0, roundSummary),
      ),
    );
  }

  FutureOr<void> _onReset(_Reset event, Emitter<BattleHistoryState> emit) {
    emit(const BattleHistoryState(battleHistory: <RoundBattleSummary>[]));
  }
}

@freezed
class BattleHistoryEvent with _$BattleHistoryEvent {
  factory BattleHistoryEvent.simulateBattle(BattleScenario battleScenario) =
      _SimulateBattle;

  const factory BattleHistoryEvent.reset() = _Reset;
}

@freezed
abstract class BattleHistoryState with _$BattleHistoryState {
  const factory BattleHistoryState({
    required List<RoundBattleSummary> battleHistory,
  }) = _BattleHistoryState;

  factory BattleHistoryState.initial() =>
      const BattleHistoryState(battleHistory: <RoundBattleSummary>[]);
}
