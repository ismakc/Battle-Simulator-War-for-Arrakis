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
  double get attackerExpectedHits => throw _privateConstructorUsedError;
  double get defenderExpectedHits => throw _privateConstructorUsedError;
  AttackingLegion get attackingLegion => throw _privateConstructorUsedError;
  DefendingLegion get defendingLegion => throw _privateConstructorUsedError;

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
      {double attackerExpectedHits,
      double defenderExpectedHits,
      AttackingLegion attackingLegion,
      DefendingLegion defendingLegion});

  $AttackingLegionCopyWith<$Res> get attackingLegion;
  $DefendingLegionCopyWith<$Res> get defendingLegion;
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
    Object? attackerExpectedHits = null,
    Object? defenderExpectedHits = null,
    Object? attackingLegion = null,
    Object? defendingLegion = null,
  }) {
    return _then(_value.copyWith(
      attackerExpectedHits: null == attackerExpectedHits
          ? _value.attackerExpectedHits
          : attackerExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      defenderExpectedHits: null == defenderExpectedHits
          ? _value.defenderExpectedHits
          : defenderExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      attackingLegion: null == attackingLegion
          ? _value.attackingLegion
          : attackingLegion // ignore: cast_nullable_to_non_nullable
              as AttackingLegion,
      defendingLegion: null == defendingLegion
          ? _value.defendingLegion
          : defendingLegion // ignore: cast_nullable_to_non_nullable
              as DefendingLegion,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttackingLegionCopyWith<$Res> get attackingLegion {
    return $AttackingLegionCopyWith<$Res>(_value.attackingLegion, (value) {
      return _then(_value.copyWith(attackingLegion: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DefendingLegionCopyWith<$Res> get defendingLegion {
    return $DefendingLegionCopyWith<$Res>(_value.defendingLegion, (value) {
      return _then(_value.copyWith(defendingLegion: value) as $Val);
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
      {double attackerExpectedHits,
      double defenderExpectedHits,
      AttackingLegion attackingLegion,
      DefendingLegion defendingLegion});

  @override
  $AttackingLegionCopyWith<$Res> get attackingLegion;
  @override
  $DefendingLegionCopyWith<$Res> get defendingLegion;
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
    Object? attackerExpectedHits = null,
    Object? defenderExpectedHits = null,
    Object? attackingLegion = null,
    Object? defendingLegion = null,
  }) {
    return _then(_$BattleStatisticImpl(
      attackerExpectedHits: null == attackerExpectedHits
          ? _value.attackerExpectedHits
          : attackerExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      defenderExpectedHits: null == defenderExpectedHits
          ? _value.defenderExpectedHits
          : defenderExpectedHits // ignore: cast_nullable_to_non_nullable
              as double,
      attackingLegion: null == attackingLegion
          ? _value.attackingLegion
          : attackingLegion // ignore: cast_nullable_to_non_nullable
              as AttackingLegion,
      defendingLegion: null == defendingLegion
          ? _value.defendingLegion
          : defendingLegion // ignore: cast_nullable_to_non_nullable
              as DefendingLegion,
    ));
  }
}

/// @nodoc

class _$BattleStatisticImpl implements _BattleStatistic {
  const _$BattleStatisticImpl(
      {required this.attackerExpectedHits,
      required this.defenderExpectedHits,
      required this.attackingLegion,
      required this.defendingLegion});

  @override
  final double attackerExpectedHits;
  @override
  final double defenderExpectedHits;
  @override
  final AttackingLegion attackingLegion;
  @override
  final DefendingLegion defendingLegion;

  @override
  String toString() {
    return 'BattleResult(attackerExpectedHits: $attackerExpectedHits, defenderExpectedHits: $defenderExpectedHits, attackingLegion: $attackingLegion, defendingLegion: $defendingLegion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleStatisticImpl &&
            (identical(other.attackerExpectedHits, attackerExpectedHits) ||
                other.attackerExpectedHits == attackerExpectedHits) &&
            (identical(other.defenderExpectedHits, defenderExpectedHits) ||
                other.defenderExpectedHits == defenderExpectedHits) &&
            (identical(other.attackingLegion, attackingLegion) ||
                other.attackingLegion == attackingLegion) &&
            (identical(other.defendingLegion, defendingLegion) ||
                other.defendingLegion == defendingLegion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attackerExpectedHits,
      defenderExpectedHits, attackingLegion, defendingLegion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleStatisticImplCopyWith<_$BattleStatisticImpl> get copyWith =>
      __$$BattleStatisticImplCopyWithImpl<_$BattleStatisticImpl>(
          this, _$identity);
}

abstract class _BattleStatistic implements BattleResult {
  const factory _BattleStatistic(
      {required final double attackerExpectedHits,
      required final double defenderExpectedHits,
      required final AttackingLegion attackingLegion,
      required final DefendingLegion defendingLegion}) = _$BattleStatisticImpl;

  @override
  double get attackerExpectedHits;
  @override
  double get defenderExpectedHits;
  @override
  AttackingLegion get attackingLegion;
  @override
  DefendingLegion get defendingLegion;
  @override
  @JsonKey(ignore: true)
  _$$BattleStatisticImplCopyWith<_$BattleStatisticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
