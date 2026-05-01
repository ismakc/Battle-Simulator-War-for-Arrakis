// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BattleResult {

  int get playedCombatRounds;

  AutomaticBattleEndReason get endReason;

  BattleScenario get resultingScenario;

  BattleStatistic get statistic;

  /// Create a copy of BattleResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BattleResultCopyWith<BattleResult> get copyWith =>
      _$BattleResultCopyWithImpl<BattleResult>(
          this as BattleResult, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BattleResult &&
            (identical(other.playedCombatRounds, playedCombatRounds) ||
                other.playedCombatRounds == playedCombatRounds) &&
            (identical(other.endReason, endReason) ||
                other.endReason == endReason) &&
            (identical(other.resultingScenario, resultingScenario) ||
                other.resultingScenario == resultingScenario) &&
            (identical(other.statistic, statistic) ||
                other.statistic == statistic));
  }


  @override
  int get hashCode =>
      Object.hash(
      runtimeType, playedCombatRounds, endReason, resultingScenario, statistic);

  @override
  String toString() {
    return 'BattleResult(playedCombatRounds: $playedCombatRounds, endReason: $endReason, resultingScenario: $resultingScenario, statistic: $statistic)';
  }


}

/// @nodoc
abstract mixin class $BattleResultCopyWith<$Res> {
  factory $BattleResultCopyWith(BattleResult value,
      $Res Function(BattleResult) _then) = _$BattleResultCopyWithImpl;

  @useResult
  $Res call({
    int playedCombatRounds, AutomaticBattleEndReason endReason, BattleScenario resultingScenario, BattleStatistic statistic
  });


  $BattleScenarioCopyWith<$Res> get resultingScenario;

  $BattleStatisticCopyWith<$Res> get statistic;

}

/// @nodoc
class _$BattleResultCopyWithImpl<$Res>
    implements $BattleResultCopyWith<$Res> {
  _$BattleResultCopyWithImpl(this._self, this._then);

  final BattleResult _self;
  final $Res Function(BattleResult) _then;

  /// Create a copy of BattleResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? playedCombatRounds = null, Object? endReason = null, Object? resultingScenario = null, Object? statistic = null,}) {
    return _then(_self.copyWith(
      playedCombatRounds: null == playedCombatRounds
          ? _self.playedCombatRounds
          : playedCombatRounds // ignore: cast_nullable_to_non_nullable
      as int,
      endReason: null == endReason
          ? _self.endReason
          : endReason // ignore: cast_nullable_to_non_nullable
      as AutomaticBattleEndReason,
      resultingScenario: null == resultingScenario
          ? _self.resultingScenario
          : resultingScenario // ignore: cast_nullable_to_non_nullable
      as BattleScenario,
      statistic: null == statistic
          ? _self.statistic
          : statistic // ignore: cast_nullable_to_non_nullable
      as BattleStatistic,
    ));
  }

  /// Create a copy of BattleResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BattleScenarioCopyWith<$Res> get resultingScenario {
    return $BattleScenarioCopyWith<$Res>(_self.resultingScenario, (value) {
      return _then(_self.copyWith(resultingScenario: value));
    });
  }

  /// Create a copy of BattleResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BattleStatisticCopyWith<$Res> get statistic {
    return $BattleStatisticCopyWith<$Res>(_self.statistic, (value) {
      return _then(_self.copyWith(statistic: value));
    });
  }
}


/// Adds pattern-matching-related methods to [BattleResult].
extension BattleResultPatterns on BattleResult {
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

  TResult Function( _BattleResult value)? $default,{required TResult orElse(),}){
  final _that = this;
  switch (_that) {
  case _BattleResult() when $default != null:
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

  @optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattleResult value) $default,){
  final _that = this;
  switch (_that) {
  case _BattleResult():
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

  @optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattleResult value)? $default,){
  final _that = this;
  switch (_that) {
  case _BattleResult() when $default != null:
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

  @optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int playedCombatRounds, AutomaticBattleEndReason endReason, BattleScenario resultingScenario, BattleStatistic statistic)? $default,{required TResult orElse(),}) {final _that = this;
  switch (_that) {
  case _BattleResult() when $default != null:
  return $default(_that.playedCombatRounds,_that.endReason,_that.resultingScenario,_that.statistic);case _:
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

  @optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int playedCombatRounds, AutomaticBattleEndReason endReason, BattleScenario resultingScenario, BattleStatistic statistic) $default,) {final _that = this;
  switch (_that) {
  case _BattleResult():
  return $default(_that.playedCombatRounds,_that.endReason,_that.resultingScenario,_that.statistic);case _:
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

  @optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int playedCombatRounds, AutomaticBattleEndReason endReason, BattleScenario resultingScenario, BattleStatistic statistic)? $default,) {final _that = this;
  switch (_that) {
  case _BattleResult() when $default != null:
  return $default(_that.playedCombatRounds,_that.endReason,_that.resultingScenario,_that.statistic);case _:
  return null;

  }
  }

}

