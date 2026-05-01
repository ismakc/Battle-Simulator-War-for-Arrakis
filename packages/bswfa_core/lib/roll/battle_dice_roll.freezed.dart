// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_dice_roll.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BattleDiceRoll {

  DiceRoll get attackerDiceRoll;

  DiceRoll get defenderDiceRoll;

  /// Create a copy of BattleDiceRoll
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BattleDiceRollCopyWith<BattleDiceRoll> get copyWith =>
      _$BattleDiceRollCopyWithImpl<BattleDiceRoll>(
          this as BattleDiceRoll, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BattleDiceRoll &&
            (identical(other.attackerDiceRoll, attackerDiceRoll) ||
                other.attackerDiceRoll == attackerDiceRoll) &&
            (identical(other.defenderDiceRoll, defenderDiceRoll) ||
                other.defenderDiceRoll == defenderDiceRoll));
  }


  @override
  int get hashCode =>
      Object.hash(runtimeType, attackerDiceRoll, defenderDiceRoll);

  @override
  String toString() {
    return 'BattleDiceRoll(attackerDiceRoll: $attackerDiceRoll, defenderDiceRoll: $defenderDiceRoll)';
  }


}

/// @nodoc
abstract mixin class $BattleDiceRollCopyWith<$Res> {
  factory $BattleDiceRollCopyWith(BattleDiceRoll value,
      $Res Function(BattleDiceRoll) _then) = _$BattleDiceRollCopyWithImpl;

  @useResult
  $Res call({
    DiceRoll attackerDiceRoll, DiceRoll defenderDiceRoll
  });


}

/// @nodoc
class _$BattleDiceRollCopyWithImpl<$Res>
    implements $BattleDiceRollCopyWith<$Res> {
  _$BattleDiceRollCopyWithImpl(this._self, this._then);

  final BattleDiceRoll _self;
  final $Res Function(BattleDiceRoll) _then;

  /// Create a copy of BattleDiceRoll
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? attackerDiceRoll = null, Object? defenderDiceRoll = null,}) {
    return _then(_self.copyWith(
      attackerDiceRoll: null == attackerDiceRoll
          ? _self.attackerDiceRoll
          : attackerDiceRoll // ignore: cast_nullable_to_non_nullable
      as DiceRoll,
      defenderDiceRoll: null == defenderDiceRoll
          ? _self.defenderDiceRoll
          : defenderDiceRoll // ignore: cast_nullable_to_non_nullable
      as DiceRoll,
    ));
  }

}


/// Adds pattern-matching-related methods to [BattleDiceRoll].
extension BattleDiceRollPatterns on BattleDiceRoll {
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

  @optionalTypeArgs TResult maybeMap

  <

  TResult

  extends

  Object?

  >

  (

  TResult Function( _BattleDiceRoll value)? $default,{required TResult orElse(),}){
  final _that = this;
  switch (_that) {
  case _BattleDiceRoll() when $default != null:
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

  @optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattleDiceRoll value) $default,){
  final _that = this;
  switch (_that) {
  case _BattleDiceRoll():
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

  @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattleDiceRoll value)? $default,){
  final _that = this;
  switch (_that) {
  case _BattleDiceRoll() when $default != null:
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

  @optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DiceRoll attackerDiceRoll, DiceRoll defenderDiceRoll)? $default,{required TResult orElse(),}) {final _that = this;
  switch (_that) {
  case _BattleDiceRoll() when $default != null:
  return $default(_that.attackerDiceRoll,_that.defenderDiceRoll);case _:
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

  @optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DiceRoll attackerDiceRoll, DiceRoll defenderDiceRoll) $default,) {final _that = this;
  switch (_that) {
  case _BattleDiceRoll():
  return $default(_that.attackerDiceRoll,_that.defenderDiceRoll);case _:
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

  @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DiceRoll attackerDiceRoll, DiceRoll defenderDiceRoll)? $default,) {final _that = this;
  switch (_that) {
  case _BattleDiceRoll() when $default != null:
  return $default(_that.attackerDiceRoll,_that.defenderDiceRoll);case _:
  return null;

  }
  }

}

/// @nodoc


class _BattleDiceRoll extends BattleDiceRoll {
  const _BattleDiceRoll(
      {this.attackerDiceRoll = DiceRoll.zero, this.defenderDiceRoll = DiceRoll
          .zero}) : super._();


  @override
  @JsonKey()
  final DiceRoll attackerDiceRoll;
  @override
  @JsonKey()
  final DiceRoll defenderDiceRoll;

  /// Create a copy of BattleDiceRoll
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BattleDiceRollCopyWith<_BattleDiceRoll> get copyWith =>
      __$BattleDiceRollCopyWithImpl<_BattleDiceRoll>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BattleDiceRoll &&
            (identical(other.attackerDiceRoll, attackerDiceRoll) ||
                other.attackerDiceRoll == attackerDiceRoll) &&
            (identical(other.defenderDiceRoll, defenderDiceRoll) ||
                other.defenderDiceRoll == defenderDiceRoll));
  }


  @override
  int get hashCode =>
      Object.hash(runtimeType, attackerDiceRoll, defenderDiceRoll);

  @override
  String toString() {
    return 'BattleDiceRoll(attackerDiceRoll: $attackerDiceRoll, defenderDiceRoll: $defenderDiceRoll)';
  }


}

/// @nodoc
abstract mixin class _$BattleDiceRollCopyWith<$Res>
    implements $BattleDiceRollCopyWith<$Res> {
  factory _$BattleDiceRollCopyWith(_BattleDiceRoll value,
      $Res Function(_BattleDiceRoll) _then) = __$BattleDiceRollCopyWithImpl;

  @override
  @useResult
  $Res call({
    DiceRoll attackerDiceRoll, DiceRoll defenderDiceRoll
  });


}

/// @nodoc
class __$BattleDiceRollCopyWithImpl<$Res>
    implements _$BattleDiceRollCopyWith<$Res> {
  __$BattleDiceRollCopyWithImpl(this._self, this._then);

  final _BattleDiceRoll _self;
  final $Res Function(_BattleDiceRoll) _then;

  /// Create a copy of BattleDiceRoll
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? attackerDiceRoll = null, Object? defenderDiceRoll = null,}) {
    return _then(_BattleDiceRoll(
      attackerDiceRoll: null == attackerDiceRoll
          ? _self.attackerDiceRoll
          : attackerDiceRoll // ignore: cast_nullable_to_non_nullable
      as DiceRoll,
      defenderDiceRoll: null == defenderDiceRoll
          ? _self.defenderDiceRoll
          : defenderDiceRoll // ignore: cast_nullable_to_non_nullable
      as DiceRoll,
    ));
  }


}

// dart format on
