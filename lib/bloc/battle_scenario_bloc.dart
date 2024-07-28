import 'dart:async';

import 'package:bswfa/domain/attacking_legion.dart';
import 'package:bswfa/domain/battle_scenario.dart';
import 'package:bswfa/domain/defending_legion.dart';
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
    final BattleScenario updatedBattleScenario = state.battleScenario.copyWith(attackingLegion: event.attackingLegion);
    emit(BattleScenarioState(battleScenario: updatedBattleScenario));
  }

  FutureOr<void> _onUpdateDefendingLegion(_UpdateDefendingLegion event, Emitter<BattleScenarioState> emit) {
    final BattleScenario updatedBattleScenario = state.battleScenario.copyWith(defendingLegion: event.defendingLegion);
    emit(BattleScenarioState(battleScenario: updatedBattleScenario));
  }

  FutureOr<void> _onReset(event, Emitter<BattleScenarioState> emit) {
    emit(const BattleScenarioState(battleScenario: BattleScenario.defaultValues));
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

  factory BattleScenarioState.initial() => const BattleScenarioState(battleScenario: BattleScenario.defaultValues);
}
