// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BattleHistoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleHistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BattleHistoryEvent()';
}


}

/// @nodoc
class $BattleHistoryEventCopyWith<$Res>  {
$BattleHistoryEventCopyWith(BattleHistoryEvent _, $Res Function(BattleHistoryEvent) __);
}


/// Adds pattern-matching-related methods to [BattleHistoryEvent].
extension BattleHistoryEventPatterns on BattleHistoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SimulateBattle value)?  simulateBattle,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimulateBattle() when simulateBattle != null:
return simulateBattle(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SimulateBattle value)  simulateBattle,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _SimulateBattle():
return simulateBattle(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SimulateBattle value)?  simulateBattle,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _SimulateBattle() when simulateBattle != null:
return simulateBattle(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( BattleScenario battleScenario)?  simulateBattle,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimulateBattle() when simulateBattle != null:
return simulateBattle(_that.battleScenario);case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( BattleScenario battleScenario)  simulateBattle,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _SimulateBattle():
return simulateBattle(_that.battleScenario);case _Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( BattleScenario battleScenario)?  simulateBattle,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _SimulateBattle() when simulateBattle != null:
return simulateBattle(_that.battleScenario);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _SimulateBattle implements BattleHistoryEvent {
   _SimulateBattle(this.battleScenario);
  

 final  BattleScenario battleScenario;

/// Create a copy of BattleHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimulateBattleCopyWith<_SimulateBattle> get copyWith => __$SimulateBattleCopyWithImpl<_SimulateBattle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimulateBattle&&(identical(other.battleScenario, battleScenario) || other.battleScenario == battleScenario));
}


@override
int get hashCode => Object.hash(runtimeType,battleScenario);

@override
String toString() {
  return 'BattleHistoryEvent.simulateBattle(battleScenario: $battleScenario)';
}


}

/// @nodoc
abstract mixin class _$SimulateBattleCopyWith<$Res> implements $BattleHistoryEventCopyWith<$Res> {
  factory _$SimulateBattleCopyWith(_SimulateBattle value, $Res Function(_SimulateBattle) _then) = __$SimulateBattleCopyWithImpl;
@useResult
$Res call({
 BattleScenario battleScenario
});


$BattleScenarioCopyWith<$Res> get battleScenario;

}
/// @nodoc
class __$SimulateBattleCopyWithImpl<$Res>
    implements _$SimulateBattleCopyWith<$Res> {
  __$SimulateBattleCopyWithImpl(this._self, this._then);

  final _SimulateBattle _self;
  final $Res Function(_SimulateBattle) _then;

/// Create a copy of BattleHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? battleScenario = null,}) {
  return _then(_SimulateBattle(
null == battleScenario ? _self.battleScenario : battleScenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,
  ));
}

/// Create a copy of BattleHistoryEvent
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


class _Reset implements BattleHistoryEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BattleHistoryEvent.reset()';
}


}




/// @nodoc
mixin _$BattleHistoryState {

 List<RoundBattleSummary> get battleHistory;
/// Create a copy of BattleHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleHistoryStateCopyWith<BattleHistoryState> get copyWith => _$BattleHistoryStateCopyWithImpl<BattleHistoryState>(this as BattleHistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleHistoryState&&const DeepCollectionEquality().equals(other.battleHistory, battleHistory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(battleHistory));

@override
String toString() {
  return 'BattleHistoryState(battleHistory: $battleHistory)';
}


}

/// @nodoc
abstract mixin class $BattleHistoryStateCopyWith<$Res>  {
  factory $BattleHistoryStateCopyWith(BattleHistoryState value, $Res Function(BattleHistoryState) _then) = _$BattleHistoryStateCopyWithImpl;
@useResult
$Res call({
 List<RoundBattleSummary> battleHistory
});




}
/// @nodoc
class _$BattleHistoryStateCopyWithImpl<$Res>
    implements $BattleHistoryStateCopyWith<$Res> {
  _$BattleHistoryStateCopyWithImpl(this._self, this._then);

  final BattleHistoryState _self;
  final $Res Function(BattleHistoryState) _then;

/// Create a copy of BattleHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? battleHistory = null,}) {
  return _then(_self.copyWith(
battleHistory: null == battleHistory ? _self.battleHistory : battleHistory // ignore: cast_nullable_to_non_nullable
as List<RoundBattleSummary>,
  ));
}

}


/// Adds pattern-matching-related methods to [BattleHistoryState].
extension BattleHistoryStatePatterns on BattleHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BattleHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BattleHistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattleHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _BattleHistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattleHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _BattleHistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RoundBattleSummary> battleHistory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BattleHistoryState() when $default != null:
return $default(_that.battleHistory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RoundBattleSummary> battleHistory)  $default,) {final _that = this;
switch (_that) {
case _BattleHistoryState():
return $default(_that.battleHistory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RoundBattleSummary> battleHistory)?  $default,) {final _that = this;
switch (_that) {
case _BattleHistoryState() when $default != null:
return $default(_that.battleHistory);case _:
  return null;

}
}

}

/// @nodoc


class _BattleHistoryState implements BattleHistoryState {
  const _BattleHistoryState({required final  List<RoundBattleSummary> battleHistory}): _battleHistory = battleHistory;
  

 final  List<RoundBattleSummary> _battleHistory;
@override List<RoundBattleSummary> get battleHistory {
  if (_battleHistory is EqualUnmodifiableListView) return _battleHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_battleHistory);
}


/// Create a copy of BattleHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattleHistoryStateCopyWith<_BattleHistoryState> get copyWith => __$BattleHistoryStateCopyWithImpl<_BattleHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattleHistoryState&&const DeepCollectionEquality().equals(other._battleHistory, _battleHistory));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_battleHistory));

@override
String toString() {
  return 'BattleHistoryState(battleHistory: $battleHistory)';
}


}

/// @nodoc
abstract mixin class _$BattleHistoryStateCopyWith<$Res> implements $BattleHistoryStateCopyWith<$Res> {
  factory _$BattleHistoryStateCopyWith(_BattleHistoryState value, $Res Function(_BattleHistoryState) _then) = __$BattleHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 List<RoundBattleSummary> battleHistory
});




}
/// @nodoc
class __$BattleHistoryStateCopyWithImpl<$Res>
    implements _$BattleHistoryStateCopyWith<$Res> {
  __$BattleHistoryStateCopyWithImpl(this._self, this._then);

  final _BattleHistoryState _self;
  final $Res Function(_BattleHistoryState) _then;

/// Create a copy of BattleHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? battleHistory = null,}) {
  return _then(_BattleHistoryState(
battleHistory: null == battleHistory ? _self._battleHistory : battleHistory // ignore: cast_nullable_to_non_nullable
as List<RoundBattleSummary>,
  ));
}


}

// dart format on
