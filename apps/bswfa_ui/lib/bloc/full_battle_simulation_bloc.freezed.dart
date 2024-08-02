// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_battle_simulation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FullBattleSimulationEvent {
  BattleScenario get battleScenario => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BattleScenario battleScenario) simulateFullBattle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BattleScenario battleScenario)? simulateFullBattle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BattleScenario battleScenario)? simulateFullBattle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimulateFullBattle value) simulateFullBattle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimulateFullBattle value)? simulateFullBattle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimulateFullBattle value)? simulateFullBattle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FullBattleSimulationEventCopyWith<FullBattleSimulationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullBattleSimulationEventCopyWith<$Res> {
  factory $FullBattleSimulationEventCopyWith(FullBattleSimulationEvent value,
          $Res Function(FullBattleSimulationEvent) then) =
      _$FullBattleSimulationEventCopyWithImpl<$Res, FullBattleSimulationEvent>;
  @useResult
  $Res call({BattleScenario battleScenario});

  $BattleScenarioCopyWith<$Res> get battleScenario;
}

/// @nodoc
class _$FullBattleSimulationEventCopyWithImpl<$Res,
        $Val extends FullBattleSimulationEvent>
    implements $FullBattleSimulationEventCopyWith<$Res> {
  _$FullBattleSimulationEventCopyWithImpl(this._value, this._then);

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
abstract class _$$SimulateFullBattleImplCopyWith<$Res>
    implements $FullBattleSimulationEventCopyWith<$Res> {
  factory _$$SimulateFullBattleImplCopyWith(_$SimulateFullBattleImpl value,
          $Res Function(_$SimulateFullBattleImpl) then) =
      __$$SimulateFullBattleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BattleScenario battleScenario});

  @override
  $BattleScenarioCopyWith<$Res> get battleScenario;
}

/// @nodoc
class __$$SimulateFullBattleImplCopyWithImpl<$Res>
    extends _$FullBattleSimulationEventCopyWithImpl<$Res,
        _$SimulateFullBattleImpl>
    implements _$$SimulateFullBattleImplCopyWith<$Res> {
  __$$SimulateFullBattleImplCopyWithImpl(_$SimulateFullBattleImpl _value,
      $Res Function(_$SimulateFullBattleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleScenario = null,
  }) {
    return _then(_$SimulateFullBattleImpl(
      null == battleScenario
          ? _value.battleScenario
          : battleScenario // ignore: cast_nullable_to_non_nullable
              as BattleScenario,
    ));
  }
}

/// @nodoc

class _$SimulateFullBattleImpl implements _SimulateFullBattle {
  _$SimulateFullBattleImpl(this.battleScenario);

  @override
  final BattleScenario battleScenario;

  @override
  String toString() {
    return 'FullBattleSimulationEvent.simulateFullBattle(battleScenario: $battleScenario)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimulateFullBattleImpl &&
            (identical(other.battleScenario, battleScenario) ||
                other.battleScenario == battleScenario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, battleScenario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimulateFullBattleImplCopyWith<_$SimulateFullBattleImpl> get copyWith =>
      __$$SimulateFullBattleImplCopyWithImpl<_$SimulateFullBattleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BattleScenario battleScenario) simulateFullBattle,
  }) {
    return simulateFullBattle(battleScenario);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BattleScenario battleScenario)? simulateFullBattle,
  }) {
    return simulateFullBattle?.call(battleScenario);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BattleScenario battleScenario)? simulateFullBattle,
    required TResult orElse(),
  }) {
    if (simulateFullBattle != null) {
      return simulateFullBattle(battleScenario);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimulateFullBattle value) simulateFullBattle,
  }) {
    return simulateFullBattle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimulateFullBattle value)? simulateFullBattle,
  }) {
    return simulateFullBattle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimulateFullBattle value)? simulateFullBattle,
    required TResult orElse(),
  }) {
    if (simulateFullBattle != null) {
      return simulateFullBattle(this);
    }
    return orElse();
  }
}

