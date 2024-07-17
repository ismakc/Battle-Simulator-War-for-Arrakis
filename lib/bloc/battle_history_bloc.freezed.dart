// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BattleHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BattleScenario battleScenario) simulateBattle,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BattleScenario battleScenario)? simulateBattle,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BattleScenario battleScenario)? simulateBattle,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimulateBattle value) simulateBattle,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimulateBattle value)? simulateBattle,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimulateBattle value)? simulateBattle,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleHistoryEventCopyWith<$Res> {
  factory $BattleHistoryEventCopyWith(
          BattleHistoryEvent value, $Res Function(BattleHistoryEvent) then) =
      _$BattleHistoryEventCopyWithImpl<$Res, BattleHistoryEvent>;
}

/// @nodoc
class _$BattleHistoryEventCopyWithImpl<$Res, $Val extends BattleHistoryEvent>
    implements $BattleHistoryEventCopyWith<$Res> {
  _$BattleHistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SimulateBattleImplCopyWith<$Res> {
  factory _$$SimulateBattleImplCopyWith(_$SimulateBattleImpl value,
          $Res Function(_$SimulateBattleImpl) then) =
      __$$SimulateBattleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BattleScenario battleScenario});

  $BattleScenarioCopyWith<$Res> get battleScenario;
}

/// @nodoc
class __$$SimulateBattleImplCopyWithImpl<$Res>
    extends _$BattleHistoryEventCopyWithImpl<$Res, _$SimulateBattleImpl>
    implements _$$SimulateBattleImplCopyWith<$Res> {
  __$$SimulateBattleImplCopyWithImpl(
      _$SimulateBattleImpl _value, $Res Function(_$SimulateBattleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleScenario = null,
  }) {
    return _then(_$SimulateBattleImpl(
      null == battleScenario
          ? _value.battleScenario
          : battleScenario // ignore: cast_nullable_to_non_nullable
              as BattleScenario,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BattleScenarioCopyWith<$Res> get battleScenario {
    return $BattleScenarioCopyWith<$Res>(_value.battleScenario, (value) {
      return _then(_value.copyWith(battleScenario: value));
    });
  }
}

/// @nodoc

class _$SimulateBattleImpl implements _SimulateBattle {
  _$SimulateBattleImpl(this.battleScenario);

  @override
  final BattleScenario battleScenario;

  @override
  String toString() {
    return 'BattleHistoryEvent.simulateBattle(battleScenario: $battleScenario)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimulateBattleImpl &&
            (identical(other.battleScenario, battleScenario) ||
                other.battleScenario == battleScenario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, battleScenario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimulateBattleImplCopyWith<_$SimulateBattleImpl> get copyWith =>
      __$$SimulateBattleImplCopyWithImpl<_$SimulateBattleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BattleScenario battleScenario) simulateBattle,
    required TResult Function() reset,
  }) {
    return simulateBattle(battleScenario);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BattleScenario battleScenario)? simulateBattle,
    TResult? Function()? reset,
  }) {
    return simulateBattle?.call(battleScenario);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BattleScenario battleScenario)? simulateBattle,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (simulateBattle != null) {
      return simulateBattle(battleScenario);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SimulateBattle value) simulateBattle,
    required TResult Function(_Reset value) reset,
  }) {
    return simulateBattle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimulateBattle value)? simulateBattle,
    TResult? Function(_Reset value)? reset,
  }) {
    return simulateBattle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimulateBattle value)? simulateBattle,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (simulateBattle != null) {
      return simulateBattle(this);
    }
    return orElse();
  }
}

abstract class _SimulateBattle implements BattleHistoryEvent {
  factory _SimulateBattle(final BattleScenario battleScenario) =
      _$SimulateBattleImpl;

  BattleScenario get battleScenario;
  @JsonKey(ignore: true)
  _$$SimulateBattleImplCopyWith<_$SimulateBattleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$BattleHistoryEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'BattleHistoryEvent.reset()';
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
    required TResult Function(BattleScenario battleScenario) simulateBattle,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BattleScenario battleScenario)? simulateBattle,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BattleScenario battleScenario)? simulateBattle,
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
    required TResult Function(_SimulateBattle value) simulateBattle,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SimulateBattle value)? simulateBattle,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SimulateBattle value)? simulateBattle,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements BattleHistoryEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$BattleHistoryState {
  List<BattleResult> get battleHistory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BattleHistoryStateCopyWith<BattleHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BattleHistoryStateCopyWith<$Res> {
  factory $BattleHistoryStateCopyWith(
          BattleHistoryState value, $Res Function(BattleHistoryState) then) =
      _$BattleHistoryStateCopyWithImpl<$Res, BattleHistoryState>;
  @useResult
  $Res call({List<BattleResult> battleHistory});
}

/// @nodoc
class _$BattleHistoryStateCopyWithImpl<$Res, $Val extends BattleHistoryState>
    implements $BattleHistoryStateCopyWith<$Res> {
  _$BattleHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleHistory = null,
  }) {
    return _then(_value.copyWith(
      battleHistory: null == battleHistory
          ? _value.battleHistory
          : battleHistory // ignore: cast_nullable_to_non_nullable
              as List<BattleResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BattleHistoryStateImplCopyWith<$Res>
    implements $BattleHistoryStateCopyWith<$Res> {
  factory _$$BattleHistoryStateImplCopyWith(_$BattleHistoryStateImpl value,
          $Res Function(_$BattleHistoryStateImpl) then) =
      __$$BattleHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BattleResult> battleHistory});
}

/// @nodoc
class __$$BattleHistoryStateImplCopyWithImpl<$Res>
    extends _$BattleHistoryStateCopyWithImpl<$Res, _$BattleHistoryStateImpl>
    implements _$$BattleHistoryStateImplCopyWith<$Res> {
  __$$BattleHistoryStateImplCopyWithImpl(_$BattleHistoryStateImpl _value,
      $Res Function(_$BattleHistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? battleHistory = null,
  }) {
    return _then(_$BattleHistoryStateImpl(
      battleHistory: null == battleHistory
          ? _value._battleHistory
          : battleHistory // ignore: cast_nullable_to_non_nullable
              as List<BattleResult>,
    ));
  }
}

/// @nodoc

class _$BattleHistoryStateImpl implements _BattleHistoryState {
  const _$BattleHistoryStateImpl(
      {required final List<BattleResult> battleHistory})
      : _battleHistory = battleHistory;

  final List<BattleResult> _battleHistory;
  @override
  List<BattleResult> get battleHistory {
    if (_battleHistory is EqualUnmodifiableListView) return _battleHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_battleHistory);
  }

  @override
  String toString() {
    return 'BattleHistoryState(battleHistory: $battleHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BattleHistoryStateImpl &&
            const DeepCollectionEquality()
                .equals(other._battleHistory, _battleHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_battleHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BattleHistoryStateImplCopyWith<_$BattleHistoryStateImpl> get copyWith =>
      __$$BattleHistoryStateImplCopyWithImpl<_$BattleHistoryStateImpl>(
          this, _$identity);
}

abstract class _BattleHistoryState implements BattleHistoryState {
  const factory _BattleHistoryState(
          {required final List<BattleResult> battleHistory}) =
      _$BattleHistoryStateImpl;

  @override
  List<BattleResult> get battleHistory;
  @override
  @JsonKey(ignore: true)
  _$$BattleHistoryStateImplCopyWith<_$BattleHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
