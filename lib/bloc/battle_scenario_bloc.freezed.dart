// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_scenario_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BattleScenarioEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AttackingLegion attackingLegion)
        updateAttackingLegion,
    required TResult Function(DefendingLegion defendingLegion)
        updateDefendingLegion,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AttackingLegion attackingLegion)? updateAttackingLegion,
    TResult? Function(DefendingLegion defendingLegion)? updateDefendingLegion,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AttackingLegion attackingLegion)? updateAttackingLegion,
    TResult Function(DefendingLegion defendingLegion)? updateDefendingLegion,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateAttackingLegion value)
        updateAttackingLegion,
    required TResult Function(_UpdateDefendingLegion value)
        updateDefendingLegion,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateAttackingLegion value)? updateAttackingLegion,
    TResult? Function(_UpdateDefendingLegion value)? updateDefendingLegion,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateAttackingLegion value)? updateAttackingLegion,
    TResult Function(_UpdateDefendingLegion value)? updateDefendingLegion,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleScenarioEventCopyWith<$Res> {
  factory $BattleScenarioEventCopyWith(
          BattleScenarioEvent value, $Res Function(BattleScenarioEvent) then) =
      _$BattleScenarioEventCopyWithImpl<$Res, BattleScenarioEvent>;
}

/// @nodoc
class _$BattleScenarioEventCopyWithImpl<$Res, $Val extends BattleScenarioEvent>
    implements $BattleScenarioEventCopyWith<$Res> {
  _$BattleScenarioEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateAttackingLegionImplCopyWith<$Res> {
  factory _$$UpdateAttackingLegionImplCopyWith(
          _$UpdateAttackingLegionImpl value,
          $Res Function(_$UpdateAttackingLegionImpl) then) =
      __$$UpdateAttackingLegionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AttackingLegion attackingLegion});

  $AttackingLegionCopyWith<$Res> get attackingLegion;
}

/// @nodoc
class __$$UpdateAttackingLegionImplCopyWithImpl<$Res>
    extends _$BattleScenarioEventCopyWithImpl<$Res, _$UpdateAttackingLegionImpl>
    implements _$$UpdateAttackingLegionImplCopyWith<$Res> {
  __$$UpdateAttackingLegionImplCopyWithImpl(_$UpdateAttackingLegionImpl _value,
      $Res Function(_$UpdateAttackingLegionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attackingLegion = null,
  }) {
    return _then(_$UpdateAttackingLegionImpl(
      null == attackingLegion
          ? _value.attackingLegion
          : attackingLegion // ignore: cast_nullable_to_non_nullable
              as AttackingLegion,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AttackingLegionCopyWith<$Res> get attackingLegion {
    return $AttackingLegionCopyWith<$Res>(_value.attackingLegion, (value) {
      return _then(_value.copyWith(attackingLegion: value));
    });
  }
}

/// @nodoc

class _$UpdateAttackingLegionImpl implements _UpdateAttackingLegion {
  const _$UpdateAttackingLegionImpl(this.attackingLegion);

  @override
  final AttackingLegion attackingLegion;

  @override
  String toString() {
    return 'BattleScenarioEvent.updateAttackingLegion(attackingLegion: $attackingLegion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAttackingLegionImpl &&
            (identical(other.attackingLegion, attackingLegion) ||
                other.attackingLegion == attackingLegion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attackingLegion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAttackingLegionImplCopyWith<_$UpdateAttackingLegionImpl>
      get copyWith => __$$UpdateAttackingLegionImplCopyWithImpl<
          _$UpdateAttackingLegionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AttackingLegion attackingLegion)
        updateAttackingLegion,
    required TResult Function(DefendingLegion defendingLegion)
        updateDefendingLegion,
    required TResult Function() reset,
  }) {
    return updateAttackingLegion(attackingLegion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AttackingLegion attackingLegion)? updateAttackingLegion,
    TResult? Function(DefendingLegion defendingLegion)? updateDefendingLegion,
    TResult? Function()? reset,
  }) {
    return updateAttackingLegion?.call(attackingLegion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AttackingLegion attackingLegion)? updateAttackingLegion,
    TResult Function(DefendingLegion defendingLegion)? updateDefendingLegion,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (updateAttackingLegion != null) {
      return updateAttackingLegion(attackingLegion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateAttackingLegion value)
        updateAttackingLegion,
    required TResult Function(_UpdateDefendingLegion value)
        updateDefendingLegion,
    required TResult Function(_Reset value) reset,
  }) {
    return updateAttackingLegion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateAttackingLegion value)? updateAttackingLegion,
    TResult? Function(_UpdateDefendingLegion value)? updateDefendingLegion,
    TResult? Function(_Reset value)? reset,
  }) {
    return updateAttackingLegion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateAttackingLegion value)? updateAttackingLegion,
    TResult Function(_UpdateDefendingLegion value)? updateDefendingLegion,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (updateAttackingLegion != null) {
      return updateAttackingLegion(this);
    }
    return orElse();
  }
}