/// @nodoc


class _BattleResult extends BattleResult {
  const _BattleResult(
      {required this.playedCombatRounds, required this.endReason, required this.resultingScenario, required this.statistic})
      : super._();


  @override final int playedCombatRounds;
  @override final AutomaticBattleEndReason endReason;
  @override final BattleScenario resultingScenario;
  @override final BattleStatistic statistic;

  /// Create a copy of BattleResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BattleResultCopyWith<_BattleResult> get copyWith =>
      __$BattleResultCopyWithImpl<_BattleResult>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _BattleResult &&
            (identical(other.playedCombatRounds, playedCombatRounds) ||
                other.playedCombatRounds == playedCombatRounds) &&
            (identical(other.endReason, endReason) ||
                other.endReason == endReason) &&
            (identical(other.resultingScenario, resultingScenario) ||
                other.resultingScenario == resultingScenario) &&
            (identical(other.statistic, statistic) ||
                other.statistic == statistic));
  }


  @override
  int get hashCode =>
      Object.hash(
      runtimeType, playedCombatRounds, endReason, resultingScenario, statistic);

  @override
  String toString() {
    return 'BattleResult(playedCombatRounds: $playedCombatRounds, endReason: $endReason, resultingScenario: $resultingScenario, statistic: $statistic)';
  }


}

/// @nodoc
abstract mixin class _$BattleResultCopyWith<$Res>
    implements $BattleResultCopyWith<$Res> {
  factory _$BattleResultCopyWith(_BattleResult value,
      $Res Function(_BattleResult) _then) = __$BattleResultCopyWithImpl;

  @override
  @useResult
  $Res call({
    int playedCombatRounds, AutomaticBattleEndReason endReason, BattleScenario resultingScenario, BattleStatistic statistic
  });


  @override $BattleScenarioCopyWith<$Res> get resultingScenario;

  @override $BattleStatisticCopyWith<$Res> get statistic;

}

/// @nodoc
class __$BattleResultCopyWithImpl<$Res>
    implements _$BattleResultCopyWith<$Res> {
  __$BattleResultCopyWithImpl(this._self, this._then);

  final _BattleResult _self;
  final $Res Function(_BattleResult) _then;

  /// Create a copy of BattleResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? playedCombatRounds = null, Object? endReason = null, Object? resultingScenario = null, Object? statistic = null,}) {
    return _then(_BattleResult(
      playedCombatRounds: null == playedCombatRounds
          ? _self.playedCombatRounds
          : playedCombatRounds // ignore: cast_nullable_to_non_nullable
      as int,
      endReason: null == endReason
          ? _self.endReason
          : endReason // ignore: cast_nullable_to_non_nullable
      as AutomaticBattleEndReason,
      resultingScenario: null == resultingScenario
          ? _self.resultingScenario
          : resultingScenario // ignore: cast_nullable_to_non_nullable
      as BattleScenario,
      statistic: null == statistic
          ? _self.statistic
          : statistic // ignore: cast_nullable_to_non_nullable
      as BattleStatistic,
    ));
  }

  /// Create a copy of BattleResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BattleScenarioCopyWith<$Res> get resultingScenario {
    return $BattleScenarioCopyWith<$Res>(_self.resultingScenario, (value) {
      return _then(_self.copyWith(resultingScenario: value));
    });
  }

  /// Create a copy of BattleResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BattleStatisticCopyWith<$Res> get statistic {
    return $BattleStatisticCopyWith<$Res>(_self.statistic, (value) {
      return _then(_self.copyWith(statistic: value));
    });
  }
}

// dart format on
