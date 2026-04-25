// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_side_contribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BattleSideContribution {

 int get swords; int get shields; int get leaderActivatedSwords; int get leaderActivatedShields;
/// Create a copy of BattleSideContribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleSideContributionCopyWith<BattleSideContribution> get copyWith => _$BattleSideContributionCopyWithImpl<BattleSideContribution>(this as BattleSideContribution, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleSideContribution&&(identical(other.swords, swords) || other.swords == swords)&&(identical(other.shields, shields) || other.shields == shields)&&(identical(other.leaderActivatedSwords, leaderActivatedSwords) || other.leaderActivatedSwords == leaderActivatedSwords)&&(identical(other.leaderActivatedShields, leaderActivatedShields) || other.leaderActivatedShields == leaderActivatedShields));
}


@override
int get hashCode => Object.hash(runtimeType,swords,shields,leaderActivatedSwords,leaderActivatedShields);

@override
String toString() {
  return 'BattleSideContribution(swords: $swords, shields: $shields, leaderActivatedSwords: $leaderActivatedSwords, leaderActivatedShields: $leaderActivatedShields)';
}


}

/// @nodoc
abstract mixin class $BattleSideContributionCopyWith<$Res>  {
  factory $BattleSideContributionCopyWith(BattleSideContribution value, $Res Function(BattleSideContribution) _then) = _$BattleSideContributionCopyWithImpl;
@useResult
$Res call({
 int swords, int shields, int leaderActivatedSwords, int leaderActivatedShields
});




}
/// @nodoc
class _$BattleSideContributionCopyWithImpl<$Res>
    implements $BattleSideContributionCopyWith<$Res> {
  _$BattleSideContributionCopyWithImpl(this._self, this._then);

  final BattleSideContribution _self;
  final $Res Function(BattleSideContribution) _then;

/// Create a copy of BattleSideContribution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? swords = null,Object? shields = null,Object? leaderActivatedSwords = null,Object? leaderActivatedShields = null,}) {
  return _then(_self.copyWith(
swords: null == swords ? _self.swords : swords // ignore: cast_nullable_to_non_nullable
as int,shields: null == shields ? _self.shields : shields // ignore: cast_nullable_to_non_nullable
as int,leaderActivatedSwords: null == leaderActivatedSwords ? _self.leaderActivatedSwords : leaderActivatedSwords // ignore: cast_nullable_to_non_nullable
as int,leaderActivatedShields: null == leaderActivatedShields ? _self.leaderActivatedShields : leaderActivatedShields // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BattleSideContribution].
extension BattleSideContributionPatterns on BattleSideContribution {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BattleSideContribution value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BattleSideContribution() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattleSideContribution value)  $default,){
final _that = this;
switch (_that) {
case _BattleSideContribution():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattleSideContribution value)?  $default,){
final _that = this;
switch (_that) {
case _BattleSideContribution() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int swords,  int shields,  int leaderActivatedSwords,  int leaderActivatedShields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BattleSideContribution() when $default != null:
return $default(_that.swords,_that.shields,_that.leaderActivatedSwords,_that.leaderActivatedShields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int swords,  int shields,  int leaderActivatedSwords,  int leaderActivatedShields)  $default,) {final _that = this;
switch (_that) {
case _BattleSideContribution():
return $default(_that.swords,_that.shields,_that.leaderActivatedSwords,_that.leaderActivatedShields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int swords,  int shields,  int leaderActivatedSwords,  int leaderActivatedShields)?  $default,) {final _that = this;
switch (_that) {
case _BattleSideContribution() when $default != null:
return $default(_that.swords,_that.shields,_that.leaderActivatedSwords,_that.leaderActivatedShields);case _:
  return null;

}
}

}

/// @nodoc


class _BattleSideContribution extends BattleSideContribution {
  const _BattleSideContribution({this.swords = 0, this.shields = 0, this.leaderActivatedSwords = 0, this.leaderActivatedShields = 0}): super._();
  

@override@JsonKey() final  int swords;
@override@JsonKey() final  int shields;
@override@JsonKey() final  int leaderActivatedSwords;
@override@JsonKey() final  int leaderActivatedShields;

/// Create a copy of BattleSideContribution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattleSideContributionCopyWith<_BattleSideContribution> get copyWith => __$BattleSideContributionCopyWithImpl<_BattleSideContribution>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattleSideContribution&&(identical(other.swords, swords) || other.swords == swords)&&(identical(other.shields, shields) || other.shields == shields)&&(identical(other.leaderActivatedSwords, leaderActivatedSwords) || other.leaderActivatedSwords == leaderActivatedSwords)&&(identical(other.leaderActivatedShields, leaderActivatedShields) || other.leaderActivatedShields == leaderActivatedShields));
}


@override
int get hashCode => Object.hash(runtimeType,swords,shields,leaderActivatedSwords,leaderActivatedShields);

@override
String toString() {
  return 'BattleSideContribution(swords: $swords, shields: $shields, leaderActivatedSwords: $leaderActivatedSwords, leaderActivatedShields: $leaderActivatedShields)';
}


}

/// @nodoc
abstract mixin class _$BattleSideContributionCopyWith<$Res> implements $BattleSideContributionCopyWith<$Res> {
  factory _$BattleSideContributionCopyWith(_BattleSideContribution value, $Res Function(_BattleSideContribution) _then) = __$BattleSideContributionCopyWithImpl;
@override @useResult
$Res call({
 int swords, int shields, int leaderActivatedSwords, int leaderActivatedShields
});




}
/// @nodoc
class __$BattleSideContributionCopyWithImpl<$Res>
    implements _$BattleSideContributionCopyWith<$Res> {
  __$BattleSideContributionCopyWithImpl(this._self, this._then);

  final _BattleSideContribution _self;
  final $Res Function(_BattleSideContribution) _then;

/// Create a copy of BattleSideContribution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? swords = null,Object? shields = null,Object? leaderActivatedSwords = null,Object? leaderActivatedShields = null,}) {
  return _then(_BattleSideContribution(
swords: null == swords ? _self.swords : swords // ignore: cast_nullable_to_non_nullable
as int,shields: null == shields ? _self.shields : shields // ignore: cast_nullable_to_non_nullable
as int,leaderActivatedSwords: null == leaderActivatedSwords ? _self.leaderActivatedSwords : leaderActivatedSwords // ignore: cast_nullable_to_non_nullable
as int,leaderActivatedShields: null == leaderActivatedShields ? _self.leaderActivatedShields : leaderActivatedShields // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