abstract class _SimulateFullBattle implements FullBattleSimulationEvent {
  factory _SimulateFullBattle(final BattleScenario battleScenario) =
      _$SimulateFullBattleImpl;

  @override
  BattleScenario get battleScenario;
  @override
  @JsonKey(ignore: true)
  _$$SimulateFullBattleImplCopyWith<_$SimulateFullBattleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FullBattleSimulationState {
  BattleResult get battleResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FullBattleSimulationStateCopyWith<FullBattleSimulationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullBattleSimulationStateCopyWith<$Res> {
  factory $FullBattleSimulationStateCopyWith(FullBattleSimulationState value,
          $Res Function(FullBattleSimulationState) then) =
      _$FullBattleSimulationStateCopyWithImpl<$Res, FullBattleSimulationState>;
  @useResult
  $Res call({BattleResult battleResult});

  $BattleResultCopyWith<$Res> get battleResult;
}

/// @nodoc
class _$FullBattleSimulationStateCopyWithImpl<$Res,
        $Val extends FullBattleSimulationState>
    implements $FullBattleSimulationStateCopyWith<$Res> {
  _$FullBattleSimulationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleResult = null,
  }) {
    return _then(_value.copyWith(
      battleResult: null == battleResult
          ? _value.battleResult
          : battleResult // ignore: cast_nullable_to_non_nullable
              as BattleResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BattleResultCopyWith<$Res> get battleResult {
    return $BattleResultCopyWith<$Res>(_value.battleResult, (value) {
      return _then(_value.copyWith(battleResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FullBattleSimulationStateImplCopyWith<$Res>
    implements $FullBattleSimulationStateCopyWith<$Res> {
  factory _$$FullBattleSimulationStateImplCopyWith(
          _$FullBattleSimulationStateImpl value,
          $Res Function(_$FullBattleSimulationStateImpl) then) =
      __$$FullBattleSimulationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BattleResult battleResult});

  @override
  $BattleResultCopyWith<$Res> get battleResult;
}

/// @nodoc
class __$$FullBattleSimulationStateImplCopyWithImpl<$Res>
    extends _$FullBattleSimulationStateCopyWithImpl<$Res,
        _$FullBattleSimulationStateImpl>
    implements _$$FullBattleSimulationStateImplCopyWith<$Res> {
  __$$FullBattleSimulationStateImplCopyWithImpl(
      _$FullBattleSimulationStateImpl _value,
      $Res Function(_$FullBattleSimulationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleResult = null,
  }) {
    return _then(_$FullBattleSimulationStateImpl(
      battleResult: null == battleResult
          ? _value.battleResult
          : battleResult // ignore: cast_nullable_to_non_nullable
              as BattleResult,
    ));
  }
}

/// @nodoc

class _$FullBattleSimulationStateImpl implements _FullBattleSimulationState {
  const _$FullBattleSimulationStateImpl({required this.battleResult});

  @override
  final BattleResult battleResult;

  @override
  String toString() {
    return 'FullBattleSimulationState(battleResult: $battleResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullBattleSimulationStateImpl &&
            (identical(other.battleResult, battleResult) ||
                other.battleResult == battleResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, battleResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FullBattleSimulationStateImplCopyWith<_$FullBattleSimulationStateImpl>
      get copyWith => __$$FullBattleSimulationStateImplCopyWithImpl<
          _$FullBattleSimulationStateImpl>(this, _$identity);
}

abstract class _FullBattleSimulationState implements FullBattleSimulationState {
  const factory _FullBattleSimulationState(
          {required final BattleResult battleResult}) =
      _$FullBattleSimulationStateImpl;

  @override
  BattleResult get battleResult;
  @override
  @JsonKey(ignore: true)
  _$$FullBattleSimulationStateImplCopyWith<_$FullBattleSimulationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
