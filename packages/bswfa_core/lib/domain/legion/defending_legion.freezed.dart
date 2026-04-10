// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [DefendingLegion].
extension DefendingLegionPatterns on DefendingLegion {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DefendingLegion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DefendingLegion() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DefendingLegion value)  $default,){
final _that = this;
switch (_that) {
case _DefendingLegion():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DefendingLegion value)?  $default,){
final _that = this;
switch (_that) {
case _DefendingLegion() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int genericLeaders,  int regularUnits,  int eliteUnits,  int specialEliteUnits,  int usedCards,  List<NamedLeader> namedLeaders,  int settlementLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DefendingLegion() when $default != null:
return $default(_that.genericLeaders,_that.regularUnits,_that.eliteUnits,_that.specialEliteUnits,_that.usedCards,_that.namedLeaders,_that.settlementLevel);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int genericLeaders,  int regularUnits,  int eliteUnits,  int specialEliteUnits,  int usedCards,  List<NamedLeader> namedLeaders,  int settlementLevel)  $default,) {final _that = this;
switch (_that) {
case _DefendingLegion():
return $default(_that.genericLeaders,_that.regularUnits,_that.eliteUnits,_that.specialEliteUnits,_that.usedCards,_that.namedLeaders,_that.settlementLevel);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int genericLeaders,  int regularUnits,  int eliteUnits,  int specialEliteUnits,  int usedCards,  List<NamedLeader> namedLeaders,  int settlementLevel)?  $default,) {final _that = this;
switch (_that) {
case _DefendingLegion() when $default != null:
return $default(_that.genericLeaders,_that.regularUnits,_that.eliteUnits,_that.specialEliteUnits,_that.usedCards,_that.namedLeaders,_that.settlementLevel);case _:
  return null;

}
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
