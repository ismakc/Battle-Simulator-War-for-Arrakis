// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_scenario_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BattleScenarioEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleScenarioEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BattleScenarioEvent()';
}


}

/// @nodoc
class $BattleScenarioEventCopyWith<$Res>  {
$BattleScenarioEventCopyWith(BattleScenarioEvent _, $Res Function(BattleScenarioEvent) __);
}


/// @nodoc


class _UpdateAttackingLegion implements BattleScenarioEvent {
  const _UpdateAttackingLegion(this.attackingLegion);
  

 final  AttackingLegion attackingLegion;

/// Create a copy of BattleScenarioEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAttackingLegionCopyWith<_UpdateAttackingLegion> get copyWith => __$UpdateAttackingLegionCopyWithImpl<_UpdateAttackingLegion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAttackingLegion&&(identical(other.attackingLegion, attackingLegion) || other.attackingLegion == attackingLegion));
}


@override
int get hashCode => Object.hash(runtimeType,attackingLegion);

@override
String toString() {
  return 'BattleScenarioEvent.updateAttackingLegion(attackingLegion: $attackingLegion)';
}


}

/// @nodoc
abstract mixin class _$UpdateAttackingLegionCopyWith<$Res> implements $BattleScenarioEventCopyWith<$Res> {
  factory _$UpdateAttackingLegionCopyWith(_UpdateAttackingLegion value, $Res Function(_UpdateAttackingLegion) _then) = __$UpdateAttackingLegionCopyWithImpl;
@useResult
$Res call({
 AttackingLegion attackingLegion
});


$AttackingLegionCopyWith<$Res> get attackingLegion;

}
/// @nodoc
class __$UpdateAttackingLegionCopyWithImpl<$Res>
    implements _$UpdateAttackingLegionCopyWith<$Res> {
  __$UpdateAttackingLegionCopyWithImpl(this._self, this._then);

  final _UpdateAttackingLegion _self;
  final $Res Function(_UpdateAttackingLegion) _then;

/// Create a copy of BattleScenarioEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attackingLegion = null,}) {
  return _then(_UpdateAttackingLegion(
null == attackingLegion ? _self.attackingLegion : attackingLegion // ignore: cast_nullable_to_non_nullable
as AttackingLegion,
  ));
}

/// Create a copy of BattleScenarioEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttackingLegionCopyWith<$Res> get attackingLegion {
  
  return $AttackingLegionCopyWith<$Res>(_self.attackingLegion, (value) {
    return _then(_self.copyWith(attackingLegion: value));
  });
}
}

/// @nodoc


class _UpdateDefendingLegion implements BattleScenarioEvent {
  const _UpdateDefendingLegion(this.defendingLegion);
  

 final  DefendingLegion defendingLegion;

/// Create a copy of BattleScenarioEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDefendingLegionCopyWith<_UpdateDefendingLegion> get copyWith => __$UpdateDefendingLegionCopyWithImpl<_UpdateDefendingLegion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDefendingLegion&&(identical(other.defendingLegion, defendingLegion) || other.defendingLegion == defendingLegion));
}


@override
int get hashCode => Object.hash(runtimeType,defendingLegion);

@override
String toString() {
  return 'BattleScenarioEvent.updateDefendingLegion(defendingLegion: $defendingLegion)';
}


}

/// @nodoc
abstract mixin class _$UpdateDefendingLegionCopyWith<$Res> implements $BattleScenarioEventCopyWith<$Res> {
  factory _$UpdateDefendingLegionCopyWith(_UpdateDefendingLegion value, $Res Function(_UpdateDefendingLegion) _then) = __$UpdateDefendingLegionCopyWithImpl;
@useResult
$Res call({
 DefendingLegion defendingLegion
});


$DefendingLegionCopyWith<$Res> get defendingLegion;

}
/// @nodoc
class __$UpdateDefendingLegionCopyWithImpl<$Res>
    implements _$UpdateDefendingLegionCopyWith<$Res> {
  __$UpdateDefendingLegionCopyWithImpl(this._self, this._then);

  final _UpdateDefendingLegion _self;
  final $Res Function(_UpdateDefendingLegion) _then;

/// Create a copy of BattleScenarioEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? defendingLegion = null,}) {
  return _then(_UpdateDefendingLegion(
null == defendingLegion ? _self.defendingLegion : defendingLegion // ignore: cast_nullable_to_non_nullable
as DefendingLegion,
  ));
}

