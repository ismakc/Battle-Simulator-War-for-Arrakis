// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_battle_simulation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FullBattleSimulationEvent {

 BattleScenario get battleScenario;
/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullBattleSimulationEventCopyWith<FullBattleSimulationEvent> get copyWith => _$FullBattleSimulationEventCopyWithImpl<FullBattleSimulationEvent>(this as FullBattleSimulationEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullBattleSimulationEvent&&(identical(other.battleScenario, battleScenario) || other.battleScenario == battleScenario));
}


@override
int get hashCode => Object.hash(runtimeType,battleScenario);

@override
String toString() {
  return 'FullBattleSimulationEvent(battleScenario: $battleScenario)';
}


}

/// @nodoc
abstract mixin class $FullBattleSimulationEventCopyWith<$Res>  {
  factory $FullBattleSimulationEventCopyWith(FullBattleSimulationEvent value, $Res Function(FullBattleSimulationEvent) _then) = _$FullBattleSimulationEventCopyWithImpl;
@useResult
$Res call({
 BattleScenario battleScenario
});


$BattleScenarioCopyWith<$Res> get battleScenario;

}
/// @nodoc
class _$FullBattleSimulationEventCopyWithImpl<$Res>
    implements $FullBattleSimulationEventCopyWith<$Res> {
  _$FullBattleSimulationEventCopyWithImpl(this._self, this._then);

  final FullBattleSimulationEvent _self;
  final $Res Function(FullBattleSimulationEvent) _then;

/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? battleScenario = null,}) {
  return _then(_self.copyWith(
battleScenario: null == battleScenario ? _self.battleScenario : battleScenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,
  ));
}
/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleScenarioCopyWith<$Res> get battleScenario {
  
  return $BattleScenarioCopyWith<$Res>(_self.battleScenario, (value) {
    return _then(_self.copyWith(battleScenario: value));
  });
}
}


/// Adds pattern-matching-related methods to [FullBattleSimulationEvent].
extension FullBattleSimulationEventPatterns on FullBattleSimulationEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SimulateFullBattle value)?  simulateFullBattle,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimulateFullBattle() when simulateFullBattle != null:
return simulateFullBattle(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SimulateFullBattle value)  simulateFullBattle,}){
final _that = this;
switch (_that) {
case _SimulateFullBattle():
return simulateFullBattle(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SimulateFullBattle value)?  simulateFullBattle,}){
final _that = this;
switch (_that) {
case _SimulateFullBattle() when simulateFullBattle != null:
return simulateFullBattle(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( BattleScenario battleScenario)?  simulateFullBattle,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimulateFullBattle() when simulateFullBattle != null:
return simulateFullBattle(_that.battleScenario);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( BattleScenario battleScenario)  simulateFullBattle,}) {final _that = this;
switch (_that) {
case _SimulateFullBattle():
return simulateFullBattle(_that.battleScenario);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( BattleScenario battleScenario)?  simulateFullBattle,}) {final _that = this;
switch (_that) {
case _SimulateFullBattle() when simulateFullBattle != null:
return simulateFullBattle(_that.battleScenario);case _:
  return null;

}
}

}

/// @nodoc


class _SimulateFullBattle implements FullBattleSimulationEvent {
   _SimulateFullBattle(this.battleScenario);
  

@override final  BattleScenario battleScenario;

/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimulateFullBattleCopyWith<_SimulateFullBattle> get copyWith => __$SimulateFullBattleCopyWithImpl<_SimulateFullBattle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimulateFullBattle&&(identical(other.battleScenario, battleScenario) || other.battleScenario == battleScenario));
}


@override
int get hashCode => Object.hash(runtimeType,battleScenario);

@override
String toString() {
  return 'FullBattleSimulationEvent.simulateFullBattle(battleScenario: $battleScenario)';
}


}

/// @nodoc
abstract mixin class _$SimulateFullBattleCopyWith<$Res> implements $FullBattleSimulationEventCopyWith<$Res> {
  factory _$SimulateFullBattleCopyWith(_SimulateFullBattle value, $Res Function(_SimulateFullBattle) _then) = __$SimulateFullBattleCopyWithImpl;
@override @useResult
$Res call({
 BattleScenario battleScenario
});


@override $BattleScenarioCopyWith<$Res> get battleScenario;

}
/// @nodoc
class __$SimulateFullBattleCopyWithImpl<$Res>
    implements _$SimulateFullBattleCopyWith<$Res> {
  __$SimulateFullBattleCopyWithImpl(this._self, this._then);

  final _SimulateFullBattle _self;
  final $Res Function(_SimulateFullBattle) _then;

/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? battleScenario = null,}) {
  return _then(_SimulateFullBattle(
null == battleScenario ? _self.battleScenario : battleScenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,
  ));
}

