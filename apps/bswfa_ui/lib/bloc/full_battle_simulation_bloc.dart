import 'dart:async';

import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/battle_statistic.dart';
import 'package:bswfa_core/battle/result/automatic_battle_end_reason.dart';
import 'package:bswfa_core/battle/result/battle_result.dart';
import 'package:bswfa_core/battle/simulation/automatic_battle_resolver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'full_battle_simulation_bloc.freezed.dart';

class FullBattleSimulationBloc
    extends Bloc<FullBattleSimulationEvent, FullBattleSimulationState> {
  FullBattleSimulationBloc() : super(FullBattleSimulationState.initial()) {
    on<_SimulateFullBattle>(_onSimulateFullBattle);
  }

  final AutomaticBattleResolver resolver = const AutomaticBattleResolver();

  FutureOr<void> _onSimulateFullBattle(
    _SimulateFullBattle event,
    Emitter<FullBattleSimulationState> emit,
  ) {
    emit(
      FullBattleSimulationState(
        battleResult: resolver.resolve(event.battleScenario),
      ),
    );
  }
}

@freezed
abstract class FullBattleSimulationEvent with _$FullBattleSimulationEvent {
  factory FullBattleSimulationEvent.simulateFullBattle(
    BattleScenario battleScenario,
  ) = _SimulateFullBattle;
}

@freezed
abstract class FullBattleSimulationState with _$FullBattleSimulationState {
  const factory FullBattleSimulationState({
    required BattleResult battleResult,
  }) = _FullBattleSimulationState;

  factory FullBattleSimulationState.initial() {
    return const FullBattleSimulationState(
      battleResult: BattleResult(
        playedCombatRounds: 0,
        endReason: AutomaticBattleEndReason.notResolved,
        resultingScenario: BattleScenario(),
        statistic: BattleStatistic(),
      ),
    );
  }
}