abstract class _UpdateAttackingLegion implements BattleScenarioEvent {
  const factory _UpdateAttackingLegion(final AttackingLegion attackingLegion) =
      _$UpdateAttackingLegionImpl;

  AttackingLegion get attackingLegion;
  @JsonKey(ignore: true)
  _$$UpdateAttackingLegionImplCopyWith<_$UpdateAttackingLegionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDefendingLegionImplCopyWith<$Res> {
  factory _$$UpdateDefendingLegionImplCopyWith(
          _$UpdateDefendingLegionImpl value,
          $Res Function(_$UpdateDefendingLegionImpl) then) =
      __$$UpdateDefendingLegionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DefendingLegion defendingLegion});

  $DefendingLegionCopyWith<$Res> get defendingLegion;
}

/// @nodoc
class __$$UpdateDefendingLegionImplCopyWithImpl<$Res>
    extends _$BattleScenarioEventCopyWithImpl<$Res, _$UpdateDefendingLegionImpl>
    implements _$$UpdateDefendingLegionImplCopyWith<$Res> {
  __$$UpdateDefendingLegionImplCopyWithImpl(_$UpdateDefendingLegionImpl _value,
      $Res Function(_$UpdateDefendingLegionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defendingLegion = null,
  }) {
    return _then(_$UpdateDefendingLegionImpl(
      null == defendingLegion
          ? _value.defendingLegion
          : defendingLegion // ignore: cast_nullable_to_non_nullable
              as DefendingLegion,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DefendingLegionCopyWith<$Res> get defendingLegion {
    return $DefendingLegionCopyWith<$Res>(_value.defendingLegion, (value) {
      return _then(_value.copyWith(defendingLegion: value));
    });
  }
}

/// @nodoc

class _$UpdateDefendingLegionImpl implements _UpdateDefendingLegion {
  const _$UpdateDefendingLegionImpl(this.defendingLegion);

  @override
  final DefendingLegion defendingLegion;

  @override
  String toString() {
    return 'BattleScenarioEvent.updateDefendingLegion(defendingLegion: $defendingLegion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDefendingLegionImpl &&
            (identical(other.defendingLegion, defendingLegion) ||
                other.defendingLegion == defendingLegion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, defendingLegion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDefendingLegionImplCopyWith<_$UpdateDefendingLegionImpl>
      get copyWith => __$$UpdateDefendingLegionImplCopyWithImpl<
          _$UpdateDefendingLegionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AttackingLegion attackingLegion)
        updateAttackingLegion,
    required TResult Function(DefendingLegion defendingLegion)
        updateDefendingLegion,
    required TResult Function() reset,
  }) {
    return updateDefendingLegion(defendingLegion);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AttackingLegion attackingLegion)? updateAttackingLegion,
    TResult? Function(DefendingLegion defendingLegion)? updateDefendingLegion,
    TResult? Function()? reset,
  }) {
    return updateDefendingLegion?.call(defendingLegion);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AttackingLegion attackingLegion)? updateAttackingLegion,
    TResult Function(DefendingLegion defendingLegion)? updateDefendingLegion,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (updateDefendingLegion != null) {
      return updateDefendingLegion(defendingLegion);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateAttackingLegion value)
        updateAttackingLegion,
    required TResult Function(_UpdateDefendingLegion value)
        updateDefendingLegion,
    required TResult Function(_Reset value) reset,
  }) {
    return updateDefendingLegion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateAttackingLegion value)? updateAttackingLegion,
    TResult? Function(_UpdateDefendingLegion value)? updateDefendingLegion,
    TResult? Function(_Reset value)? reset,
  }) {
    return updateDefendingLegion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateAttackingLegion value)? updateAttackingLegion,
    TResult Function(_UpdateDefendingLegion value)? updateDefendingLegion,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (updateDefendingLegion != null) {
      return updateDefendingLegion(this);
    }
    return orElse();
  }
}