/// Create a copy of BattleScenarioEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DefendingLegionCopyWith<$Res> get defendingLegion {
  
  return $DefendingLegionCopyWith<$Res>(_self.defendingLegion, (value) {
    return _then(_self.copyWith(defendingLegion: value));
  });
}
}

/// @nodoc


class _Reset implements BattleScenarioEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BattleScenarioEvent.reset()';
}


}




/// @nodoc
mixin _$BattleScenarioState {

 BattleScenario get battleScenario;
/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleScenarioStateCopyWith<BattleScenarioState> get copyWith => _$BattleScenarioStateCopyWithImpl<BattleScenarioState>(this as BattleScenarioState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleScenarioState&&(identical(other.battleScenario, battleScenario) || other.battleScenario == battleScenario));
}


@override
int get hashCode => Object.hash(runtimeType,battleScenario);

@override
String toString() {
  return 'BattleScenarioState(battleScenario: $battleScenario)';
}


}

/// @nodoc
abstract mixin class $BattleScenarioStateCopyWith<$Res>  {
  factory $BattleScenarioStateCopyWith(BattleScenarioState value, $Res Function(BattleScenarioState) _then) = _$BattleScenarioStateCopyWithImpl;
@useResult
$Res call({
 BattleScenario battleScenario
});


$BattleScenarioCopyWith<$Res> get battleScenario;

}
/// @nodoc
class _$BattleScenarioStateCopyWithImpl<$Res>
    implements $BattleScenarioStateCopyWith<$Res> {
  _$BattleScenarioStateCopyWithImpl(this._self, this._then);

  final BattleScenarioState _self;
  final $Res Function(BattleScenarioState) _then;

/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? battleScenario = null,}) {
  return _then(_self.copyWith(
battleScenario: null == battleScenario ? _self.battleScenario : battleScenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,
  ));
}
/// Create a copy of BattleScenarioState
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


class _BattleScenarioState implements BattleScenarioState {
  const _BattleScenarioState({required this.battleScenario});
  

@override final  BattleScenario battleScenario;

/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattleScenarioStateCopyWith<_BattleScenarioState> get copyWith => __$BattleScenarioStateCopyWithImpl<_BattleScenarioState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattleScenarioState&&(identical(other.battleScenario, battleScenario) || other.battleScenario == battleScenario));
}


@override
int get hashCode => Object.hash(runtimeType,battleScenario);

@override
String toString() {
  return 'BattleScenarioState(battleScenario: $battleScenario)';
}


}

/// @nodoc
abstract mixin class _$BattleScenarioStateCopyWith<$Res> implements $BattleScenarioStateCopyWith<$Res> {
  factory _$BattleScenarioStateCopyWith(_BattleScenarioState value, $Res Function(_BattleScenarioState) _then) = __$BattleScenarioStateCopyWithImpl;
@override @useResult
$Res call({
 BattleScenario battleScenario
});


@override $BattleScenarioCopyWith<$Res> get battleScenario;

}
/// @nodoc
class __$BattleScenarioStateCopyWithImpl<$Res>
    implements _$BattleScenarioStateCopyWith<$Res> {
  __$BattleScenarioStateCopyWithImpl(this._self, this._then);

  final _BattleScenarioState _self;
  final $Res Function(_BattleScenarioState) _then;

/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? battleScenario = null,}) {
  return _then(_BattleScenarioState(
battleScenario: null == battleScenario ? _self.battleScenario : battleScenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,
  ));
}

/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleScenarioCopyWith<$Res> get battleScenario {
  
  return $BattleScenarioCopyWith<$Res>(_self.battleScenario, (value) {
    return _then(_self.copyWith(battleScenario: value));
  });
}
}

// dart format on
