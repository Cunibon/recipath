// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TagData {

 String get id; String get name; String get description;@ColorConverter() Color get color; bool get deleted; bool get uploaded;
/// Create a copy of TagData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagDataCopyWith<TagData> get copyWith => _$TagDataCopyWithImpl<TagData>(this as TagData, _$identity);

  /// Serializes this TagData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,color,deleted,uploaded);

@override
String toString() {
  return 'TagData(id: $id, name: $name, description: $description, color: $color, deleted: $deleted, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class $TagDataCopyWith<$Res>  {
  factory $TagDataCopyWith(TagData value, $Res Function(TagData) _then) = _$TagDataCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description,@ColorConverter() Color color, bool deleted, bool uploaded
});




}
/// @nodoc
class _$TagDataCopyWithImpl<$Res>
    implements $TagDataCopyWith<$Res> {
  _$TagDataCopyWithImpl(this._self, this._then);

  final TagData _self;
  final $Res Function(TagData) _then;

/// Create a copy of TagData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? color = null,Object? deleted = null,Object? uploaded = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TagData].
extension TagDataPatterns on TagData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagData value)  $default,){
final _that = this;
switch (_that) {
case _TagData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagData value)?  $default,){
final _that = this;
switch (_that) {
case _TagData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description, @ColorConverter()  Color color,  bool deleted,  bool uploaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagData() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.color,_that.deleted,_that.uploaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description, @ColorConverter()  Color color,  bool deleted,  bool uploaded)  $default,) {final _that = this;
switch (_that) {
case _TagData():
return $default(_that.id,_that.name,_that.description,_that.color,_that.deleted,_that.uploaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description, @ColorConverter()  Color color,  bool deleted,  bool uploaded)?  $default,) {final _that = this;
switch (_that) {
case _TagData() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.color,_that.deleted,_that.uploaded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TagData implements TagData {
  const _TagData({required this.id, required this.name, required this.description, @ColorConverter() required this.color, this.deleted = false, this.uploaded = false});
  factory _TagData.fromJson(Map<String, dynamic> json) => _$TagDataFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override@ColorConverter() final  Color color;
@override@JsonKey() final  bool deleted;
@override@JsonKey() final  bool uploaded;

/// Create a copy of TagData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagDataCopyWith<_TagData> get copyWith => __$TagDataCopyWithImpl<_TagData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,color,deleted,uploaded);

@override
String toString() {
  return 'TagData(id: $id, name: $name, description: $description, color: $color, deleted: $deleted, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class _$TagDataCopyWith<$Res> implements $TagDataCopyWith<$Res> {
  factory _$TagDataCopyWith(_TagData value, $Res Function(_TagData) _then) = __$TagDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description,@ColorConverter() Color color, bool deleted, bool uploaded
});




}
/// @nodoc
class __$TagDataCopyWithImpl<$Res>
    implements _$TagDataCopyWith<$Res> {
  __$TagDataCopyWithImpl(this._self, this._then);

  final _TagData _self;
  final $Res Function(_TagData) _then;

/// Create a copy of TagData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? color = null,Object? deleted = null,Object? uploaded = null,}) {
  return _then(_TagData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
