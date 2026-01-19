// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_import_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TagImportScreenState {

 Map<String, TagData> get tagLookup; Map<String, TagData?> get mappedTags;
/// Create a copy of TagImportScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagImportScreenStateCopyWith<TagImportScreenState> get copyWith => _$TagImportScreenStateCopyWithImpl<TagImportScreenState>(this as TagImportScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagImportScreenState&&const DeepCollectionEquality().equals(other.tagLookup, tagLookup)&&const DeepCollectionEquality().equals(other.mappedTags, mappedTags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tagLookup),const DeepCollectionEquality().hash(mappedTags));

@override
String toString() {
  return 'TagImportScreenState(tagLookup: $tagLookup, mappedTags: $mappedTags)';
}


}

/// @nodoc
abstract mixin class $TagImportScreenStateCopyWith<$Res>  {
  factory $TagImportScreenStateCopyWith(TagImportScreenState value, $Res Function(TagImportScreenState) _then) = _$TagImportScreenStateCopyWithImpl;
@useResult
$Res call({
 Map<String, TagData> tagLookup, Map<String, TagData?> mappedTags
});




}
/// @nodoc
class _$TagImportScreenStateCopyWithImpl<$Res>
    implements $TagImportScreenStateCopyWith<$Res> {
  _$TagImportScreenStateCopyWithImpl(this._self, this._then);

  final TagImportScreenState _self;
  final $Res Function(TagImportScreenState) _then;

/// Create a copy of TagImportScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagLookup = null,Object? mappedTags = null,}) {
  return _then(_self.copyWith(
tagLookup: null == tagLookup ? _self.tagLookup : tagLookup // ignore: cast_nullable_to_non_nullable
as Map<String, TagData>,mappedTags: null == mappedTags ? _self.mappedTags : mappedTags // ignore: cast_nullable_to_non_nullable
as Map<String, TagData?>,
  ));
}

}


/// Adds pattern-matching-related methods to [TagImportScreenState].
extension TagImportScreenStatePatterns on TagImportScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagImportScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagImportScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagImportScreenState value)  $default,){
final _that = this;
switch (_that) {
case _TagImportScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagImportScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _TagImportScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, TagData> tagLookup,  Map<String, TagData?> mappedTags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagImportScreenState() when $default != null:
return $default(_that.tagLookup,_that.mappedTags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, TagData> tagLookup,  Map<String, TagData?> mappedTags)  $default,) {final _that = this;
switch (_that) {
case _TagImportScreenState():
return $default(_that.tagLookup,_that.mappedTags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, TagData> tagLookup,  Map<String, TagData?> mappedTags)?  $default,) {final _that = this;
switch (_that) {
case _TagImportScreenState() when $default != null:
return $default(_that.tagLookup,_that.mappedTags);case _:
  return null;

}
}

}

/// @nodoc


class _TagImportScreenState implements TagImportScreenState {
  const _TagImportScreenState({required final  Map<String, TagData> tagLookup, required final  Map<String, TagData?> mappedTags}): _tagLookup = tagLookup,_mappedTags = mappedTags;
  

 final  Map<String, TagData> _tagLookup;
@override Map<String, TagData> get tagLookup {
  if (_tagLookup is EqualUnmodifiableMapView) return _tagLookup;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_tagLookup);
}

 final  Map<String, TagData?> _mappedTags;
@override Map<String, TagData?> get mappedTags {
  if (_mappedTags is EqualUnmodifiableMapView) return _mappedTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_mappedTags);
}


/// Create a copy of TagImportScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagImportScreenStateCopyWith<_TagImportScreenState> get copyWith => __$TagImportScreenStateCopyWithImpl<_TagImportScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagImportScreenState&&const DeepCollectionEquality().equals(other._tagLookup, _tagLookup)&&const DeepCollectionEquality().equals(other._mappedTags, _mappedTags));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tagLookup),const DeepCollectionEquality().hash(_mappedTags));

@override
String toString() {
  return 'TagImportScreenState(tagLookup: $tagLookup, mappedTags: $mappedTags)';
}


}

/// @nodoc
abstract mixin class _$TagImportScreenStateCopyWith<$Res> implements $TagImportScreenStateCopyWith<$Res> {
  factory _$TagImportScreenStateCopyWith(_TagImportScreenState value, $Res Function(_TagImportScreenState) _then) = __$TagImportScreenStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, TagData> tagLookup, Map<String, TagData?> mappedTags
});




}
/// @nodoc
class __$TagImportScreenStateCopyWithImpl<$Res>
    implements _$TagImportScreenStateCopyWith<$Res> {
  __$TagImportScreenStateCopyWithImpl(this._self, this._then);

  final _TagImportScreenState _self;
  final $Res Function(_TagImportScreenState) _then;

/// Create a copy of TagImportScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagLookup = null,Object? mappedTags = null,}) {
  return _then(_TagImportScreenState(
tagLookup: null == tagLookup ? _self._tagLookup : tagLookup // ignore: cast_nullable_to_non_nullable
as Map<String, TagData>,mappedTags: null == mappedTags ? _self._mappedTags : mappedTags // ignore: cast_nullable_to_non_nullable
as Map<String, TagData?>,
  ));
}


}

// dart format on