/// Create a copy of FullBattleSimulationEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleScenarioCopyWith<$Res> get battleScenario {
  
  return $BattleScenarioCopyWith<$Res>(_self.battleScenario, (value) {
    return _then(_self.copyWith(battleScenario: value));
  });
}
}

/// @nodoc
mixin _$FullBattleSimulationState {

 BattleResult get battleResult;
/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FullBattleSimulationStateCopyWith<FullBattleSimulationState> get copyWith => _$FullBattleSimulationStateCopyWithImpl<FullBattleSimulationState>(this as FullBattleSimulationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FullBattleSimulationState&&(identical(other.battleResult, battleResult) || other.battleResult == battleResult));
}


@override
int get hashCode => Object.hash(runtimeType,battleResult);

@override
String toString() {
  return 'FullBattleSimulationState(battleResult: $battleResult)';
}


}

/// @nodoc
abstract mixin class $FullBattleSimulationStateCopyWith<$Res>  {
  factory $FullBattleSimulationStateCopyWith(FullBattleSimulationState value, $Res Function(FullBattleSimulationState) _then) = _$FullBattleSimulationStateCopyWithImpl;
@useResult
$Res call({
 BattleResult battleResult
});


$BattleResultCopyWith<$Res> get battleResult;

}
/// @nodoc
class _$FullBattleSimulationStateCopyWithImpl<$Res>
    implements $FullBattleSimulationStateCopyWith<$Res> {
  _$FullBattleSimulationStateCopyWithImpl(this._self, this._then);

  final FullBattleSimulationState _self;
  final $Res Function(FullBattleSimulationState) _then;

/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? battleResult = null,}) {
  return _then(_self.copyWith(
battleResult: null == battleResult ? _self.battleResult : battleResult // ignore: cast_nullable_to_non_nullable
as BattleResult,
  ));
}
/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleResultCopyWith<$Res> get battleResult {
  
  return $BattleResultCopyWith<$Res>(_self.battleResult, (value) {
    return _then(_self.copyWith(battleResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [FullBattleSimulationState].
extension FullBattleSimulationStatePatterns on FullBattleSimulationState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FullBattleSimulationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FullBattleSimulationState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FullBattleSimulationState value)  $default,){
final _that = this;
switch (_that) {
case _FullBattleSimulationState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FullBattleSimulationState value)?  $default,){
final _that = this;
switch (_that) {
case _FullBattleSimulationState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BattleResult battleResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FullBattleSimulationState() when $default != null:
return $default(_that.battleResult);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BattleResult battleResult)  $default,) {final _that = this;
switch (_that) {
case _FullBattleSimulationState():
return $default(_that.battleResult);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BattleResult battleResult)?  $default,) {final _that = this;
switch (_that) {
case _FullBattleSimulationState() when $default != null:
return $default(_that.battleResult);case _:
  return null;

}
}

}

/// @nodoc


class _FullBattleSimulationState implements FullBattleSimulationState {
  const _FullBattleSimulationState({required this.battleResult});
  

@override final  BattleResult battleResult;

/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FullBattleSimulationStateCopyWith<_FullBattleSimulationState> get copyWith => __$FullBattleSimulationStateCopyWithImpl<_FullBattleSimulationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FullBattleSimulationState&&(identical(other.battleResult, battleResult) || other.battleResult == battleResult));
}


@override
int get hashCode => Object.hash(runtimeType,battleResult);

@override
String toString() {
  return 'FullBattleSimulationState(battleResult: $battleResult)';
}


}

/// @nodoc
abstract mixin class _$FullBattleSimulationStateCopyWith<$Res> implements $FullBattleSimulationStateCopyWith<$Res> {
  factory _$FullBattleSimulationStateCopyWith(_FullBattleSimulationState value, $Res Function(_FullBattleSimulationState) _then) = __$FullBattleSimulationStateCopyWithImpl;
@override @useResult
$Res call({
 BattleResult battleResult
});


@override $BattleResultCopyWith<$Res> get battleResult;

}
/// @nodoc
class __$FullBattleSimulationStateCopyWithImpl<$Res>
    implements _$FullBattleSimulationStateCopyWith<$Res> {
  __$FullBattleSimulationStateCopyWithImpl(this._self, this._then);

  final _FullBattleSimulationState _self;
  final $Res Function(_FullBattleSimulationState) _then;

/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? battleResult = null,}) {
  return _then(_FullBattleSimulationState(
battleResult: null == battleResult ? _self.battleResult : battleResult // ignore: cast_nullable_to_non_nullable
as BattleResult,
  ));
}

/// Create a copy of FullBattleSimulationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleResultCopyWith<$Res> get battleResult {
  
  return $BattleResultCopyWith<$Res>(_self.battleResult, (value) {
    return _then(_self.copyWith(battleResult: value));
  });
}
}

// dart format on
