// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_scenario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BattleScenario {

 AttackingLegion get attackingLegion; DefendingLegion get defendingLegion;
/// Create a copy of BattleScenario
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleScenarioCopyWith<BattleScenario> get copyWith => _$BattleScenarioCopyWithImpl<BattleScenario>(this as BattleScenario, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleScenario&&(identical(other.attackingLegion, attackingLegion) || other.attackingLegion == attackingLegion)&&(identical(other.defendingLegion, defendingLegion) || other.defendingLegion == defendingLegion));
}


@override
int get hashCode => Object.hash(runtimeType,attackingLegion,defendingLegion);

@override
String toString() {
  return 'BattleScenario(attackingLegion: $attackingLegion, defendingLegion: $defendingLegion)';
}


}

/// @nodoc
abstract mixin class $BattleScenarioCopyWith<$Res>  {
  factory $BattleScenarioCopyWith(BattleScenario value, $Res Function(BattleScenario) _then) = _$BattleScenarioCopyWithImpl;
@useResult
$Res call({
 AttackingLegion attackingLegion, DefendingLegion defendingLegion
});


$AttackingLegionCopyWith<$Res> get attackingLegion;$DefendingLegionCopyWith<$Res> get defendingLegion;

}
/// @nodoc
class _$BattleScenarioCopyWithImpl<$Res>
    implements $BattleScenarioCopyWith<$Res> {
  _$BattleScenarioCopyWithImpl(this._self, this._then);

  final BattleScenario _self;
  final $Res Function(BattleScenario) _then;

/// Create a copy of BattleScenario
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attackingLegion = null,Object? defendingLegion = null,}) {
  return _then(_self.copyWith(
attackingLegion: null == attackingLegion ? _self.attackingLegion : attackingLegion // ignore: cast_nullable_to_non_nullable
as AttackingLegion,defendingLegion: null == defendingLegion ? _self.defendingLegion : defendingLegion // ignore: cast_nullable_to_non_nullable
as DefendingLegion,
  ));
}
/// Create a copy of BattleScenario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttackingLegionCopyWith<$Res> get attackingLegion {
  
  return $AttackingLegionCopyWith<$Res>(_self.attackingLegion, (value) {
    return _then(_self.copyWith(attackingLegion: value));
  });
}/// Create a copy of BattleScenario
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


class _BattleScenario implements BattleScenario {
  const _BattleScenario({required this.attackingLegion, required this.defendingLegion});
  

@override final  AttackingLegion attackingLegion;
@override final  DefendingLegion defendingLegion;

/// Create a copy of BattleScenario
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattleScenarioCopyWith<_BattleScenario> get copyWith => __$BattleScenarioCopyWithImpl<_BattleScenario>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattleScenario&&(identical(other.attackingLegion, attackingLegion) || other.attackingLegion == attackingLegion)&&(identical(other.defendingLegion, defendingLegion) || other.defendingLegion == defendingLegion));
}


@override
int get hashCode => Object.hash(runtimeType,attackingLegion,defendingLegion);

@override
String toString() {
  return 'BattleScenario(attackingLegion: $attackingLegion, defendingLegion: $defendingLegion)';
}


}

/// @nodoc
abstract mixin class _$BattleScenarioCopyWith<$Res> implements $BattleScenarioCopyWith<$Res> {
  factory _$BattleScenarioCopyWith(_BattleScenario value, $Res Function(_BattleScenario) _then) = __$BattleScenarioCopyWithImpl;
@override @useResult
$Res call({
 AttackingLegion attackingLegion, DefendingLegion defendingLegion
});


@override $AttackingLegionCopyWith<$Res> get attackingLegion;@override $DefendingLegionCopyWith<$Res> get defendingLegion;

}
/// @nodoc
class __$BattleScenarioCopyWithImpl<$Res>
    implements _$BattleScenarioCopyWith<$Res> {
  __$BattleScenarioCopyWithImpl(this._self, this._then);

  final _BattleScenario _self;
  final $Res Function(_BattleScenario) _then;

/// Create a copy of BattleScenario
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attackingLegion = null,Object? defendingLegion = null,}) {
  return _then(_BattleScenario(
attackingLegion: null == attackingLegion ? _self.attackingLegion : attackingLegion // ignore: cast_nullable_to_non_nullable
as AttackingLegion,defendingLegion: null == defendingLegion ? _self.defendingLegion : defendingLegion // ignore: cast_nullable_to_non_nullable
as DefendingLegion,
  ));
}

/// Create a copy of BattleScenario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttackingLegionCopyWith<$Res> get attackingLegion {
  
  return $AttackingLegionCopyWith<$Res>(_self.attackingLegion, (value) {
    return _then(_self.copyWith(attackingLegion: value));
  });
}/// Create a copy of BattleScenario
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DefendingLegionCopyWith<$Res> get defendingLegion {
  
  return $DefendingLegionCopyWith<$Res>(_self.defendingLegion, (value) {
    return _then(_self.copyWith(defendingLegion: value));
  });
}
}

// dart format on
