import 'dart:async';

import 'package:bswfa/domain/battle/battle_result.dart';
import 'package:bswfa/domain/battle/battle_scenario.dart';
import 'package:bswfa/service/battle_simulator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_history_bloc.freezed.dart';

class BattleHistoryBloc extends Bloc<BattleHistoryEvent, BattleHistoryState> {
  BattleHistoryBloc() : super(BattleHistoryState.initial()) {
    on<_SimulateBattle>(_onSimulateBattle);
    on<_Reset>(_onReset);
  }

  final BattleSimulator simulator = BattleSimulator.instance;

  FutureOr<void> _onSimulateBattle(_SimulateBattle event, Emitter<BattleHistoryState> emit) {
    emit(
      BattleHistoryState(
        battleHistory: List<BattleResult>.of(state.battleHistory)
          ..insert(0, simulator.simulateSingleRound(event.battleScenario)),
      ),
    );
  }

  FutureOr<void> _onReset(_Reset event, Emitter<BattleHistoryState> emit) {
    emit(
      const BattleHistoryState(battleHistory: <BattleResult>[]),
    );
  }
}

@freezed
class BattleHistoryEvent with _$BattleHistoryEvent {
  factory BattleHistoryEvent.simulateBattle(BattleScenario battleScenario) = _SimulateBattle;

  const factory BattleHistoryEvent.reset() = _Reset;
}

@freezed
class BattleHistoryState with _$BattleHistoryState {
  const factory BattleHistoryState({required List<BattleResult> battleHistory}) = _BattleHistoryState;

  factory BattleHistoryState.initial() => const BattleHistoryState(battleHistory: <BattleResult>[]);
}
