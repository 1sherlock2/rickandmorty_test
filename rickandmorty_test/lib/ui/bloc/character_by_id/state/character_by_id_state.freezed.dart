// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_by_id_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterByIdState {

 CharacterResult? get character; String? get error; bool get loading;
/// Create a copy of CharacterByIdState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterByIdStateCopyWith<CharacterByIdState> get copyWith => _$CharacterByIdStateCopyWithImpl<CharacterByIdState>(this as CharacterByIdState, _$identity);

  /// Serializes this CharacterByIdState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CharacterByIdState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterByIdState&&(identical(other.character, _this.character) || other.character == _this.character)&&(identical(other.error, _this.error) || other.error == _this.error)&&(identical(other.loading, _this.loading) || other.loading == _this.loading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CharacterByIdState;
  return Object.hash(runtimeType,_this.character,_this.error,_this.loading);
}

@override
String toString() {
  final _this = this as CharacterByIdState;
  return 'CharacterByIdState(character: ${_this.character}, error: ${_this.error}, loading: ${_this.loading})';
}


}

/// @nodoc
abstract mixin class $CharacterByIdStateCopyWith<$Res>  {
  factory $CharacterByIdStateCopyWith(CharacterByIdState value, $Res Function(CharacterByIdState) _then) = _$CharacterByIdStateCopyWithImpl;
@useResult
$Res call({
 CharacterResult? character, String? error, bool loading
});


$CharacterResultCopyWith<$Res>? get character;

}
/// @nodoc
class _$CharacterByIdStateCopyWithImpl<$Res>
    implements $CharacterByIdStateCopyWith<$Res> {
  _$CharacterByIdStateCopyWithImpl(this._self, this._then);

  final CharacterByIdState _self;
  final $Res Function(CharacterByIdState) _then;

/// Create a copy of CharacterByIdState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? character = freezed,Object? error = freezed,Object? loading = null,}) {
  return _then(CharacterByIdState(
character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as CharacterResult?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CharacterByIdState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterResultCopyWith<$Res>? get character {
    if (_self.character == null) {
    return null;
  }

  return $CharacterResultCopyWith<$Res>(_self.character!, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}


/// Adds pattern-matching-related methods to [CharacterByIdState].
extension CharacterByIdStatePatterns on CharacterByIdState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterByIdState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterByIdState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterByIdState value)  $default,){
final _that = this;
switch (_that) {
case _CharacterByIdState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterByIdState value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterByIdState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CharacterResult? character,  String? error,  bool loading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterByIdState() when $default != null:
return $default(_that.character,_that.error,_that.loading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CharacterResult? character,  String? error,  bool loading)  $default,) {final _that = this;
switch (_that) {
case _CharacterByIdState():
return $default(_that.character,_that.error,_that.loading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CharacterResult? character,  String? error,  bool loading)?  $default,) {final _that = this;
switch (_that) {
case _CharacterByIdState() when $default != null:
return $default(_that.character,_that.error,_that.loading);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterByIdState implements CharacterByIdState {
   _CharacterByIdState({this.character, this.error = null, this.loading = false});
  factory _CharacterByIdState.fromJson(Map<String, dynamic> json) => _$CharacterByIdStateFromJson(json);

@override final  CharacterResult? character;
@override@JsonKey() final  String? error;
@override@JsonKey() final  bool loading;

/// Create a copy of CharacterByIdState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterByIdStateCopyWith<_CharacterByIdState> get copyWith => __$CharacterByIdStateCopyWithImpl<_CharacterByIdState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterByIdStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterByIdState&&(identical(other.character, character) || other.character == character)&&(identical(other.error, error) || other.error == error)&&(identical(other.loading, loading) || other.loading == loading));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,character,error,loading);
}

@override
String toString() {
    return 'CharacterByIdState(character: $character, error: $error, loading: $loading)';
}


}

/// @nodoc
abstract mixin class _$CharacterByIdStateCopyWith<$Res> implements $CharacterByIdStateCopyWith<$Res> {
  factory _$CharacterByIdStateCopyWith(_CharacterByIdState value, $Res Function(_CharacterByIdState) _then) = __$CharacterByIdStateCopyWithImpl;
@override @useResult
$Res call({
 CharacterResult? character, String? error, bool loading
});


@override $CharacterResultCopyWith<$Res>? get character;

}
/// @nodoc
class __$CharacterByIdStateCopyWithImpl<$Res>
    implements _$CharacterByIdStateCopyWith<$Res> {
  __$CharacterByIdStateCopyWithImpl(this._self, this._then);

  final _CharacterByIdState _self;
  final $Res Function(_CharacterByIdState) _then;

/// Create a copy of CharacterByIdState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? character = freezed,Object? error = freezed,Object? loading = null,}) {
  return _then(_CharacterByIdState(
character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as CharacterResult?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CharacterByIdState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterResultCopyWith<$Res>? get character {
    if (_self.character == null) {
    return null;
  }

  return $CharacterResultCopyWith<$Res>(_self.character!, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}

// dart format on
