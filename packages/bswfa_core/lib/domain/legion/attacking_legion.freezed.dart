// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attacking_legion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttackingLegion {

 int get genericLeaders; int get regularUnits; int get eliteUnits; int get specialEliteUnits; int get usedCards; List<NamedLeader> get namedLeaders; bool get surpriseAttack;
/// Create a copy of AttackingLegion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttackingLegionCopyWith<AttackingLegion> get copyWith => _$AttackingLegionCopyWithImpl<AttackingLegion>(this as AttackingLegion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttackingLegion&&(identical(other.genericLeaders, genericLeaders) || other.genericLeaders == genericLeaders)&&(identical(other.regularUnits, regularUnits) || other.regularUnits == regularUnits)&&(identical(other.eliteUnits, eliteUnits) || other.eliteUnits == eliteUnits)&&(identical(other.specialEliteUnits, specialEliteUnits) || other.specialEliteUnits == specialEliteUnits)&&(identical(other.usedCards, usedCards) || other.usedCards == usedCards)&&const DeepCollectionEquality().equals(other.namedLeaders, namedLeaders)&&(identical(other.surpriseAttack, surpriseAttack) || other.surpriseAttack == surpriseAttack));
}


@override
int get hashCode => Object.hash(runtimeType,genericLeaders,regularUnits,eliteUnits,specialEliteUnits,usedCards,const DeepCollectionEquality().hash(namedLeaders),surpriseAttack);

@override
String toString() {
  return 'AttackingLegion(genericLeaders: $genericLeaders, regularUnits: $regularUnits, eliteUnits: $eliteUnits, specialEliteUnits: $specialEliteUnits, usedCards: $usedCards, namedLeaders: $namedLeaders, surpriseAttack: $surpriseAttack)';
}


}

/// @nodoc
abstract mixin class $AttackingLegionCopyWith<$Res>  {
  factory $AttackingLegionCopyWith(AttackingLegion value, $Res Function(AttackingLegion) _then) = _$AttackingLegionCopyWithImpl;
@useResult
$Res call({
 int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, int usedCards, List<NamedLeader> namedLeaders, bool surpriseAttack
});




}
/// @nodoc
class _$AttackingLegionCopyWithImpl<$Res>
    implements $AttackingLegionCopyWith<$Res> {
  _$AttackingLegionCopyWithImpl(this._self, this._then);

  final AttackingLegion _self;
  final $Res Function(AttackingLegion) _then;

/// Create a copy of AttackingLegion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genericLeaders = null,Object? regularUnits = null,Object? eliteUnits = null,Object? specialEliteUnits = null,Object? usedCards = null,Object? namedLeaders = null,Object? surpriseAttack = null,}) {
  return _then(_self.copyWith(
genericLeaders: null == genericLeaders ? _self.genericLeaders : genericLeaders // ignore: cast_nullable_to_non_nullable
as int,regularUnits: null == regularUnits ? _self.regularUnits : regularUnits // ignore: cast_nullable_to_non_nullable
as int,eliteUnits: null == eliteUnits ? _self.eliteUnits : eliteUnits // ignore: cast_nullable_to_non_nullable
as int,specialEliteUnits: null == specialEliteUnits ? _self.specialEliteUnits : specialEliteUnits // ignore: cast_nullable_to_non_nullable
as int,usedCards: null == usedCards ? _self.usedCards : usedCards // ignore: cast_nullable_to_non_nullable
as int,namedLeaders: null == namedLeaders ? _self.namedLeaders : namedLeaders // ignore: cast_nullable_to_non_nullable
as List<NamedLeader>,surpriseAttack: null == surpriseAttack ? _self.surpriseAttack : surpriseAttack // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _AttackingLegion extends AttackingLegion {
  const _AttackingLegion({this.genericLeaders = 0, this.regularUnits = 0, this.eliteUnits = 0, this.specialEliteUnits = 0, this.usedCards = 0, final  List<NamedLeader> namedLeaders = const <NamedLeader>[], this.surpriseAttack = false}): _namedLeaders = namedLeaders,super._();
  

@override@JsonKey() final  int genericLeaders;
@override@JsonKey() final  int regularUnits;
@override@JsonKey() final  int eliteUnits;
@override@JsonKey() final  int specialEliteUnits;
@override@JsonKey() final  int usedCards;
 final  List<NamedLeader> _namedLeaders;
@override@JsonKey() List<NamedLeader> get namedLeaders {
  if (_namedLeaders is EqualUnmodifiableListView) return _namedLeaders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_namedLeaders);
}

@override@JsonKey() final  bool surpriseAttack;

/// Create a copy of AttackingLegion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttackingLegionCopyWith<_AttackingLegion> get copyWith => __$AttackingLegionCopyWithImpl<_AttackingLegion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttackingLegion&&(identical(other.genericLeaders, genericLeaders) || other.genericLeaders == genericLeaders)&&(identical(other.regularUnits, regularUnits) || other.regularUnits == regularUnits)&&(identical(other.eliteUnits, eliteUnits) || other.eliteUnits == eliteUnits)&&(identical(other.specialEliteUnits, specialEliteUnits) || other.specialEliteUnits == specialEliteUnits)&&(identical(other.usedCards, usedCards) || other.usedCards == usedCards)&&const DeepCollectionEquality().equals(other._namedLeaders, _namedLeaders)&&(identical(other.surpriseAttack, surpriseAttack) || other.surpriseAttack == surpriseAttack));
}


@override
int get hashCode => Object.hash(runtimeType,genericLeaders,regularUnits,eliteUnits,specialEliteUnits,usedCards,const DeepCollectionEquality().hash(_namedLeaders),surpriseAttack);

@override
String toString() {
  return 'AttackingLegion(genericLeaders: $genericLeaders, regularUnits: $regularUnits, eliteUnits: $eliteUnits, specialEliteUnits: $specialEliteUnits, usedCards: $usedCards, namedLeaders: $namedLeaders, surpriseAttack: $surpriseAttack)';
}


}