abstract class _UpdateDefendingLegion implements BattleScenarioEvent {
  const factory _UpdateDefendingLegion(final DefendingLegion defendingLegion) =
      _$UpdateDefendingLegionImpl;

  DefendingLegion get defendingLegion;
  @JsonKey(ignore: true)
  _$$UpdateDefendingLegionImplCopyWith<_$UpdateDefendingLegionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$BattleScenarioEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'BattleScenarioEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AttackingLegion attackingLegion)
        updateAttackingLegion,
    required TResult Function(DefendingLegion defendingLegion)
        updateDefendingLegion,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AttackingLegion attackingLegion)? updateAttackingLegion,
    TResult? Function(DefendingLegion defendingLegion)? updateDefendingLegion,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AttackingLegion attackingLegion)? updateAttackingLegion,
    TResult Function(DefendingLegion defendingLegion)? updateDefendingLegion,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateAttackingLegion value)
        updateAttackingLegion,
    required TResult Function(_UpdateDefendingLegion value)
        updateDefendingLegion,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateAttackingLegion value)? updateAttackingLegion,
    TResult? Function(_UpdateDefendingLegion value)? updateDefendingLegion,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateAttackingLegion value)? updateAttackingLegion,
    TResult Function(_UpdateDefendingLegion value)? updateDefendingLegion,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements BattleScenarioEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$BattleScenarioState {
  BattleScenario get battleScenario => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BattleScenarioStateCopyWith<BattleScenarioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleScenarioStateCopyWith<$Res> {
  factory $BattleScenarioStateCopyWith(
          BattleScenarioState value, $Res Function(BattleScenarioState) then) =
      _$BattleScenarioStateCopyWithImpl<$Res, BattleScenarioState>;
  @useResult
  $Res call({BattleScenario battleScenario});

  $BattleScenarioCopyWith<$Res> get battleScenario;
}

/// @nodoc
class _$BattleScenarioStateCopyWithImpl<$Res, $Val extends BattleScenarioState>
    implements $BattleScenarioStateCopyWith<$Res> {
  _$BattleScenarioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleScenario = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$BattleScenarioStateImplCopyWith<$Res>
    implements $BattleScenarioStateCopyWith<$Res> {
  factory _$$BattleScenarioStateImplCopyWith(_$BattleScenarioStateImpl value,
          $Res Function(_$BattleScenarioStateImpl) then) =
      __$$BattleScenarioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BattleScenario battleScenario});

  @override
  $BattleScenarioCopyWith<$Res> get battleScenario;
}

/// @nodoc
class __$$BattleScenarioStateImplCopyWithImpl<$Res>
    extends _$BattleScenarioStateCopyWithImpl<$Res, _$BattleScenarioStateImpl>
    implements _$$BattleScenarioStateImplCopyWith<$Res> {
  __$$BattleScenarioStateImplCopyWithImpl(_$BattleScenarioStateImpl _value,
      $Res Function(_$BattleScenarioStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleScenario = null,
  }) {
    return _then(_$BattleScenarioStateImpl(
      battleScenario: null == battleScenario
          ? _value.battleScenario
          : battleScenario // ignore: cast_nullable_to_non_nullable
              as BattleScenario,
    ));
  }
}

/// @nodoc

class _$BattleScenarioStateImpl implements _BattleScenarioState {
  const _$BattleScenarioStateImpl({required this.battleScenario});

  @override
  final BattleScenario battleScenario;

  @override
  String toString() {
    return 'BattleScenarioState(battleScenario: $battleScenario)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleScenarioStateImpl &&
            (identical(other.battleScenario, battleScenario) ||
                other.battleScenario == battleScenario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, battleScenario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleScenarioStateImplCopyWith<_$BattleScenarioStateImpl> get copyWith =>
      __$$BattleScenarioStateImplCopyWithImpl<_$BattleScenarioStateImpl>(
          this, _$identity);
}

abstract class _BattleScenarioState implements BattleScenarioState {
  const factory _BattleScenarioState(
          {required final BattleScenario battleScenario}) =
      _$BattleScenarioStateImpl;

  @override
  BattleScenario get battleScenario;
  @override
  @JsonKey(ignore: true)
  _$$BattleScenarioStateImplCopyWith<_$BattleScenarioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
