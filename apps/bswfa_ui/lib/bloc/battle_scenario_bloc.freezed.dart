// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battle_scenario_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BattleScenarioEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleScenarioEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BattleScenarioEvent()';
}


}

/// @nodoc
class $BattleScenarioEventCopyWith<$Res>  {
$BattleScenarioEventCopyWith(BattleScenarioEvent _, $Res Function(BattleScenarioEvent) __);
}


/// Adds pattern-matching-related methods to [BattleScenarioEvent].
extension BattleScenarioEventPatterns on BattleScenarioEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UpdateAttackingLegion value)?  updateAttackingLegion,TResult Function( _UpdateDefendingLegion value)?  updateDefendingLegion,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAttackingLegion() when updateAttackingLegion != null:
return updateAttackingLegion(_that);case _UpdateDefendingLegion() when updateDefendingLegion != null:
return updateDefendingLegion(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UpdateAttackingLegion value)  updateAttackingLegion,required TResult Function( _UpdateDefendingLegion value)  updateDefendingLegion,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _UpdateAttackingLegion():
return updateAttackingLegion(_that);case _UpdateDefendingLegion():
return updateDefendingLegion(_that);case _Reset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UpdateAttackingLegion value)?  updateAttackingLegion,TResult? Function( _UpdateDefendingLegion value)?  updateDefendingLegion,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _UpdateAttackingLegion() when updateAttackingLegion != null:
return updateAttackingLegion(_that);case _UpdateDefendingLegion() when updateDefendingLegion != null:
return updateDefendingLegion(_that);case _Reset() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AttackingLegion attackingLegion)?  updateAttackingLegion,TResult Function( DefendingLegion defendingLegion)?  updateDefendingLegion,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAttackingLegion() when updateAttackingLegion != null:
return updateAttackingLegion(_that.attackingLegion);case _UpdateDefendingLegion() when updateDefendingLegion != null:
return updateDefendingLegion(_that.defendingLegion);case _Reset() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AttackingLegion attackingLegion)  updateAttackingLegion,required TResult Function( DefendingLegion defendingLegion)  updateDefendingLegion,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _UpdateAttackingLegion():
return updateAttackingLegion(_that.attackingLegion);case _UpdateDefendingLegion():
return updateDefendingLegion(_that.defendingLegion);case _Reset():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AttackingLegion attackingLegion)?  updateAttackingLegion,TResult? Function( DefendingLegion defendingLegion)?  updateDefendingLegion,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _UpdateAttackingLegion() when updateAttackingLegion != null:
return updateAttackingLegion(_that.attackingLegion);case _UpdateDefendingLegion() when updateDefendingLegion != null:
return updateDefendingLegion(_that.defendingLegion);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _UpdateAttackingLegion implements BattleScenarioEvent {
  const _UpdateAttackingLegion(this.attackingLegion);
  

 final  AttackingLegion attackingLegion;

/// Create a copy of BattleScenarioEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAttackingLegionCopyWith<_UpdateAttackingLegion> get copyWith => __$UpdateAttackingLegionCopyWithImpl<_UpdateAttackingLegion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAttackingLegion&&const DeepCollectionEquality().equals(other.attackingLegion, attackingLegion));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(attackingLegion));

@override
String toString() {
  return 'BattleScenarioEvent.updateAttackingLegion(attackingLegion: $attackingLegion)';
}


}

/// @nodoc
abstract mixin class _$UpdateAttackingLegionCopyWith<$Res> implements $BattleScenarioEventCopyWith<$Res> {
  factory _$UpdateAttackingLegionCopyWith(_UpdateAttackingLegion value, $Res Function(_UpdateAttackingLegion) _then) = __$UpdateAttackingLegionCopyWithImpl;
@useResult
$Res call({
 AttackingLegion attackingLegion
});




}
/// @nodoc
class __$UpdateAttackingLegionCopyWithImpl<$Res>
    implements _$UpdateAttackingLegionCopyWith<$Res> {
  __$UpdateAttackingLegionCopyWithImpl(this._self, this._then);

  final _UpdateAttackingLegion _self;
  final $Res Function(_UpdateAttackingLegion) _then;

/// Create a copy of BattleScenarioEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? attackingLegion = freezed,}) {
  return _then(_UpdateAttackingLegion(
freezed == attackingLegion ? _self.attackingLegion : attackingLegion // ignore: cast_nullable_to_non_nullable
as AttackingLegion,
  ));
}


}

/// @nodoc


class _UpdateDefendingLegion implements BattleScenarioEvent {
  const _UpdateDefendingLegion(this.defendingLegion);
  

 final  DefendingLegion defendingLegion;

/// Create a copy of BattleScenarioEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateDefendingLegionCopyWith<_UpdateDefendingLegion> get copyWith => __$UpdateDefendingLegionCopyWithImpl<_UpdateDefendingLegion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateDefendingLegion&&const DeepCollectionEquality().equals(other.defendingLegion, defendingLegion));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(defendingLegion));

@override
String toString() {
  return 'BattleScenarioEvent.updateDefendingLegion(defendingLegion: $defendingLegion)';
}


}

