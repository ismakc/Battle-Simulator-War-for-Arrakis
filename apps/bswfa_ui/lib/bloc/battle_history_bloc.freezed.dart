// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BattleHistoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleHistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BattleHistoryEvent()';
}


}

/// @nodoc
class $BattleHistoryEventCopyWith<$Res>  {
$BattleHistoryEventCopyWith(BattleHistoryEvent _, $Res Function(BattleHistoryEvent) __);
}


/// @nodoc


class _SimulateBattle implements BattleHistoryEvent {
   _SimulateBattle(this.battleScenario);
  

 final  BattleScenario battleScenario;

/// Create a copy of BattleHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimulateBattleCopyWith<_SimulateBattle> get copyWith => __$SimulateBattleCopyWithImpl<_SimulateBattle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimulateBattle&&(identical(other.battleScenario, battleScenario) || other.battleScenario == battleScenario));
}


@override
int get hashCode => Object.hash(runtimeType,battleScenario);

@override
String toString() {
  return 'BattleHistoryEvent.simulateBattle(battleScenario: $battleScenario)';
}


}

/// @nodoc
abstract mixin class _$SimulateBattleCopyWith<$Res> implements $BattleHistoryEventCopyWith<$Res> {
  factory _$SimulateBattleCopyWith(_SimulateBattle value, $Res Function(_SimulateBattle) _then) = __$SimulateBattleCopyWithImpl;
@useResult
$Res call({
 BattleScenario battleScenario
});


$BattleScenarioCopyWith<$Res> get battleScenario;

}
/// @nodoc
class __$SimulateBattleCopyWithImpl<$Res>
    implements _$SimulateBattleCopyWith<$Res> {
  __$SimulateBattleCopyWithImpl(this._self, this._then);

  final _SimulateBattle _self;
  final $Res Function(_SimulateBattle) _then;

/// Create a copy of BattleHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? battleScenario = null,}) {
  return _then(_SimulateBattle(
null == battleScenario ? _self.battleScenario : battleScenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,
  ));
}

/// Create a copy of BattleHistoryEvent
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


class _Reset implements BattleHistoryEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BattleHistoryEvent.reset()';
}


}




/// @nodoc
mixin _$BattleHistoryState {

 List<BattleResult> get battleHistory;
/// Create a copy of BattleHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleHistoryStateCopyWith<BattleHistoryState> get copyWith => _$BattleHistoryStateCopyWithImpl<BattleHistoryState>(this as BattleHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleHistoryState&&const DeepCollectionEquality().equals(other.battleHistory, battleHistory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(battleHistory));

@override
String toString() {
  return 'BattleHistoryState(battleHistory: $battleHistory)';
}


}

/// @nodoc
abstract mixin class $BattleHistoryStateCopyWith<$Res>  {
  factory $BattleHistoryStateCopyWith(BattleHistoryState value, $Res Function(BattleHistoryState) _then) = _$BattleHistoryStateCopyWithImpl;
@useResult
$Res call({
 List<BattleResult> battleHistory
});




}
/// @nodoc
class _$BattleHistoryStateCopyWithImpl<$Res>
    implements $BattleHistoryStateCopyWith<$Res> {
  _$BattleHistoryStateCopyWithImpl(this._self, this._then);

  final BattleHistoryState _self;
  final $Res Function(BattleHistoryState) _then;

/// Create a copy of BattleHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? battleHistory = null,}) {
  return _then(_self.copyWith(
battleHistory: null == battleHistory ? _self.battleHistory : battleHistory // ignore: cast_nullable_to_non_nullable
as List<BattleResult>,
  ));
}

}


/// @nodoc


class _BattleHistoryState implements BattleHistoryState {
  const _BattleHistoryState({required final  List<BattleResult> battleHistory}): _battleHistory = battleHistory;
  

 final  List<BattleResult> _battleHistory;
@override List<BattleResult> get battleHistory {
  if (_battleHistory is EqualUnmodifiableListView) return _battleHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_battleHistory);
}


/// Create a copy of BattleHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattleHistoryStateCopyWith<_BattleHistoryState> get copyWith => __$BattleHistoryStateCopyWithImpl<_BattleHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattleHistoryState&&const DeepCollectionEquality().equals(other._battleHistory, _battleHistory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_battleHistory));

@override
String toString() {
  return 'BattleHistoryState(battleHistory: $battleHistory)';
}


}

/// @nodoc
abstract mixin class _$BattleHistoryStateCopyWith<$Res> implements $BattleHistoryStateCopyWith<$Res> {
  factory _$BattleHistoryStateCopyWith(_BattleHistoryState value, $Res Function(_BattleHistoryState) _then) = __$BattleHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 List<BattleResult> battleHistory
});




}
/// @nodoc
class __$BattleHistoryStateCopyWithImpl<$Res>
    implements _$BattleHistoryStateCopyWith<$Res> {
  __$BattleHistoryStateCopyWithImpl(this._self, this._then);

  final _BattleHistoryState _self;
  final $Res Function(_BattleHistoryState) _then;

/// Create a copy of BattleHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? battleHistory = null,}) {
  return _then(_BattleHistoryState(
battleHistory: null == battleHistory ? _self._battleHistory : battleHistory // ignore: cast_nullable_to_non_nullable
as List<BattleResult>,
  ));
}


}

// dart format on
