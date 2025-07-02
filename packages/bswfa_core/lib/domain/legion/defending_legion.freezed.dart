// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'defending_legion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DefendingLegion {

 int get genericLeaders; int get regularUnits; int get eliteUnits; int get specialEliteUnits; int get usedCards; List<NamedLeader> get namedLeaders; int get settlementLevel;
/// Create a copy of DefendingLegion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefendingLegionCopyWith<DefendingLegion> get copyWith => _$DefendingLegionCopyWithImpl<DefendingLegion>(this as DefendingLegion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefendingLegion&&(identical(other.genericLeaders, genericLeaders) || other.genericLeaders == genericLeaders)&&(identical(other.regularUnits, regularUnits) || other.regularUnits == regularUnits)&&(identical(other.eliteUnits, eliteUnits) || other.eliteUnits == eliteUnits)&&(identical(other.specialEliteUnits, specialEliteUnits) || other.specialEliteUnits == specialEliteUnits)&&(identical(other.usedCards, usedCards) || other.usedCards == usedCards)&&const DeepCollectionEquality().equals(other.namedLeaders, namedLeaders)&&(identical(other.settlementLevel, settlementLevel) || other.settlementLevel == settlementLevel));
}


@override
int get hashCode => Object.hash(runtimeType,genericLeaders,regularUnits,eliteUnits,specialEliteUnits,usedCards,const DeepCollectionEquality().hash(namedLeaders),settlementLevel);

@override
String toString() {
  return 'DefendingLegion(genericLeaders: $genericLeaders, regularUnits: $regularUnits, eliteUnits: $eliteUnits, specialEliteUnits: $specialEliteUnits, usedCards: $usedCards, namedLeaders: $namedLeaders, settlementLevel: $settlementLevel)';
}


}

/// @nodoc
abstract mixin class $DefendingLegionCopyWith<$Res>  {
  factory $DefendingLegionCopyWith(DefendingLegion value, $Res Function(DefendingLegion) _then) = _$DefendingLegionCopyWithImpl;
@useResult
$Res call({
 int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, int usedCards, List<NamedLeader> namedLeaders, int settlementLevel
});




}
/// @nodoc
class _$DefendingLegionCopyWithImpl<$Res>
    implements $DefendingLegionCopyWith<$Res> {
  _$DefendingLegionCopyWithImpl(this._self, this._then);

  final DefendingLegion _self;
  final $Res Function(DefendingLegion) _then;

/// Create a copy of DefendingLegion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genericLeaders = null,Object? regularUnits = null,Object? eliteUnits = null,Object? specialEliteUnits = null,Object? usedCards = null,Object? namedLeaders = null,Object? settlementLevel = null,}) {
  return _then(_self.copyWith(
genericLeaders: null == genericLeaders ? _self.genericLeaders : genericLeaders // ignore: cast_nullable_to_non_nullable
as int,regularUnits: null == regularUnits ? _self.regularUnits : regularUnits // ignore: cast_nullable_to_non_nullable
as int,eliteUnits: null == eliteUnits ? _self.eliteUnits : eliteUnits // ignore: cast_nullable_to_non_nullable
as int,specialEliteUnits: null == specialEliteUnits ? _self.specialEliteUnits : specialEliteUnits // ignore: cast_nullable_to_non_nullable
as int,usedCards: null == usedCards ? _self.usedCards : usedCards // ignore: cast_nullable_to_non_nullable
as int,namedLeaders: null == namedLeaders ? _self.namedLeaders : namedLeaders // ignore: cast_nullable_to_non_nullable
as List<NamedLeader>,settlementLevel: null == settlementLevel ? _self.settlementLevel : settlementLevel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _DefendingLegion extends DefendingLegion {
  const _DefendingLegion({this.genericLeaders = 0, this.regularUnits = 0, this.eliteUnits = 0, this.specialEliteUnits = 0, this.usedCards = 0, final  List<NamedLeader> namedLeaders = const <NamedLeader>[], this.settlementLevel = 0}): _namedLeaders = namedLeaders,super._();
  

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

@override@JsonKey() final  int settlementLevel;

/// Create a copy of DefendingLegion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefendingLegionCopyWith<_DefendingLegion> get copyWith => __$DefendingLegionCopyWithImpl<_DefendingLegion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DefendingLegion&&(identical(other.genericLeaders, genericLeaders) || other.genericLeaders == genericLeaders)&&(identical(other.regularUnits, regularUnits) || other.regularUnits == regularUnits)&&(identical(other.eliteUnits, eliteUnits) || other.eliteUnits == eliteUnits)&&(identical(other.specialEliteUnits, specialEliteUnits) || other.specialEliteUnits == specialEliteUnits)&&(identical(other.usedCards, usedCards) || other.usedCards == usedCards)&&const DeepCollectionEquality().equals(other._namedLeaders, _namedLeaders)&&(identical(other.settlementLevel, settlementLevel) || other.settlementLevel == settlementLevel));
}


@override
int get hashCode => Object.hash(runtimeType,genericLeaders,regularUnits,eliteUnits,specialEliteUnits,usedCards,const DeepCollectionEquality().hash(_namedLeaders),settlementLevel);

@override
String toString() {
  return 'DefendingLegion(genericLeaders: $genericLeaders, regularUnits: $regularUnits, eliteUnits: $eliteUnits, specialEliteUnits: $specialEliteUnits, usedCards: $usedCards, namedLeaders: $namedLeaders, settlementLevel: $settlementLevel)';
}


}

/// @nodoc
abstract mixin class _$DefendingLegionCopyWith<$Res> implements $DefendingLegionCopyWith<$Res> {
  factory _$DefendingLegionCopyWith(_DefendingLegion value, $Res Function(_DefendingLegion) _then) = __$DefendingLegionCopyWithImpl;
@override @useResult
$Res call({
 int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, int usedCards, List<NamedLeader> namedLeaders, int settlementLevel
});




}
/// @nodoc
class __$DefendingLegionCopyWithImpl<$Res>
    implements _$DefendingLegionCopyWith<$Res> {
  __$DefendingLegionCopyWithImpl(this._self, this._then);

  final _DefendingLegion _self;
  final $Res Function(_DefendingLegion) _then;

/// Create a copy of DefendingLegion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genericLeaders = null,Object? regularUnits = null,Object? eliteUnits = null,Object? specialEliteUnits = null,Object? usedCards = null,Object? namedLeaders = null,Object? settlementLevel = null,}) {
  return _then(_DefendingLegion(
genericLeaders: null == genericLeaders ? _self.genericLeaders : genericLeaders // ignore: cast_nullable_to_non_nullable
as int,regularUnits: null == regularUnits ? _self.regularUnits : regularUnits // ignore: cast_nullable_to_non_nullable
as int,eliteUnits: null == eliteUnits ? _self.eliteUnits : eliteUnits // ignore: cast_nullable_to_non_nullable
as int,specialEliteUnits: null == specialEliteUnits ? _self.specialEliteUnits : specialEliteUnits // ignore: cast_nullable_to_non_nullable
as int,usedCards: null == usedCards ? _self.usedCards : usedCards // ignore: cast_nullable_to_non_nullable
as int,namedLeaders: null == namedLeaders ? _self._namedLeaders : namedLeaders // ignore: cast_nullable_to_non_nullable
as List<NamedLeader>,settlementLevel: null == settlementLevel ? _self.settlementLevel : settlementLevel // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
