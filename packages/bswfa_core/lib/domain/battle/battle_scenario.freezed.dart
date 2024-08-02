// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_scenario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BattleScenario {
  AttackingLegion get attackingLegion => throw _privateConstructorUsedError;
  DefendingLegion get defendingLegion => throw _privateConstructorUsedError;

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BattleScenarioCopyWith<BattleScenario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleScenarioCopyWith<$Res> {
  factory $BattleScenarioCopyWith(
          BattleScenario value, $Res Function(BattleScenario) then) =
      _$BattleScenarioCopyWithImpl<$Res, BattleScenario>;
  @useResult
  $Res call({AttackingLegion attackingLegion, DefendingLegion defendingLegion});

  $AttackingLegionCopyWith<$Res> get attackingLegion;
  $DefendingLegionCopyWith<$Res> get defendingLegion;
}

/// @nodoc
class _$BattleScenarioCopyWithImpl<$Res, $Val extends BattleScenario>
    implements $BattleScenarioCopyWith<$Res> {
  _$BattleScenarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attackingLegion = null,
    Object? defendingLegion = null,
  }) {
    return _then(_value.copyWith(
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

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttackingLegionCopyWith<$Res> get attackingLegion {
    return $AttackingLegionCopyWith<$Res>(_value.attackingLegion, (value) {
      return _then(_value.copyWith(attackingLegion: value) as $Val);
    });
  }

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DefendingLegionCopyWith<$Res> get defendingLegion {
    return $DefendingLegionCopyWith<$Res>(_value.defendingLegion, (value) {
      return _then(_value.copyWith(defendingLegion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BattleScenarioImplCopyWith<$Res>
    implements $BattleScenarioCopyWith<$Res> {
  factory _$$BattleScenarioImplCopyWith(_$BattleScenarioImpl value,
          $Res Function(_$BattleScenarioImpl) then) =
      __$$BattleScenarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AttackingLegion attackingLegion, DefendingLegion defendingLegion});

  @override
  $AttackingLegionCopyWith<$Res> get attackingLegion;
  @override
  $DefendingLegionCopyWith<$Res> get defendingLegion;
}

/// @nodoc
class __$$BattleScenarioImplCopyWithImpl<$Res>
    extends _$BattleScenarioCopyWithImpl<$Res, _$BattleScenarioImpl>
    implements _$$BattleScenarioImplCopyWith<$Res> {
  __$$BattleScenarioImplCopyWithImpl(
      _$BattleScenarioImpl _value, $Res Function(_$BattleScenarioImpl) _then)
      : super(_value, _then);

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attackingLegion = null,
    Object? defendingLegion = null,
  }) {
    return _then(_$BattleScenarioImpl(
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

class _$BattleScenarioImpl implements _BattleScenario {
  const _$BattleScenarioImpl(
      {required this.attackingLegion, required this.defendingLegion});

  @override
  final AttackingLegion attackingLegion;
  @override
  final DefendingLegion defendingLegion;

  @override
  String toString() {
    return 'BattleScenario(attackingLegion: $attackingLegion, defendingLegion: $defendingLegion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleScenarioImpl &&
            (identical(other.attackingLegion, attackingLegion) ||
                other.attackingLegion == attackingLegion) &&
            (identical(other.defendingLegion, defendingLegion) ||
                other.defendingLegion == defendingLegion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, attackingLegion, defendingLegion);

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleScenarioImplCopyWith<_$BattleScenarioImpl> get copyWith =>
      __$$BattleScenarioImplCopyWithImpl<_$BattleScenarioImpl>(
          this, _$identity);
}

abstract class _BattleScenario implements BattleScenario {
  const factory _BattleScenario(
      {required final AttackingLegion attackingLegion,
      required final DefendingLegion defendingLegion}) = _$BattleScenarioImpl;

  @override
  AttackingLegion get attackingLegion;
  @override
  DefendingLegion get defendingLegion;

  /// Create a copy of BattleScenario
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BattleScenarioImplCopyWith<_$BattleScenarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
