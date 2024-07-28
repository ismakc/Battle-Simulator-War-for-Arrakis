import 'dart:async';

import 'package:bswfa/domain/battle_result.dart';
import 'package:bswfa/domain/battle_scenario.dart';
import 'package:bswfa/service/battle_simulator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'full_battle_simulation_bloc.freezed.dart';

class FullBattleSimulationBloc extends Bloc<FullBattleSimulationEvent, FullBattleSimulationState> {
  FullBattleSimulationBloc() : super(FullBattleSimulationState.initial()) {
    on<_SimulateFullBattle>(_onSimulateFullBattle);
  }

  final simulator = BattleSimulator.getInstance();

  FutureOr<void> _onSimulateFullBattle(_SimulateFullBattle event, Emitter<FullBattleSimulationState> emit) {
    emit(
      FullBattleSimulationState(
        battleResult: simulator.simulateMultipleRounds(event.battleScenario),
      ),
    );
  }
}

@freezed
class FullBattleSimulationEvent with _$FullBattleSimulationEvent {
  factory FullBattleSimulationEvent.simulateFullBattle(BattleScenario battleScenario) = _SimulateFullBattle;
}

@freezed
class FullBattleSimulationState with _$FullBattleSimulationState {
  const factory FullBattleSimulationState({required BattleResult battleResult}) = _FullBattleSimulationState;

  factory FullBattleSimulationState.initial() =>
      const FullBattleSimulationState(battleResult: BattleResult.defaultValues);
}