/// @nodoc
abstract mixin class _$AttackingLegionCopyWith<$Res> implements $AttackingLegionCopyWith<$Res> {
  factory _$AttackingLegionCopyWith(_AttackingLegion value, $Res Function(_AttackingLegion) _then) = __$AttackingLegionCopyWithImpl;
@override @useResult
$Res call({
 int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, int usedCards, List<NamedLeader> namedLeaders, bool surpriseAttack
});




}
/// @nodoc
class __$AttackingLegionCopyWithImpl<$Res>
    implements _$AttackingLegionCopyWith<$Res> {
  __$AttackingLegionCopyWithImpl(this._self, this._then);

  final _AttackingLegion _self;
  final $Res Function(_AttackingLegion) _then;

/// Create a copy of AttackingLegion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genericLeaders = null,Object? regularUnits = null,Object? eliteUnits = null,Object? specialEliteUnits = null,Object? usedCards = null,Object? namedLeaders = null,Object? surpriseAttack = null,}) {
  return _then(_AttackingLegion(
genericLeaders: null == genericLeaders ? _self.genericLeaders : genericLeaders // ignore: cast_nullable_to_non_nullable
as int,regularUnits: null == regularUnits ? _self.regularUnits : regularUnits // ignore: cast_nullable_to_non_nullable
as int,eliteUnits: null == eliteUnits ? _self.eliteUnits : eliteUnits // ignore: cast_nullable_to_non_nullable
as int,specialEliteUnits: null == specialEliteUnits ? _self.specialEliteUnits : specialEliteUnits // ignore: cast_nullable_to_non_nullable
as int,usedCards: null == usedCards ? _self.usedCards : usedCards // ignore: cast_nullable_to_non_nullable
as int,namedLeaders: null == namedLeaders ? _self._namedLeaders : namedLeaders // ignore: cast_nullable_to_non_nullable
as List<NamedLeader>,surpriseAttack: null == surpriseAttack ? _self.surpriseAttack : surpriseAttack // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
