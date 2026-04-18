// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [BattleStatistic].
extension BattleStatisticPatterns on BattleStatistic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BattleStatistic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BattleStatistic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattleStatistic value)  $default,){
final _that = this;
switch (_that) {
case _BattleStatistic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattleStatistic value)?  $default,){
final _that = this;
switch (_that) {
case _BattleStatistic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double attackerExpectedHits,  double attackerStdDeviationHits,  double defenderExpectedHits,  double defenderStdDeviationHits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BattleStatistic() when $default != null:
return $default(_that.attackerExpectedHits,_that.attackerStdDeviationHits,_that.defenderExpectedHits,_that.defenderStdDeviationHits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double attackerExpectedHits,  double attackerStdDeviationHits,  double defenderExpectedHits,  double defenderStdDeviationHits)  $default,) {final _that = this;
switch (_that) {
case _BattleStatistic():
return $default(_that.attackerExpectedHits,_that.attackerStdDeviationHits,_that.defenderExpectedHits,_that.defenderStdDeviationHits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double attackerExpectedHits,  double attackerStdDeviationHits,  double defenderExpectedHits,  double defenderStdDeviationHits)?  $default,) {final _that = this;
switch (_that) {
case _BattleStatistic() when $default != null:
return $default(_that.attackerExpectedHits,_that.attackerStdDeviationHits,_that.defenderExpectedHits,_that.defenderStdDeviationHits);case _:
  return null;

}
}

}

/// @nodoc


class _BattleStatistic extends BattleStatistic {
  const _BattleStatistic({this.attackerExpectedHits = .0, this.attackerStdDeviationHits = .0, this.defenderExpectedHits = .0, this.defenderStdDeviationHits = .0}): super._();
  

@override@JsonKey() final  double attackerExpectedHits;
@override@JsonKey() final  double attackerStdDeviationHits;
@override@JsonKey() final  double defenderExpectedHits;
@override@JsonKey() final  double defenderStdDeviationHits;

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
