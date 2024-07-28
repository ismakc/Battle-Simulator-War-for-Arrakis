// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BattleStatistic {
  double get attackerHits => throw _privateConstructorUsedError;
  double get defenderHits => throw _privateConstructorUsedError;
  double get squaredAttackerHits => throw _privateConstructorUsedError;
  double get squaredDefenderHits => throw _privateConstructorUsedError;
  BattleScenario get battleScenario => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BattleStatisticCopyWith<BattleStatistic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleStatisticCopyWith<$Res> {
  factory $BattleStatisticCopyWith(
          BattleStatistic value, $Res Function(BattleStatistic) then) =
      _$BattleStatisticCopyWithImpl<$Res, BattleStatistic>;
  @useResult
  $Res call(
      {double attackerHits,
      double defenderHits,
      double squaredAttackerHits,
      double squaredDefenderHits,
      BattleScenario battleScenario});

  $BattleScenarioCopyWith<$Res> get battleScenario;
}

/// @nodoc
class _$BattleStatisticCopyWithImpl<$Res, $Val extends BattleStatistic>
    implements $BattleStatisticCopyWith<$Res> {
  _$BattleStatisticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attackerHits = null,
    Object? defenderHits = null,
    Object? squaredAttackerHits = null,
    Object? squaredDefenderHits = null,
    Object? battleScenario = null,
  }) {
    return _then(_value.copyWith(
      attackerHits: null == attackerHits
          ? _value.attackerHits
          : attackerHits // ignore: cast_nullable_to_non_nullable
              as double,
      defenderHits: null == defenderHits
          ? _value.defenderHits
          : defenderHits // ignore: cast_nullable_to_non_nullable
              as double,
      squaredAttackerHits: null == squaredAttackerHits
          ? _value.squaredAttackerHits
          : squaredAttackerHits // ignore: cast_nullable_to_non_nullable
              as double,
      squaredDefenderHits: null == squaredDefenderHits
          ? _value.squaredDefenderHits
          : squaredDefenderHits // ignore: cast_nullable_to_non_nullable
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
    implements $BattleStatisticCopyWith<$Res> {
  factory _$$BattleStatisticImplCopyWith(_$BattleStatisticImpl value,
          $Res Function(_$BattleStatisticImpl) then) =
      __$$BattleStatisticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double attackerHits,
      double defenderHits,
      double squaredAttackerHits,
      double squaredDefenderHits,
      BattleScenario battleScenario});

  @override
  $BattleScenarioCopyWith<$Res> get battleScenario;
}

/// @nodoc
class __$$BattleStatisticImplCopyWithImpl<$Res>
    extends _$BattleStatisticCopyWithImpl<$Res, _$BattleStatisticImpl>
    implements _$$BattleStatisticImplCopyWith<$Res> {
  __$$BattleStatisticImplCopyWithImpl(
      _$BattleStatisticImpl _value, $Res Function(_$BattleStatisticImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attackerHits = null,
    Object? defenderHits = null,
    Object? squaredAttackerHits = null,
    Object? squaredDefenderHits = null,
    Object? battleScenario = null,
  }) {
    return _then(_$BattleStatisticImpl(
      attackerHits: null == attackerHits
          ? _value.attackerHits
          : attackerHits // ignore: cast_nullable_to_non_nullable
              as double,
      defenderHits: null == defenderHits
          ? _value.defenderHits
          : defenderHits // ignore: cast_nullable_to_non_nullable
              as double,
      squaredAttackerHits: null == squaredAttackerHits
          ? _value.squaredAttackerHits
          : squaredAttackerHits // ignore: cast_nullable_to_non_nullable
              as double,
      squaredDefenderHits: null == squaredDefenderHits
          ? _value.squaredDefenderHits
          : squaredDefenderHits // ignore: cast_nullable_to_non_nullable
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
      {required this.attackerHits,
      required this.defenderHits,
      required this.squaredAttackerHits,
      required this.squaredDefenderHits,
      this.battleScenario = BattleScenario.defaultValues})
      : super._();

  @override
  final double attackerHits;
  @override
  final double defenderHits;
  @override
  final double squaredAttackerHits;
  @override
  final double squaredDefenderHits;
  @override
  @JsonKey()
  final BattleScenario battleScenario;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleStatisticImpl &&
            (identical(other.attackerHits, attackerHits) ||
                other.attackerHits == attackerHits) &&
            (identical(other.defenderHits, defenderHits) ||
                other.defenderHits == defenderHits) &&
            (identical(other.squaredAttackerHits, squaredAttackerHits) ||
                other.squaredAttackerHits == squaredAttackerHits) &&
            (identical(other.squaredDefenderHits, squaredDefenderHits) ||
                other.squaredDefenderHits == squaredDefenderHits) &&
            (identical(other.battleScenario, battleScenario) ||
                other.battleScenario == battleScenario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attackerHits, defenderHits,
      squaredAttackerHits, squaredDefenderHits, battleScenario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleStatisticImplCopyWith<_$BattleStatisticImpl> get copyWith =>
      __$$BattleStatisticImplCopyWithImpl<_$BattleStatisticImpl>(
          this, _$identity);
}

abstract class _BattleStatistic extends BattleStatistic {
  const factory _BattleStatistic(
      {required final double attackerHits,
      required final double defenderHits,
      required final double squaredAttackerHits,
      required final double squaredDefenderHits,
      final BattleScenario battleScenario}) = _$BattleStatisticImpl;
  const _BattleStatistic._() : super._();

  @override
  double get attackerHits;
  @override
  double get defenderHits;
  @override
  double get squaredAttackerHits;
  @override
  double get squaredDefenderHits;
  @override
  BattleScenario get battleScenario;
  @override
  @JsonKey(ignore: true)
  _$$BattleStatisticImplCopyWith<_$BattleStatisticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
