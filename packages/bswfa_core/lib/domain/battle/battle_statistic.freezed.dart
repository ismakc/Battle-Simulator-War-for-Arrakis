// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BattleStatistic {

 double get attackerExpectedHits; double get attackerStdDeviationHits; double get defenderExpectedHits; double get defenderStdDeviationHits;
/// Create a copy of BattleStatistic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleStatisticCopyWith<BattleStatistic> get copyWith => _$BattleStatisticCopyWithImpl<BattleStatistic>(this as BattleStatistic, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleStatistic&&(identical(other.attackerExpectedHits, attackerExpectedHits) || other.attackerExpectedHits == attackerExpectedHits)&&(identical(other.attackerStdDeviationHits, attackerStdDeviationHits) || other.attackerStdDeviationHits == attackerStdDeviationHits)&&(identical(other.defenderExpectedHits, defenderExpectedHits) || other.defenderExpectedHits == defenderExpectedHits)&&(identical(other.defenderStdDeviationHits, defenderStdDeviationHits) || other.defenderStdDeviationHits == defenderStdDeviationHits));
}


@override
int get hashCode => Object.hash(runtimeType,attackerExpectedHits,attackerStdDeviationHits,defenderExpectedHits,defenderStdDeviationHits);

@override
String toString() {
  return 'BattleStatistic(attackerExpectedHits: $attackerExpectedHits, attackerStdDeviationHits: $attackerStdDeviationHits, defenderExpectedHits: $defenderExpectedHits, defenderStdDeviationHits: $defenderStdDeviationHits)';
}


}

/// @nodoc
abstract mixin class $BattleStatisticCopyWith<$Res>  {
  factory $BattleStatisticCopyWith(BattleStatistic value, $Res Function(BattleStatistic) _then) = _$BattleStatisticCopyWithImpl;
@useResult
$Res call({
 double attackerExpectedHits, double attackerStdDeviationHits, double defenderExpectedHits, double defenderStdDeviationHits
});




}
/// @nodoc
class _$BattleStatisticCopyWithImpl<$Res>
    implements $BattleStatisticCopyWith<$Res> {
  _$BattleStatisticCopyWithImpl(this._self, this._then);

  final BattleStatistic _self;
  final $Res Function(BattleStatistic) _then;

/// Create a copy of BattleStatistic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attackerExpectedHits = null,Object? attackerStdDeviationHits = null,Object? defenderExpectedHits = null,Object? defenderStdDeviationHits = null,}) {
  return _then(_self.copyWith(
attackerExpectedHits: null == attackerExpectedHits ? _self.attackerExpectedHits : attackerExpectedHits // ignore: cast_nullable_to_non_nullable
as double,attackerStdDeviationHits: null == attackerStdDeviationHits ? _self.attackerStdDeviationHits : attackerStdDeviationHits // ignore: cast_nullable_to_non_nullable
as double,defenderExpectedHits: null == defenderExpectedHits ? _self.defenderExpectedHits : defenderExpectedHits // ignore: cast_nullable_to_non_nullable
as double,defenderStdDeviationHits: null == defenderStdDeviationHits ? _self.defenderStdDeviationHits : defenderStdDeviationHits // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _BattleStatistic extends BattleStatistic {
  const _BattleStatistic({required this.attackerExpectedHits, required this.attackerStdDeviationHits, required this.defenderExpectedHits, required this.defenderStdDeviationHits}): super._();
  

@override final  double attackerExpectedHits;
@override final  double attackerStdDeviationHits;
@override final  double defenderExpectedHits;
@override final  double defenderStdDeviationHits;

/// Create a copy of BattleStatistic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattleStatisticCopyWith<_BattleStatistic> get copyWith => __$BattleStatisticCopyWithImpl<_BattleStatistic>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattleStatistic&&(identical(other.attackerExpectedHits, attackerExpectedHits) || other.attackerExpectedHits == attackerExpectedHits)&&(identical(other.attackerStdDeviationHits, attackerStdDeviationHits) || other.attackerStdDeviationHits == attackerStdDeviationHits)&&(identical(other.defenderExpectedHits, defenderExpectedHits) || other.defenderExpectedHits == defenderExpectedHits)&&(identical(other.defenderStdDeviationHits, defenderStdDeviationHits) || other.defenderStdDeviationHits == defenderStdDeviationHits));
}


@override
int get hashCode => Object.hash(runtimeType,attackerExpectedHits,attackerStdDeviationHits,defenderExpectedHits,defenderStdDeviationHits);

@override
String toString() {
  return 'BattleStatistic(attackerExpectedHits: $attackerExpectedHits, attackerStdDeviationHits: $attackerStdDeviationHits, defenderExpectedHits: $defenderExpectedHits, defenderStdDeviationHits: $defenderStdDeviationHits)';
}


}

/// @nodoc
abstract mixin class _$BattleStatisticCopyWith<$Res> implements $BattleStatisticCopyWith<$Res> {
  factory _$BattleStatisticCopyWith(_BattleStatistic value, $Res Function(_BattleStatistic) _then) = __$BattleStatisticCopyWithImpl;
@override @useResult
$Res call({
 double attackerExpectedHits, double attackerStdDeviationHits, double defenderExpectedHits, double defenderStdDeviationHits
});




}
/// @nodoc
class __$BattleStatisticCopyWithImpl<$Res>
    implements _$BattleStatisticCopyWith<$Res> {
  __$BattleStatisticCopyWithImpl(this._self, this._then);

  final _BattleStatistic _self;
  final $Res Function(_BattleStatistic) _then;

/// Create a copy of BattleStatistic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attackerExpectedHits = null,Object? attackerStdDeviationHits = null,Object? defenderExpectedHits = null,Object? defenderStdDeviationHits = null,}) {
  return _then(_BattleStatistic(
attackerExpectedHits: null == attackerExpectedHits ? _self.attackerExpectedHits : attackerExpectedHits // ignore: cast_nullable_to_non_nullable
as double,attackerStdDeviationHits: null == attackerStdDeviationHits ? _self.attackerStdDeviationHits : attackerStdDeviationHits // ignore: cast_nullable_to_non_nullable
as double,defenderExpectedHits: null == defenderExpectedHits ? _self.defenderExpectedHits : defenderExpectedHits // ignore: cast_nullable_to_non_nullable
as double,defenderStdDeviationHits: null == defenderStdDeviationHits ? _self.defenderStdDeviationHits : defenderStdDeviationHits // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
