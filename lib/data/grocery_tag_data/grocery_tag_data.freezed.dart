// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grocery_tag_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroceryTagData {

 String get groceryId; String get tagId; bool get deleted; bool get uploaded;
/// Create a copy of GroceryTagData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroceryTagDataCopyWith<GroceryTagData> get copyWith => _$GroceryTagDataCopyWithImpl<GroceryTagData>(this as GroceryTagData, _$identity);

  /// Serializes this GroceryTagData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroceryTagData&&(identical(other.groceryId, groceryId) || other.groceryId == groceryId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groceryId,tagId,deleted,uploaded);

@override
String toString() {
  return 'GroceryTagData(groceryId: $groceryId, tagId: $tagId, deleted: $deleted, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class $GroceryTagDataCopyWith<$Res>  {
  factory $GroceryTagDataCopyWith(GroceryTagData value, $Res Function(GroceryTagData) _then) = _$GroceryTagDataCopyWithImpl;
@useResult
$Res call({
 String groceryId, String tagId, bool deleted, bool uploaded
});




}
/// @nodoc
class _$GroceryTagDataCopyWithImpl<$Res>
    implements $GroceryTagDataCopyWith<$Res> {
  _$GroceryTagDataCopyWithImpl(this._self, this._then);

  final GroceryTagData _self;
  final $Res Function(GroceryTagData) _then;

/// Create a copy of GroceryTagData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groceryId = null,Object? tagId = null,Object? deleted = null,Object? uploaded = null,}) {
  return _then(_self.copyWith(
groceryId: null == groceryId ? _self.groceryId : groceryId // ignore: cast_nullable_to_non_nullable
as String,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GroceryTagData].
extension GroceryTagDataPatterns on GroceryTagData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroceryTagData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroceryTagData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroceryTagData value)  $default,){
final _that = this;
switch (_that) {
case _GroceryTagData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroceryTagData value)?  $default,){
final _that = this;
switch (_that) {
case _GroceryTagData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String groceryId,  String tagId,  bool deleted,  bool uploaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroceryTagData() when $default != null:
return $default(_that.groceryId,_that.tagId,_that.deleted,_that.uploaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String groceryId,  String tagId,  bool deleted,  bool uploaded)  $default,) {final _that = this;
switch (_that) {
case _GroceryTagData():
return $default(_that.groceryId,_that.tagId,_that.deleted,_that.uploaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String groceryId,  String tagId,  bool deleted,  bool uploaded)?  $default,) {final _that = this;
switch (_that) {
case _GroceryTagData() when $default != null:
return $default(_that.groceryId,_that.tagId,_that.deleted,_that.uploaded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroceryTagData implements GroceryTagData {
  const _GroceryTagData({required this.groceryId, required this.tagId, this.deleted = false, this.uploaded = false});
  factory _GroceryTagData.fromJson(Map<String, dynamic> json) => _$GroceryTagDataFromJson(json);

@override final  String groceryId;
@override final  String tagId;
@override@JsonKey() final  bool deleted;
@override@JsonKey() final  bool uploaded;

/// Create a copy of GroceryTagData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroceryTagDataCopyWith<_GroceryTagData> get copyWith => __$GroceryTagDataCopyWithImpl<_GroceryTagData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroceryTagDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroceryTagData&&(identical(other.groceryId, groceryId) || other.groceryId == groceryId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groceryId,tagId,deleted,uploaded);

@override
String toString() {
  return 'GroceryTagData(groceryId: $groceryId, tagId: $tagId, deleted: $deleted, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class _$GroceryTagDataCopyWith<$Res> implements $GroceryTagDataCopyWith<$Res> {
  factory _$GroceryTagDataCopyWith(_GroceryTagData value, $Res Function(_GroceryTagData) _then) = __$GroceryTagDataCopyWithImpl;
@override @useResult
$Res call({
 String groceryId, String tagId, bool deleted, bool uploaded
});




}
/// @nodoc
class __$GroceryTagDataCopyWithImpl<$Res>
    implements _$GroceryTagDataCopyWith<$Res> {
  __$GroceryTagDataCopyWithImpl(this._self, this._then);

  final _GroceryTagData _self;
  final $Res Function(_GroceryTagData) _then;

/// Create a copy of GroceryTagData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groceryId = null,Object? tagId = null,Object? deleted = null,Object? uploaded = null,}) {
  return _then(_GroceryTagData(
groceryId: null == groceryId ? _self.groceryId : groceryId // ignore: cast_nullable_to_non_nullable
as String,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
