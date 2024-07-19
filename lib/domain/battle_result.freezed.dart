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
  int get rounds => throw _privateConstructorUsedError;
  double get attackerExpectedHits => throw _privateConstructorUsedError;
  double get defenderExpectedHits => throw _privateConstructorUsedError;
  BattleScenario get battleScenario => throw _privateConstructorUsedError;

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
      {int rounds,
      double attackerExpectedHits,
      double defenderExpectedHits,
      BattleScenario battleScenario});

  $BattleScenarioCopyWith<$Res> get battleScenario;
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
    Object? rounds = null,
    Object? attackerExpectedHits = null,
    Object? defenderExpectedHits = null,
    Object? battleScenario = null,
  }) {
    return _then(_value.copyWith(
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      attackerExpectedHits: null == attackerExpectedHits
          ? _value.attackerExpectedHits
          : attackerExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      defenderExpectedHits: null == defenderExpectedHits
          ? _value.defenderExpectedHits
          : defenderExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      battleScenario: null == battleScenario
          ? _value.battleScenario
          : battleScenario // ignore: cast_nullable_to_non_nullable
              as BattleScenario,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BattleScenarioCopyWith<$Res> get battleScenario {
    return $BattleScenarioCopyWith<$Res>(_value.battleScenario, (value) {
      return _then(_value.copyWith(battleScenario: value) as $Val);
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
      {int rounds,
      double attackerExpectedHits,
      double defenderExpectedHits,
      BattleScenario battleScenario});

  @override
  $BattleScenarioCopyWith<$Res> get battleScenario;
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
    Object? rounds = null,
    Object? attackerExpectedHits = null,
    Object? defenderExpectedHits = null,
    Object? battleScenario = null,
  }) {
    return _then(_$BattleStatisticImpl(
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as int,
      attackerExpectedHits: null == attackerExpectedHits
          ? _value.attackerExpectedHits
          : attackerExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      defenderExpectedHits: null == defenderExpectedHits
          ? _value.defenderExpectedHits
          : defenderExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      battleScenario: null == battleScenario
          ? _value.battleScenario
          : battleScenario // ignore: cast_nullable_to_non_nullable
              as BattleScenario,
    ));
  }
}

/// @nodoc

class _$BattleStatisticImpl extends _BattleStatistic {
  const _$BattleStatisticImpl(
      {required this.rounds,
      required this.attackerExpectedHits,
      required this.defenderExpectedHits,
      required this.battleScenario})
      : super._();

  @override
  final int rounds;
  @override
  final double attackerExpectedHits;
  @override
  final double defenderExpectedHits;
  @override
  final BattleScenario battleScenario;

  @override
  String toString() {
    return 'BattleResult(rounds: $rounds, attackerExpectedHits: $attackerExpectedHits, defenderExpectedHits: $defenderExpectedHits, battleScenario: $battleScenario)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleStatisticImpl &&
            (identical(other.rounds, rounds) || other.rounds == rounds) &&
            (identical(other.attackerExpectedHits, attackerExpectedHits) ||
                other.attackerExpectedHits == attackerExpectedHits) &&
            (identical(other.defenderExpectedHits, defenderExpectedHits) ||
                other.defenderExpectedHits == defenderExpectedHits) &&
            (identical(other.battleScenario, battleScenario) ||
                other.battleScenario == battleScenario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rounds, attackerExpectedHits,
      defenderExpectedHits, battleScenario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleStatisticImplCopyWith<_$BattleStatisticImpl> get copyWith =>
      __$$BattleStatisticImplCopyWithImpl<_$BattleStatisticImpl>(
          this, _$identity);
}

abstract class _BattleStatistic extends BattleResult {
  const factory _BattleStatistic(
      {required final int rounds,
      required final double attackerExpectedHits,
      required final double defenderExpectedHits,
      required final BattleScenario battleScenario}) = _$BattleStatisticImpl;
  const _BattleStatistic._() : super._();

  @override
  int get rounds;
  @override
  double get attackerExpectedHits;
  @override
  double get defenderExpectedHits;
  @override
  BattleScenario get battleScenario;
  @override
  @JsonKey(ignore: true)
  _$$BattleStatisticImplCopyWith<_$BattleStatisticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
