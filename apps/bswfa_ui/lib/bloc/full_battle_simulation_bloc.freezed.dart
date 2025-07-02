// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_battle_simulation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FullBattleSimulationEvent {

 BattleScenario get battleScenario;
/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullBattleSimulationEventCopyWith<FullBattleSimulationEvent> get copyWith => _$FullBattleSimulationEventCopyWithImpl<FullBattleSimulationEvent>(this as FullBattleSimulationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullBattleSimulationEvent&&(identical(other.battleScenario, battleScenario) || other.battleScenario == battleScenario));
}


@override
int get hashCode => Object.hash(runtimeType,battleScenario);

@override
String toString() {
  return 'FullBattleSimulationEvent(battleScenario: $battleScenario)';
}


}

/// @nodoc
abstract mixin class $FullBattleSimulationEventCopyWith<$Res>  {
  factory $FullBattleSimulationEventCopyWith(FullBattleSimulationEvent value, $Res Function(FullBattleSimulationEvent) _then) = _$FullBattleSimulationEventCopyWithImpl;
@useResult
$Res call({
 BattleScenario battleScenario
});


$BattleScenarioCopyWith<$Res> get battleScenario;

}
/// @nodoc
class _$FullBattleSimulationEventCopyWithImpl<$Res>
    implements $FullBattleSimulationEventCopyWith<$Res> {
  _$FullBattleSimulationEventCopyWithImpl(this._self, this._then);

  final FullBattleSimulationEvent _self;
  final $Res Function(FullBattleSimulationEvent) _then;

/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? battleScenario = null,}) {
  return _then(_self.copyWith(
battleScenario: null == battleScenario ? _self.battleScenario : battleScenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,
  ));
}
/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleScenarioCopyWith<$Res> get battleScenario {
  
  return $BattleScenarioCopyWith<$Res>(_self.battleScenario, (value) {
    return _then(_self.copyWith(battleScenario: value));
  });
}
}


/// @nodoc


class _SimulateFullBattle implements FullBattleSimulationEvent {
   _SimulateFullBattle(this.battleScenario);
  

@override final  BattleScenario battleScenario;

/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimulateFullBattleCopyWith<_SimulateFullBattle> get copyWith => __$SimulateFullBattleCopyWithImpl<_SimulateFullBattle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimulateFullBattle&&(identical(other.battleScenario, battleScenario) || other.battleScenario == battleScenario));
}


@override
int get hashCode => Object.hash(runtimeType,battleScenario);

@override
String toString() {
  return 'FullBattleSimulationEvent.simulateFullBattle(battleScenario: $battleScenario)';
}


}

/// @nodoc
abstract mixin class _$SimulateFullBattleCopyWith<$Res> implements $FullBattleSimulationEventCopyWith<$Res> {
  factory _$SimulateFullBattleCopyWith(_SimulateFullBattle value, $Res Function(_SimulateFullBattle) _then) = __$SimulateFullBattleCopyWithImpl;
@override @useResult
$Res call({
 BattleScenario battleScenario
});


@override $BattleScenarioCopyWith<$Res> get battleScenario;

}
/// @nodoc
class __$SimulateFullBattleCopyWithImpl<$Res>
    implements _$SimulateFullBattleCopyWith<$Res> {
  __$SimulateFullBattleCopyWithImpl(this._self, this._then);

  final _SimulateFullBattle _self;
  final $Res Function(_SimulateFullBattle) _then;

/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? battleScenario = null,}) {
  return _then(_SimulateFullBattle(
null == battleScenario ? _self.battleScenario : battleScenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,
  ));
}

/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleScenarioCopyWith<$Res> get battleScenario {
  
  return $BattleScenarioCopyWith<$Res>(_self.battleScenario, (value) {
    return _then(_self.copyWith(battleScenario: value));
  });
}
}

/// @nodoc
mixin _$FullBattleSimulationState {

 BattleResult get battleResult;
/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullBattleSimulationStateCopyWith<FullBattleSimulationState> get copyWith => _$FullBattleSimulationStateCopyWithImpl<FullBattleSimulationState>(this as FullBattleSimulationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullBattleSimulationState&&(identical(other.battleResult, battleResult) || other.battleResult == battleResult));
}


@override
int get hashCode => Object.hash(runtimeType,battleResult);

@override
String toString() {
  return 'FullBattleSimulationState(battleResult: $battleResult)';
}


}

/// @nodoc
abstract mixin class $FullBattleSimulationStateCopyWith<$Res>  {
  factory $FullBattleSimulationStateCopyWith(FullBattleSimulationState value, $Res Function(FullBattleSimulationState) _then) = _$FullBattleSimulationStateCopyWithImpl;
@useResult
$Res call({
 BattleResult battleResult
});


$BattleResultCopyWith<$Res> get battleResult;

}
/// @nodoc
class _$FullBattleSimulationStateCopyWithImpl<$Res>
    implements $FullBattleSimulationStateCopyWith<$Res> {
  _$FullBattleSimulationStateCopyWithImpl(this._self, this._then);

  final FullBattleSimulationState _self;
  final $Res Function(FullBattleSimulationState) _then;

/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? battleResult = null,}) {
  return _then(_self.copyWith(
battleResult: null == battleResult ? _self.battleResult : battleResult // ignore: cast_nullable_to_non_nullable
as BattleResult,
  ));
}
/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleResultCopyWith<$Res> get battleResult {
  
  return $BattleResultCopyWith<$Res>(_self.battleResult, (value) {
    return _then(_self.copyWith(battleResult: value));
  });
}
}


/// @nodoc


class _FullBattleSimulationState implements FullBattleSimulationState {
  const _FullBattleSimulationState({required this.battleResult});
  

@override final  BattleResult battleResult;

/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FullBattleSimulationStateCopyWith<_FullBattleSimulationState> get copyWith => __$FullBattleSimulationStateCopyWithImpl<_FullBattleSimulationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FullBattleSimulationState&&(identical(other.battleResult, battleResult) || other.battleResult == battleResult));
}


@override
int get hashCode => Object.hash(runtimeType,battleResult);

@override
String toString() {
  return 'FullBattleSimulationState(battleResult: $battleResult)';
}


}

/// @nodoc
abstract mixin class _$FullBattleSimulationStateCopyWith<$Res> implements $FullBattleSimulationStateCopyWith<$Res> {
  factory _$FullBattleSimulationStateCopyWith(_FullBattleSimulationState value, $Res Function(_FullBattleSimulationState) _then) = __$FullBattleSimulationStateCopyWithImpl;
@override @useResult
$Res call({
 BattleResult battleResult
});


@override $BattleResultCopyWith<$Res> get battleResult;

}
/// @nodoc
class __$FullBattleSimulationStateCopyWithImpl<$Res>
    implements _$FullBattleSimulationStateCopyWith<$Res> {
  __$FullBattleSimulationStateCopyWithImpl(this._self, this._then);

  final _FullBattleSimulationState _self;
  final $Res Function(_FullBattleSimulationState) _then;

/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? battleResult = null,}) {
  return _then(_FullBattleSimulationState(
battleResult: null == battleResult ? _self.battleResult : battleResult // ignore: cast_nullable_to_non_nullable
as BattleResult,
  ));
}

/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleResultCopyWith<$Res> get battleResult {
  
  return $BattleResultCopyWith<$Res>(_self.battleResult, (value) {
    return _then(_self.copyWith(battleResult: value));
  });
}
}

// dart format on
