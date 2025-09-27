// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_tag_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeTagData {

 String get recipeId; String get tagId; bool get deleted; bool get uploaded;
/// Create a copy of RecipeTagData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeTagDataCopyWith<RecipeTagData> get copyWith => _$RecipeTagDataCopyWithImpl<RecipeTagData>(this as RecipeTagData, _$identity);

  /// Serializes this RecipeTagData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeTagData&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipeId,tagId,deleted,uploaded);

@override
String toString() {
  return 'RecipeTagData(recipeId: $recipeId, tagId: $tagId, deleted: $deleted, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class $RecipeTagDataCopyWith<$Res>  {
  factory $RecipeTagDataCopyWith(RecipeTagData value, $Res Function(RecipeTagData) _then) = _$RecipeTagDataCopyWithImpl;
@useResult
$Res call({
 String recipeId, String tagId, bool deleted, bool uploaded
});




}
/// @nodoc
class _$RecipeTagDataCopyWithImpl<$Res>
    implements $RecipeTagDataCopyWith<$Res> {
  _$RecipeTagDataCopyWithImpl(this._self, this._then);

  final RecipeTagData _self;
  final $Res Function(RecipeTagData) _then;

/// Create a copy of RecipeTagData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipeId = null,Object? tagId = null,Object? deleted = null,Object? uploaded = null,}) {
  return _then(_self.copyWith(
recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeTagData].
extension RecipeTagDataPatterns on RecipeTagData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeTagData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeTagData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeTagData value)  $default,){
final _that = this;
switch (_that) {
case _RecipeTagData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeTagData value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeTagData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String recipeId,  String tagId,  bool deleted,  bool uploaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeTagData() when $default != null:
return $default(_that.recipeId,_that.tagId,_that.deleted,_that.uploaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String recipeId,  String tagId,  bool deleted,  bool uploaded)  $default,) {final _that = this;
switch (_that) {
case _RecipeTagData():
return $default(_that.recipeId,_that.tagId,_that.deleted,_that.uploaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String recipeId,  String tagId,  bool deleted,  bool uploaded)?  $default,) {final _that = this;
switch (_that) {
case _RecipeTagData() when $default != null:
return $default(_that.recipeId,_that.tagId,_that.deleted,_that.uploaded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeTagData implements RecipeTagData {
  const _RecipeTagData({required this.recipeId, required this.tagId, this.deleted = false, this.uploaded = false});
  factory _RecipeTagData.fromJson(Map<String, dynamic> json) => _$RecipeTagDataFromJson(json);

@override final  String recipeId;
@override final  String tagId;
@override@JsonKey() final  bool deleted;
@override@JsonKey() final  bool uploaded;

/// Create a copy of RecipeTagData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeTagDataCopyWith<_RecipeTagData> get copyWith => __$RecipeTagDataCopyWithImpl<_RecipeTagData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeTagDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeTagData&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipeId,tagId,deleted,uploaded);

@override
String toString() {
  return 'RecipeTagData(recipeId: $recipeId, tagId: $tagId, deleted: $deleted, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class _$RecipeTagDataCopyWith<$Res> implements $RecipeTagDataCopyWith<$Res> {
  factory _$RecipeTagDataCopyWith(_RecipeTagData value, $Res Function(_RecipeTagData) _then) = __$RecipeTagDataCopyWithImpl;
@override @useResult
$Res call({
 String recipeId, String tagId, bool deleted, bool uploaded
});




}
/// @nodoc
class __$RecipeTagDataCopyWithImpl<$Res>
    implements _$RecipeTagDataCopyWith<$Res> {
  __$RecipeTagDataCopyWithImpl(this._self, this._then);

  final _RecipeTagData _self;
  final $Res Function(_RecipeTagData) _then;

/// Create a copy of RecipeTagData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipeId = null,Object? tagId = null,Object? deleted = null,Object? uploaded = null,}) {
  return _then(_RecipeTagData(
recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
