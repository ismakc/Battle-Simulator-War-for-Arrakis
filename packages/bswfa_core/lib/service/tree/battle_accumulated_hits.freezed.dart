// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_accumulated_hits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BattleAccumulatedHits {
  int get attackerHits => throw _privateConstructorUsedError;
  int get squaredAttackerHits => throw _privateConstructorUsedError;
  int get defenderHits => throw _privateConstructorUsedError;
  int get squaredDefenderHits => throw _privateConstructorUsedError;

  /// Create a copy of BattleAccumulatedHits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BattleAccumulatedHitsCopyWith<BattleAccumulatedHits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleAccumulatedHitsCopyWith<$Res> {
  factory $BattleAccumulatedHitsCopyWith(BattleAccumulatedHits value,
          $Res Function(BattleAccumulatedHits) then) =
      _$BattleAccumulatedHitsCopyWithImpl<$Res, BattleAccumulatedHits>;
  @useResult
  $Res call(
      {int attackerHits,
      int squaredAttackerHits,
      int defenderHits,
      int squaredDefenderHits});
}

/// @nodoc
class _$BattleAccumulatedHitsCopyWithImpl<$Res,
        $Val extends BattleAccumulatedHits>
    implements $BattleAccumulatedHitsCopyWith<$Res> {
  _$BattleAccumulatedHitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BattleAccumulatedHits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attackerHits = null,
    Object? squaredAttackerHits = null,
    Object? defenderHits = null,
    Object? squaredDefenderHits = null,
  }) {
    return _then(_value.copyWith(
      attackerHits: null == attackerHits
          ? _value.attackerHits
          : attackerHits // ignore: cast_nullable_to_non_nullable
              as int,
      squaredAttackerHits: null == squaredAttackerHits
          ? _value.squaredAttackerHits
          : squaredAttackerHits // ignore: cast_nullable_to_non_nullable
              as int,
      defenderHits: null == defenderHits
          ? _value.defenderHits
          : defenderHits // ignore: cast_nullable_to_non_nullable
              as int,
      squaredDefenderHits: null == squaredDefenderHits
          ? _value.squaredDefenderHits
          : squaredDefenderHits // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccumulatedHitsImplCopyWith<$Res>
    implements $BattleAccumulatedHitsCopyWith<$Res> {
  factory _$$AccumulatedHitsImplCopyWith(_$AccumulatedHitsImpl value,
          $Res Function(_$AccumulatedHitsImpl) then) =
      __$$AccumulatedHitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int attackerHits,
      int squaredAttackerHits,
      int defenderHits,
      int squaredDefenderHits});
}

/// @nodoc
class __$$AccumulatedHitsImplCopyWithImpl<$Res>
    extends _$BattleAccumulatedHitsCopyWithImpl<$Res, _$AccumulatedHitsImpl>
    implements _$$AccumulatedHitsImplCopyWith<$Res> {
  __$$AccumulatedHitsImplCopyWithImpl(
      _$AccumulatedHitsImpl _value, $Res Function(_$AccumulatedHitsImpl) _then)
      : super(_value, _then);

  /// Create a copy of BattleAccumulatedHits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attackerHits = null,
    Object? squaredAttackerHits = null,
    Object? defenderHits = null,
    Object? squaredDefenderHits = null,
  }) {
    return _then(_$AccumulatedHitsImpl(
      attackerHits: null == attackerHits
          ? _value.attackerHits
          : attackerHits // ignore: cast_nullable_to_non_nullable
              as int,
      squaredAttackerHits: null == squaredAttackerHits
          ? _value.squaredAttackerHits
          : squaredAttackerHits // ignore: cast_nullable_to_non_nullable
              as int,
      defenderHits: null == defenderHits
          ? _value.defenderHits
          : defenderHits // ignore: cast_nullable_to_non_nullable
              as int,
      squaredDefenderHits: null == squaredDefenderHits
          ? _value.squaredDefenderHits
          : squaredDefenderHits // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AccumulatedHitsImpl extends _AccumulatedHits {
  const _$AccumulatedHitsImpl(
      {required this.attackerHits,
      required this.squaredAttackerHits,
      required this.defenderHits,
      required this.squaredDefenderHits})
      : super._();

  @override
  final int attackerHits;
  @override
  final int squaredAttackerHits;
  @override
  final int defenderHits;
  @override
  final int squaredDefenderHits;

  @override
  String toString() {
    return 'BattleAccumulatedHits(attackerHits: $attackerHits, squaredAttackerHits: $squaredAttackerHits, defenderHits: $defenderHits, squaredDefenderHits: $squaredDefenderHits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccumulatedHitsImpl &&
            (identical(other.attackerHits, attackerHits) ||
                other.attackerHits == attackerHits) &&
            (identical(other.squaredAttackerHits, squaredAttackerHits) ||
                other.squaredAttackerHits == squaredAttackerHits) &&
            (identical(other.defenderHits, defenderHits) ||
                other.defenderHits == defenderHits) &&
            (identical(other.squaredDefenderHits, squaredDefenderHits) ||
                other.squaredDefenderHits == squaredDefenderHits));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attackerHits,
      squaredAttackerHits, defenderHits, squaredDefenderHits);

  /// Create a copy of BattleAccumulatedHits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccumulatedHitsImplCopyWith<_$AccumulatedHitsImpl> get copyWith =>
      __$$AccumulatedHitsImplCopyWithImpl<_$AccumulatedHitsImpl>(
          this, _$identity);
}

abstract class _AccumulatedHits extends BattleAccumulatedHits {
  const factory _AccumulatedHits(
      {required final int attackerHits,
      required final int squaredAttackerHits,
      required final int defenderHits,
      required final int squaredDefenderHits}) = _$AccumulatedHitsImpl;
  const _AccumulatedHits._() : super._();

  @override
  int get attackerHits;
  @override
  int get squaredAttackerHits;
  @override
  int get defenderHits;
  @override
  int get squaredDefenderHits;

  /// Create a copy of BattleAccumulatedHits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccumulatedHitsImplCopyWith<_$AccumulatedHitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
