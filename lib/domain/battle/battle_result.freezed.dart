// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BattleResult {
  int get playedCombatRounds => throw _privateConstructorUsedError;
  BattleScenario get scenario => throw _privateConstructorUsedError;
  BattleStatistic get statistic => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BattleResultCopyWith<BattleResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleResultCopyWith<$Res> {
  factory $BattleResultCopyWith(
          BattleResult value, $Res Function(BattleResult) then) =
      _$BattleResultCopyWithImpl<$Res, BattleResult>;
  @useResult
  $Res call(
      {int playedCombatRounds,
      BattleScenario scenario,
      BattleStatistic statistic});

  $BattleScenarioCopyWith<$Res> get scenario;
  $BattleStatisticCopyWith<$Res> get statistic;
}

/// @nodoc
class _$BattleResultCopyWithImpl<$Res, $Val extends BattleResult>
    implements $BattleResultCopyWith<$Res> {
  _$BattleResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playedCombatRounds = null,
    Object? scenario = null,
    Object? statistic = null,
  }) {
    return _then(_value.copyWith(
      playedCombatRounds: null == playedCombatRounds
          ? _value.playedCombatRounds
          : playedCombatRounds // ignore: cast_nullable_to_non_nullable
              as int,
      scenario: null == scenario
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as BattleScenario,
      statistic: null == statistic
          ? _value.statistic
          : statistic // ignore: cast_nullable_to_non_nullable
              as BattleStatistic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BattleScenarioCopyWith<$Res> get scenario {
    return $BattleScenarioCopyWith<$Res>(_value.scenario, (value) {
      return _then(_value.copyWith(scenario: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BattleStatisticCopyWith<$Res> get statistic {
    return $BattleStatisticCopyWith<$Res>(_value.statistic, (value) {
      return _then(_value.copyWith(statistic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BattleStatisticImplCopyWith<$Res>
    implements $BattleResultCopyWith<$Res> {
  factory _$$BattleStatisticImplCopyWith(_$BattleStatisticImpl value,
          $Res Function(_$BattleStatisticImpl) then) =
      __$$BattleStatisticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int playedCombatRounds,
      BattleScenario scenario,
      BattleStatistic statistic});

  @override
  $BattleScenarioCopyWith<$Res> get scenario;
  @override
  $BattleStatisticCopyWith<$Res> get statistic;
}

/// @nodoc
class __$$BattleStatisticImplCopyWithImpl<$Res>
    extends _$BattleResultCopyWithImpl<$Res, _$BattleStatisticImpl>
    implements _$$BattleStatisticImplCopyWith<$Res> {
  __$$BattleStatisticImplCopyWithImpl(
      _$BattleStatisticImpl _value, $Res Function(_$BattleStatisticImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playedCombatRounds = null,
    Object? scenario = null,
    Object? statistic = null,
  }) {
    return _then(_$BattleStatisticImpl(
      playedCombatRounds: null == playedCombatRounds
          ? _value.playedCombatRounds
          : playedCombatRounds // ignore: cast_nullable_to_non_nullable
              as int,
      scenario: null == scenario
          ? _value.scenario
          : scenario // ignore: cast_nullable_to_non_nullable
              as BattleScenario,
      statistic: null == statistic
          ? _value.statistic
          : statistic // ignore: cast_nullable_to_non_nullable
              as BattleStatistic,
    ));
  }
}

/// @nodoc

class _$BattleStatisticImpl extends _BattleStatistic {
  const _$BattleStatisticImpl(
      {required this.playedCombatRounds,
      required this.scenario,
      required this.statistic})
      : super._();

  @override
  final int playedCombatRounds;
  @override
  final BattleScenario scenario;
  @override
  final BattleStatistic statistic;

  @override
  String toString() {
    return 'BattleResult(playedCombatRounds: $playedCombatRounds, scenario: $scenario, statistic: $statistic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleStatisticImpl &&
            (identical(other.playedCombatRounds, playedCombatRounds) ||
                other.playedCombatRounds == playedCombatRounds) &&
            (identical(other.scenario, scenario) ||
                other.scenario == scenario) &&
            (identical(other.statistic, statistic) ||
                other.statistic == statistic));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, playedCombatRounds, scenario, statistic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleStatisticImplCopyWith<_$BattleStatisticImpl> get copyWith =>
      __$$BattleStatisticImplCopyWithImpl<_$BattleStatisticImpl>(
          this, _$identity);
}

abstract class _BattleStatistic extends BattleResult {
  const factory _BattleStatistic(
      {required final int playedCombatRounds,
      required final BattleScenario scenario,
      required final BattleStatistic statistic}) = _$BattleStatisticImpl;
  const _BattleStatistic._() : super._();

  @override
  int get playedCombatRounds;
  @override
  BattleScenario get scenario;
  @override
  BattleStatistic get statistic;
  @override
  @JsonKey(ignore: true)
  _$$BattleStatisticImplCopyWith<_$BattleStatisticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
