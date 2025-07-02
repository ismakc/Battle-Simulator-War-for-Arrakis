// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'legion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Legion {

 int get genericLeaders; int get regularUnits; int get eliteUnits; int get specialEliteUnits; int get usedCards; List<NamedLeader> get namedLeaders;
/// Create a copy of Legion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegionCopyWith<Legion> get copyWith => _$LegionCopyWithImpl<Legion>(this as Legion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Legion&&(identical(other.genericLeaders, genericLeaders) || other.genericLeaders == genericLeaders)&&(identical(other.regularUnits, regularUnits) || other.regularUnits == regularUnits)&&(identical(other.eliteUnits, eliteUnits) || other.eliteUnits == eliteUnits)&&(identical(other.specialEliteUnits, specialEliteUnits) || other.specialEliteUnits == specialEliteUnits)&&(identical(other.usedCards, usedCards) || other.usedCards == usedCards)&&const DeepCollectionEquality().equals(other.namedLeaders, namedLeaders));
}


@override
int get hashCode => Object.hash(runtimeType,genericLeaders,regularUnits,eliteUnits,specialEliteUnits,usedCards,const DeepCollectionEquality().hash(namedLeaders));

@override
String toString() {
  return 'Legion(genericLeaders: $genericLeaders, regularUnits: $regularUnits, eliteUnits: $eliteUnits, specialEliteUnits: $specialEliteUnits, usedCards: $usedCards, namedLeaders: $namedLeaders)';
}


}

/// @nodoc
abstract mixin class $LegionCopyWith<$Res>  {
  factory $LegionCopyWith(Legion value, $Res Function(Legion) _then) = _$LegionCopyWithImpl;
@useResult
$Res call({
 int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, int usedCards, List<NamedLeader> namedLeaders
});




}
/// @nodoc
class _$LegionCopyWithImpl<$Res>
    implements $LegionCopyWith<$Res> {
  _$LegionCopyWithImpl(this._self, this._then);

  final Legion _self;
  final $Res Function(Legion) _then;

/// Create a copy of Legion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? genericLeaders = null,Object? regularUnits = null,Object? eliteUnits = null,Object? specialEliteUnits = null,Object? usedCards = null,Object? namedLeaders = null,}) {
  return _then(_self.copyWith(
genericLeaders: null == genericLeaders ? _self.genericLeaders : genericLeaders // ignore: cast_nullable_to_non_nullable
as int,regularUnits: null == regularUnits ? _self.regularUnits : regularUnits // ignore: cast_nullable_to_non_nullable
as int,eliteUnits: null == eliteUnits ? _self.eliteUnits : eliteUnits // ignore: cast_nullable_to_non_nullable
as int,specialEliteUnits: null == specialEliteUnits ? _self.specialEliteUnits : specialEliteUnits // ignore: cast_nullable_to_non_nullable
as int,usedCards: null == usedCards ? _self.usedCards : usedCards // ignore: cast_nullable_to_non_nullable
as int,namedLeaders: null == namedLeaders ? _self.namedLeaders : namedLeaders // ignore: cast_nullable_to_non_nullable
as List<NamedLeader>,
  ));
}

}


/// @nodoc


class _Legion extends Legion {
  const _Legion({this.genericLeaders = 0, this.regularUnits = 0, this.eliteUnits = 0, this.specialEliteUnits = 0, this.usedCards = 0, final  List<NamedLeader> namedLeaders = const <NamedLeader>[]}): _namedLeaders = namedLeaders,super._();
  

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


/// Create a copy of Legion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegionCopyWith<_Legion> get copyWith => __$LegionCopyWithImpl<_Legion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Legion&&(identical(other.genericLeaders, genericLeaders) || other.genericLeaders == genericLeaders)&&(identical(other.regularUnits, regularUnits) || other.regularUnits == regularUnits)&&(identical(other.eliteUnits, eliteUnits) || other.eliteUnits == eliteUnits)&&(identical(other.specialEliteUnits, specialEliteUnits) || other.specialEliteUnits == specialEliteUnits)&&(identical(other.usedCards, usedCards) || other.usedCards == usedCards)&&const DeepCollectionEquality().equals(other._namedLeaders, _namedLeaders));
}


@override
int get hashCode => Object.hash(runtimeType,genericLeaders,regularUnits,eliteUnits,specialEliteUnits,usedCards,const DeepCollectionEquality().hash(_namedLeaders));

@override
String toString() {
  return 'Legion(genericLeaders: $genericLeaders, regularUnits: $regularUnits, eliteUnits: $eliteUnits, specialEliteUnits: $specialEliteUnits, usedCards: $usedCards, namedLeaders: $namedLeaders)';
}


}

/// @nodoc
abstract mixin class _$LegionCopyWith<$Res> implements $LegionCopyWith<$Res> {
  factory _$LegionCopyWith(_Legion value, $Res Function(_Legion) _then) = __$LegionCopyWithImpl;
@override @useResult
$Res call({
 int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, int usedCards, List<NamedLeader> namedLeaders
});




}
/// @nodoc
class __$LegionCopyWithImpl<$Res>
    implements _$LegionCopyWith<$Res> {
  __$LegionCopyWithImpl(this._self, this._then);

  final _Legion _self;
  final $Res Function(_Legion) _then;

/// Create a copy of Legion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genericLeaders = null,Object? regularUnits = null,Object? eliteUnits = null,Object? specialEliteUnits = null,Object? usedCards = null,Object? namedLeaders = null,}) {
  return _then(_Legion(
genericLeaders: null == genericLeaders ? _self.genericLeaders : genericLeaders // ignore: cast_nullable_to_non_nullable
as int,regularUnits: null == regularUnits ? _self.regularUnits : regularUnits // ignore: cast_nullable_to_non_nullable
as int,eliteUnits: null == eliteUnits ? _self.eliteUnits : eliteUnits // ignore: cast_nullable_to_non_nullable
as int,specialEliteUnits: null == specialEliteUnits ? _self.specialEliteUnits : specialEliteUnits // ignore: cast_nullable_to_non_nullable
as int,usedCards: null == usedCards ? _self.usedCards : usedCards // ignore: cast_nullable_to_non_nullable
as int,namedLeaders: null == namedLeaders ? _self._namedLeaders : namedLeaders // ignore: cast_nullable_to_non_nullable
as List<NamedLeader>,
  ));
}


}

// dart format on
