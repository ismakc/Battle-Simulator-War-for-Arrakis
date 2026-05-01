// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

  AttackingLegion get attackingLegion;

  DefendingLegion get defendingLegion;

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BattleScenarioCopyWith<BattleScenario> get copyWith =>
      _$BattleScenarioCopyWithImpl<BattleScenario>(
          this as BattleScenario, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BattleScenario &&
            const DeepCollectionEquality().equals(
                other.attackingLegion, attackingLegion) &&
            const DeepCollectionEquality().equals(
                other.defendingLegion, defendingLegion));
  }


  @override
  int get hashCode =>
      Object.hash(
      runtimeType, const DeepCollectionEquality().hash(attackingLegion),
      const DeepCollectionEquality().hash(defendingLegion));

  @override
  String toString() {
    return 'BattleScenario(attackingLegion: $attackingLegion, defendingLegion: $defendingLegion)';
  }


}

/// @nodoc
abstract mixin class $BattleScenarioCopyWith<$Res> {
  factory $BattleScenarioCopyWith(BattleScenario value,
      $Res Function(BattleScenario) _then) = _$BattleScenarioCopyWithImpl;

  @useResult
  $Res call({
    AttackingLegion attackingLegion, DefendingLegion defendingLegion
  });


}

/// @nodoc
class _$BattleScenarioCopyWithImpl<$Res>
    implements $BattleScenarioCopyWith<$Res> {
  _$BattleScenarioCopyWithImpl(this._self, this._then);

  final BattleScenario _self;
  final $Res Function(BattleScenario) _then;

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? attackingLegion = freezed, Object? defendingLegion = freezed,}) {
    return _then(_self.copyWith(
      attackingLegion: freezed == attackingLegion
          ? _self.attackingLegion
          : attackingLegion // ignore: cast_nullable_to_non_nullable
      as AttackingLegion,
      defendingLegion: freezed == defendingLegion
          ? _self.defendingLegion
          : defendingLegion // ignore: cast_nullable_to_non_nullable
      as DefendingLegion,
    ));
  }

}


/// Adds pattern-matching-related methods to [BattleScenario].
extension BattleScenarioPatterns on BattleScenario {
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

  TResult Function( _BattleScenario value)? $default,{required TResult orElse(),}){
  final _that = this;
  switch (_that) {
  case _BattleScenario() when $default != null:
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

  @optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattleScenario value) $default,){
  final _that = this;
  switch (_that) {
  case _BattleScenario():
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

  @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattleScenario value)? $default,){
  final _that = this;
  switch (_that) {
  case _BattleScenario() when $default != null:
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

  @optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AttackingLegion attackingLegion, DefendingLegion defendingLegion)? $default,{required TResult orElse(),}) {final _that = this;
  switch (_that) {
  case _BattleScenario() when $default != null:
  return $default(_that.attackingLegion,_that.defendingLegion);case _:
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

  @optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AttackingLegion attackingLegion, DefendingLegion defendingLegion) $default,) {final _that = this;
  switch (_that) {
  case _BattleScenario():
  return $default(_that.attackingLegion,_that.defendingLegion);case _:
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

  @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AttackingLegion attackingLegion, DefendingLegion defendingLegion)? $default,) {final _that = this;
  switch (_that) {
  case _BattleScenario() when $default != null:
  return $default(_that.attackingLegion,_that.defendingLegion);case _:
  return null;

  }
  }

}

/// @nodoc


class _BattleScenario implements BattleScenario {
  const _BattleScenario(
      {this.attackingLegion = const AttackingLegion(), this.defendingLegion = const DefendingLegion()});


  @override
  @JsonKey()
  final AttackingLegion attackingLegion;
  @override
  @JsonKey()
  final DefendingLegion defendingLegion;

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BattleScenarioCopyWith<_BattleScenario> get copyWith =>
      __$BattleScenarioCopyWithImpl<_BattleScenario>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BattleScenario &&
            const DeepCollectionEquality().equals(
                other.attackingLegion, attackingLegion) &&
            const DeepCollectionEquality().equals(
                other.defendingLegion, defendingLegion));
  }


  @override
  int get hashCode =>
      Object.hash(
      runtimeType, const DeepCollectionEquality().hash(attackingLegion),
      const DeepCollectionEquality().hash(defendingLegion));

  @override
  String toString() {
    return 'BattleScenario(attackingLegion: $attackingLegion, defendingLegion: $defendingLegion)';
  }


}

/// @nodoc
abstract mixin class _$BattleScenarioCopyWith<$Res>
    implements $BattleScenarioCopyWith<$Res> {
  factory _$BattleScenarioCopyWith(_BattleScenario value,
      $Res Function(_BattleScenario) _then) = __$BattleScenarioCopyWithImpl;

  @override
  @useResult
  $Res call({
    AttackingLegion attackingLegion, DefendingLegion defendingLegion
  });


}

/// @nodoc
class __$BattleScenarioCopyWithImpl<$Res>
    implements _$BattleScenarioCopyWith<$Res> {
  __$BattleScenarioCopyWithImpl(this._self, this._then);

  final _BattleScenario _self;
  final $Res Function(_BattleScenario) _then;

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? attackingLegion = freezed, Object? defendingLegion = freezed,}) {
    return _then(_BattleScenario(
      attackingLegion: freezed == attackingLegion
          ? _self.attackingLegion
          : attackingLegion // ignore: cast_nullable_to_non_nullable
      as AttackingLegion,
      defendingLegion: freezed == defendingLegion
          ? _self.defendingLegion
          : defendingLegion // ignore: cast_nullable_to_non_nullable
      as DefendingLegion,
    ));
  }


}

// dart format on