/// @nodoc
abstract mixin class _$UpdateDefendingLegionCopyWith<$Res> implements $BattleScenarioEventCopyWith<$Res> {
  factory _$UpdateDefendingLegionCopyWith(_UpdateDefendingLegion value, $Res Function(_UpdateDefendingLegion) _then) = __$UpdateDefendingLegionCopyWithImpl;
@useResult
$Res call({
 DefendingLegion defendingLegion
});




}
/// @nodoc
class __$UpdateDefendingLegionCopyWithImpl<$Res>
    implements _$UpdateDefendingLegionCopyWith<$Res> {
  __$UpdateDefendingLegionCopyWithImpl(this._self, this._then);

  final _UpdateDefendingLegion _self;
  final $Res Function(_UpdateDefendingLegion) _then;

/// Create a copy of BattleScenarioEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? defendingLegion = freezed,}) {
  return _then(_UpdateDefendingLegion(
freezed == defendingLegion ? _self.defendingLegion : defendingLegion // ignore: cast_nullable_to_non_nullable
as DefendingLegion,
  ));
}


}

/// @nodoc


class _Reset implements BattleScenarioEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BattleScenarioEvent.reset()';
}


}




/// @nodoc
mixin _$BattleScenarioState {

 BattleScenario get battleScenario;
/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BattleScenarioStateCopyWith<BattleScenarioState> get copyWith => _$BattleScenarioStateCopyWithImpl<BattleScenarioState>(this as BattleScenarioState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BattleScenarioState&&(identical(other.battleScenario, battleScenario) || other.battleScenario == battleScenario));
}


@override
int get hashCode => Object.hash(runtimeType,battleScenario);

@override
String toString() {
  return 'BattleScenarioState(battleScenario: $battleScenario)';
}


}

/// @nodoc
abstract mixin class $BattleScenarioStateCopyWith<$Res>  {
  factory $BattleScenarioStateCopyWith(BattleScenarioState value, $Res Function(BattleScenarioState) _then) = _$BattleScenarioStateCopyWithImpl;
@useResult
$Res call({
 BattleScenario battleScenario
});


$BattleScenarioCopyWith<$Res> get battleScenario;

}
/// @nodoc
class _$BattleScenarioStateCopyWithImpl<$Res>
    implements $BattleScenarioStateCopyWith<$Res> {
  _$BattleScenarioStateCopyWithImpl(this._self, this._then);

  final BattleScenarioState _self;
  final $Res Function(BattleScenarioState) _then;

/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? battleScenario = null,}) {
  return _then(_self.copyWith(
battleScenario: null == battleScenario ? _self.battleScenario : battleScenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,
  ));
}
/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleScenarioCopyWith<$Res> get battleScenario {
  
  return $BattleScenarioCopyWith<$Res>(_self.battleScenario, (value) {
    return _then(_self.copyWith(battleScenario: value));
  });
}
}


/// Adds pattern-matching-related methods to [BattleScenarioState].
extension BattleScenarioStatePatterns on BattleScenarioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BattleScenarioState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BattleScenarioState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BattleScenarioState value)  $default,){
final _that = this;
switch (_that) {
case _BattleScenarioState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BattleScenarioState value)?  $default,){
final _that = this;
switch (_that) {
case _BattleScenarioState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BattleScenario battleScenario)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BattleScenarioState() when $default != null:
return $default(_that.battleScenario);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BattleScenario battleScenario)  $default,) {final _that = this;
switch (_that) {
case _BattleScenarioState():
return $default(_that.battleScenario);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BattleScenario battleScenario)?  $default,) {final _that = this;
switch (_that) {
case _BattleScenarioState() when $default != null:
return $default(_that.battleScenario);case _:
  return null;

}
}

}

/// @nodoc


class _BattleScenarioState implements BattleScenarioState {
  const _BattleScenarioState({required this.battleScenario});
  

@override final  BattleScenario battleScenario;

/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BattleScenarioStateCopyWith<_BattleScenarioState> get copyWith => __$BattleScenarioStateCopyWithImpl<_BattleScenarioState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BattleScenarioState&&(identical(other.battleScenario, battleScenario) || other.battleScenario == battleScenario));
}


@override
int get hashCode => Object.hash(runtimeType,battleScenario);

@override
String toString() {
  return 'BattleScenarioState(battleScenario: $battleScenario)';
}


}

/// @nodoc
abstract mixin class _$BattleScenarioStateCopyWith<$Res> implements $BattleScenarioStateCopyWith<$Res> {
  factory _$BattleScenarioStateCopyWith(_BattleScenarioState value, $Res Function(_BattleScenarioState) _then) = __$BattleScenarioStateCopyWithImpl;
@override @useResult
$Res call({
 BattleScenario battleScenario
});


@override $BattleScenarioCopyWith<$Res> get battleScenario;

}
/// @nodoc
class __$BattleScenarioStateCopyWithImpl<$Res>
    implements _$BattleScenarioStateCopyWith<$Res> {
  __$BattleScenarioStateCopyWithImpl(this._self, this._then);

  final _BattleScenarioState _self;
  final $Res Function(_BattleScenarioState) _then;

/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? battleScenario = null,}) {
  return _then(_BattleScenarioState(
battleScenario: null == battleScenario ? _self.battleScenario : battleScenario // ignore: cast_nullable_to_non_nullable
as BattleScenario,
  ));
}

/// Create a copy of BattleScenarioState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BattleScenarioCopyWith<$Res> get battleScenario {
  
  return $BattleScenarioCopyWith<$Res>(_self.battleScenario, (value) {
    return _then(_self.copyWith(battleScenario: value));
  });
}
}

// dart format on
