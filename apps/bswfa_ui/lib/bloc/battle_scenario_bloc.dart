import 'dart:async';

import 'package:bswfa_core/domain/battle/battle_scenario.dart';
import 'package:bswfa_core/domain/legion/legion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_scenario_bloc.freezed.dart';

class BattleScenarioBloc extends Bloc<BattleScenarioEvent, BattleScenarioState> {
  BattleScenarioBloc() : super(BattleScenarioState.initial()) {
    on<_UpdateAttackingLegion>(_onUpdateAttackingLegion);
    on<_UpdateDefendingLegion>(_onUpdateDefendingLegion);
    on<_Reset>(_onReset);
  }

  FutureOr<void> _onUpdateAttackingLegion(_UpdateAttackingLegion event, Emitter<BattleScenarioState> emit) {
    final BattleScenario updatedBattleScenario = state.battleScenario.copyWith(attacker: event.attackingLegion);
    emit(BattleScenarioState(battleScenario: updatedBattleScenario));
  }

  FutureOr<void> _onUpdateDefendingLegion(_UpdateDefendingLegion event, Emitter<BattleScenarioState> emit) {
    final BattleScenario updatedBattleScenario = state.battleScenario.copyWith(defender: event.defendingLegion);
    emit(BattleScenarioState(battleScenario: updatedBattleScenario));
  }

  FutureOr<void> _onReset(_Reset event, Emitter<BattleScenarioState> emit) {
    emit(const BattleScenarioState(battleScenario: BattleScenario.empty()));
  }
}

@freezed
class BattleScenarioEvent with _$BattleScenarioEvent {
  const factory BattleScenarioEvent.updateAttackingLegion(AttackingLegion attackingLegion) = _UpdateAttackingLegion;

  const factory BattleScenarioEvent.updateDefendingLegion(DefendingLegion defendingLegion) = _UpdateDefendingLegion;

  const factory BattleScenarioEvent.reset() = _Reset;
}

@freezed
class BattleScenarioState with _$BattleScenarioState {
  const factory BattleScenarioState({required BattleScenario battleScenario}) = _BattleScenarioState;

  factory BattleScenarioState.initial() => const BattleScenarioState(battleScenario: BattleScenario.empty());
}
