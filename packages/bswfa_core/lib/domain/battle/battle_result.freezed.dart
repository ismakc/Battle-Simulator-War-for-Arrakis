// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BattleResult {

 int get playedCombatRounds; BattleScenario get scenario; BattleStatistic get statistic;
/// Create a copy of BattleResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleResultCopyWith<BattleResult> get copyWith => _$BattleResultCopyWithImpl<BattleResult>(this as BattleResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleResult&&(identical(other.playedCombatRounds, playedCombatRounds) || other.playedCombatRounds == playedCombatRounds)&&(identical(other.scenario, scenario) || other.scenario == scenario)&&(identical(other.statistic, statistic) || other.statistic == statistic));
}


@override
int get hashCode => Object.hash(runtimeType,playedCombatRounds,scenario,statistic);

@override
String toString() {
  return 'BattleResult(playedCombatRounds: $playedCombatRounds, scenario: $scenario, statistic: $statistic)';
}


}

/// @nodoc
abstract mixin class $BattleResultCopyWith<$Res>  {
  factory $BattleResultCopyWith(BattleResult value, $Res Function(BattleResult) _then) = _$BattleResultCopyWithImpl;
@useResult
$Res call({
 int playedCombatRounds, BattleScenario scenario, BattleStatistic statistic
});


$BattleScenarioCopyWith<$Res> get scenario;$BattleStatisticCopyWith<$Res> get statistic;

}
/// @nodoc
class _$BattleResultCopyWithImpl<$Res>
    implements $BattleResultCopyWith<$Res> {
  _$BattleResultCopyWithImpl(this._self, this._then);

  final BattleResult _self;
  final $Res Function(BattleResult) _then;

/// Create a copy of BattleResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playedCombatRounds = null,Object? scenario = null,Object? statistic = null,}) {
  return _then(_self.copyWith(
playedCombatRounds: null == playedCombatRounds ? _self.playedCombatRounds : playedCombatRounds // ignore: cast_nullable_to_non_nullable
as int,scenario: null == scenario ? _self.scenario : scenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,statistic: null == statistic ? _self.statistic : statistic // ignore: cast_nullable_to_non_nullable
as BattleStatistic,
  ));
}
/// Create a copy of BattleResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleScenarioCopyWith<$Res> get scenario {
  
  return $BattleScenarioCopyWith<$Res>(_self.scenario, (value) {
    return _then(_self.copyWith(scenario: value));
  });
}/// Create a copy of BattleResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleStatisticCopyWith<$Res> get statistic {
  
  return $BattleStatisticCopyWith<$Res>(_self.statistic, (value) {
    return _then(_self.copyWith(statistic: value));
  });
}
}


/// @nodoc


class _BattleStatistic extends BattleResult {
  const _BattleStatistic({required this.playedCombatRounds, required this.scenario, required this.statistic}): super._();
  

@override final  int playedCombatRounds;
@override final  BattleScenario scenario;
@override final  BattleStatistic statistic;

/// Create a copy of BattleResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattleStatisticCopyWith<_BattleStatistic> get copyWith => __$BattleStatisticCopyWithImpl<_BattleStatistic>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattleStatistic&&(identical(other.playedCombatRounds, playedCombatRounds) || other.playedCombatRounds == playedCombatRounds)&&(identical(other.scenario, scenario) || other.scenario == scenario)&&(identical(other.statistic, statistic) || other.statistic == statistic));
}


@override
int get hashCode => Object.hash(runtimeType,playedCombatRounds,scenario,statistic);

@override
String toString() {
  return 'BattleResult(playedCombatRounds: $playedCombatRounds, scenario: $scenario, statistic: $statistic)';
}


}

/// @nodoc
abstract mixin class _$BattleStatisticCopyWith<$Res> implements $BattleResultCopyWith<$Res> {
  factory _$BattleStatisticCopyWith(_BattleStatistic value, $Res Function(_BattleStatistic) _then) = __$BattleStatisticCopyWithImpl;
@override @useResult
$Res call({
 int playedCombatRounds, BattleScenario scenario, BattleStatistic statistic
});


@override $BattleScenarioCopyWith<$Res> get scenario;@override $BattleStatisticCopyWith<$Res> get statistic;

}
/// @nodoc
class __$BattleStatisticCopyWithImpl<$Res>
    implements _$BattleStatisticCopyWith<$Res> {
  __$BattleStatisticCopyWithImpl(this._self, this._then);

  final _BattleStatistic _self;
  final $Res Function(_BattleStatistic) _then;

/// Create a copy of BattleResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playedCombatRounds = null,Object? scenario = null,Object? statistic = null,}) {
  return _then(_BattleStatistic(
playedCombatRounds: null == playedCombatRounds ? _self.playedCombatRounds : playedCombatRounds // ignore: cast_nullable_to_non_nullable
as int,scenario: null == scenario ? _self.scenario : scenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,statistic: null == statistic ? _self.statistic : statistic // ignore: cast_nullable_to_non_nullable
as BattleStatistic,
  ));
}

/// Create a copy of BattleResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleScenarioCopyWith<$Res> get scenario {
  
  return $BattleScenarioCopyWith<$Res>(_self.scenario, (value) {
    return _then(_self.copyWith(scenario: value));
  });
}/// Create a copy of BattleResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleStatisticCopyWith<$Res> get statistic {
  
  return $BattleStatisticCopyWith<$Res>(_self.statistic, (value) {
    return _then(_self.copyWith(statistic: value));
  });
}
}

// dart format on
