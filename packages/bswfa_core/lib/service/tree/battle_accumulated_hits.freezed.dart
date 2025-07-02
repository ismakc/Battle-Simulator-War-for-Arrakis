// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_accumulated_hits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BattleAccumulatedHits {

 int get attackerHits; int get squaredAttackerHits; int get defenderHits; int get squaredDefenderHits;
/// Create a copy of BattleAccumulatedHits
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleAccumulatedHitsCopyWith<BattleAccumulatedHits> get copyWith => _$BattleAccumulatedHitsCopyWithImpl<BattleAccumulatedHits>(this as BattleAccumulatedHits, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleAccumulatedHits&&(identical(other.attackerHits, attackerHits) || other.attackerHits == attackerHits)&&(identical(other.squaredAttackerHits, squaredAttackerHits) || other.squaredAttackerHits == squaredAttackerHits)&&(identical(other.defenderHits, defenderHits) || other.defenderHits == defenderHits)&&(identical(other.squaredDefenderHits, squaredDefenderHits) || other.squaredDefenderHits == squaredDefenderHits));
}


@override
int get hashCode => Object.hash(runtimeType,attackerHits,squaredAttackerHits,defenderHits,squaredDefenderHits);

@override
String toString() {
  return 'BattleAccumulatedHits(attackerHits: $attackerHits, squaredAttackerHits: $squaredAttackerHits, defenderHits: $defenderHits, squaredDefenderHits: $squaredDefenderHits)';
}


}

/// @nodoc
abstract mixin class $BattleAccumulatedHitsCopyWith<$Res>  {
  factory $BattleAccumulatedHitsCopyWith(BattleAccumulatedHits value, $Res Function(BattleAccumulatedHits) _then) = _$BattleAccumulatedHitsCopyWithImpl;
@useResult
$Res call({
 int attackerHits, int squaredAttackerHits, int defenderHits, int squaredDefenderHits
});




}
/// @nodoc
class _$BattleAccumulatedHitsCopyWithImpl<$Res>
    implements $BattleAccumulatedHitsCopyWith<$Res> {
  _$BattleAccumulatedHitsCopyWithImpl(this._self, this._then);

  final BattleAccumulatedHits _self;
  final $Res Function(BattleAccumulatedHits) _then;

/// Create a copy of BattleAccumulatedHits
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attackerHits = null,Object? squaredAttackerHits = null,Object? defenderHits = null,Object? squaredDefenderHits = null,}) {
  return _then(_self.copyWith(
attackerHits: null == attackerHits ? _self.attackerHits : attackerHits // ignore: cast_nullable_to_non_nullable
as int,squaredAttackerHits: null == squaredAttackerHits ? _self.squaredAttackerHits : squaredAttackerHits // ignore: cast_nullable_to_non_nullable
as int,defenderHits: null == defenderHits ? _self.defenderHits : defenderHits // ignore: cast_nullable_to_non_nullable
as int,squaredDefenderHits: null == squaredDefenderHits ? _self.squaredDefenderHits : squaredDefenderHits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _AccumulatedHits extends BattleAccumulatedHits {
  const _AccumulatedHits({required this.attackerHits, required this.squaredAttackerHits, required this.defenderHits, required this.squaredDefenderHits}): super._();
  

@override final  int attackerHits;
@override final  int squaredAttackerHits;
@override final  int defenderHits;
@override final  int squaredDefenderHits;

/// Create a copy of BattleAccumulatedHits
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccumulatedHitsCopyWith<_AccumulatedHits> get copyWith => __$AccumulatedHitsCopyWithImpl<_AccumulatedHits>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccumulatedHits&&(identical(other.attackerHits, attackerHits) || other.attackerHits == attackerHits)&&(identical(other.squaredAttackerHits, squaredAttackerHits) || other.squaredAttackerHits == squaredAttackerHits)&&(identical(other.defenderHits, defenderHits) || other.defenderHits == defenderHits)&&(identical(other.squaredDefenderHits, squaredDefenderHits) || other.squaredDefenderHits == squaredDefenderHits));
}


@override
int get hashCode => Object.hash(runtimeType,attackerHits,squaredAttackerHits,defenderHits,squaredDefenderHits);

@override
String toString() {
  return 'BattleAccumulatedHits(attackerHits: $attackerHits, squaredAttackerHits: $squaredAttackerHits, defenderHits: $defenderHits, squaredDefenderHits: $squaredDefenderHits)';
}


}

/// @nodoc
abstract mixin class _$AccumulatedHitsCopyWith<$Res> implements $BattleAccumulatedHitsCopyWith<$Res> {
  factory _$AccumulatedHitsCopyWith(_AccumulatedHits value, $Res Function(_AccumulatedHits) _then) = __$AccumulatedHitsCopyWithImpl;
@override @useResult
$Res call({
 int attackerHits, int squaredAttackerHits, int defenderHits, int squaredDefenderHits
});




}
/// @nodoc
class __$AccumulatedHitsCopyWithImpl<$Res>
    implements _$AccumulatedHitsCopyWith<$Res> {
  __$AccumulatedHitsCopyWithImpl(this._self, this._then);

  final _AccumulatedHits _self;
  final $Res Function(_AccumulatedHits) _then;

/// Create a copy of BattleAccumulatedHits
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attackerHits = null,Object? squaredAttackerHits = null,Object? defenderHits = null,Object? squaredDefenderHits = null,}) {
  return _then(_AccumulatedHits(
attackerHits: null == attackerHits ? _self.attackerHits : attackerHits // ignore: cast_nullable_to_non_nullable
as int,squaredAttackerHits: null == squaredAttackerHits ? _self.squaredAttackerHits : squaredAttackerHits // ignore: cast_nullable_to_non_nullable
as int,defenderHits: null == defenderHits ? _self.defenderHits : defenderHits // ignore: cast_nullable_to_non_nullable
as int,squaredDefenderHits: null == squaredDefenderHits ? _self.squaredDefenderHits : squaredDefenderHits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
