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
  double get attackerExpectedHits => throw _privateConstructorUsedError;
  double get attackerStdDeviationHits => throw _privateConstructorUsedError;
  double get defenderExpectedHits => throw _privateConstructorUsedError;
  double get defenderStdDeviationHits => throw _privateConstructorUsedError;

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
      {double attackerExpectedHits,
      double attackerStdDeviationHits,
      double defenderExpectedHits,
      double defenderStdDeviationHits});
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
    Object? attackerExpectedHits = null,
    Object? attackerStdDeviationHits = null,
    Object? defenderExpectedHits = null,
    Object? defenderStdDeviationHits = null,
  }) {
    return _then(_value.copyWith(
      attackerExpectedHits: null == attackerExpectedHits
          ? _value.attackerExpectedHits
          : attackerExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      attackerStdDeviationHits: null == attackerStdDeviationHits
          ? _value.attackerStdDeviationHits
          : attackerStdDeviationHits // ignore: cast_nullable_to_non_nullable
              as double,
      defenderExpectedHits: null == defenderExpectedHits
          ? _value.defenderExpectedHits
          : defenderExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      defenderStdDeviationHits: null == defenderStdDeviationHits
          ? _value.defenderStdDeviationHits
          : defenderStdDeviationHits // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
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
      {double attackerExpectedHits,
      double attackerStdDeviationHits,
      double defenderExpectedHits,
      double defenderStdDeviationHits});
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
    Object? attackerExpectedHits = null,
    Object? attackerStdDeviationHits = null,
    Object? defenderExpectedHits = null,
    Object? defenderStdDeviationHits = null,
  }) {
    return _then(_$BattleStatisticImpl(
      attackerExpectedHits: null == attackerExpectedHits
          ? _value.attackerExpectedHits
          : attackerExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      attackerStdDeviationHits: null == attackerStdDeviationHits
          ? _value.attackerStdDeviationHits
          : attackerStdDeviationHits // ignore: cast_nullable_to_non_nullable
              as double,
      defenderExpectedHits: null == defenderExpectedHits
          ? _value.defenderExpectedHits
          : defenderExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      defenderStdDeviationHits: null == defenderStdDeviationHits
          ? _value.defenderStdDeviationHits
          : defenderStdDeviationHits // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$BattleStatisticImpl extends _BattleStatistic {
  const _$BattleStatisticImpl(
      {required this.attackerExpectedHits,
      required this.attackerStdDeviationHits,
      required this.defenderExpectedHits,
      required this.defenderStdDeviationHits})
      : super._();

  @override
  final double attackerExpectedHits;
  @override
  final double attackerStdDeviationHits;
  @override
  final double defenderExpectedHits;
  @override
  final double defenderStdDeviationHits;

  @override
  String toString() {
    return 'BattleStatistic(attackerExpectedHits: $attackerExpectedHits, attackerStdDeviationHits: $attackerStdDeviationHits, defenderExpectedHits: $defenderExpectedHits, defenderStdDeviationHits: $defenderStdDeviationHits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleStatisticImpl &&
            (identical(other.attackerExpectedHits, attackerExpectedHits) ||
                other.attackerExpectedHits == attackerExpectedHits) &&
            (identical(
                    other.attackerStdDeviationHits, attackerStdDeviationHits) ||
                other.attackerStdDeviationHits == attackerStdDeviationHits) &&
            (identical(other.defenderExpectedHits, defenderExpectedHits) ||
                other.defenderExpectedHits == defenderExpectedHits) &&
            (identical(
                    other.defenderStdDeviationHits, defenderStdDeviationHits) ||
                other.defenderStdDeviationHits == defenderStdDeviationHits));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attackerExpectedHits,
      attackerStdDeviationHits, defenderExpectedHits, defenderStdDeviationHits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleStatisticImplCopyWith<_$BattleStatisticImpl> get copyWith =>
      __$$BattleStatisticImplCopyWithImpl<_$BattleStatisticImpl>(
          this, _$identity);
}

abstract class _BattleStatistic extends BattleStatistic {
  const factory _BattleStatistic(
      {required final double attackerExpectedHits,
      required final double attackerStdDeviationHits,
      required final double defenderExpectedHits,
      required final double defenderStdDeviationHits}) = _$BattleStatisticImpl;
  const _BattleStatistic._() : super._();

  @override
  double get attackerExpectedHits;
  @override
  double get attackerStdDeviationHits;
  @override
  double get defenderExpectedHits;
  @override
  double get defenderStdDeviationHits;
  @override
  @JsonKey(ignore: true)
  _$$BattleStatisticImplCopyWith<_$BattleStatisticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
