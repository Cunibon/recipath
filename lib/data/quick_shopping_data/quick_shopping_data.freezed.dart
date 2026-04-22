// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_shopping_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuickShoppingData {

 String get id; bool get done; String get description; bool get deleted; bool get uploaded;
/// Create a copy of QuickShoppingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuickShoppingDataCopyWith<QuickShoppingData> get copyWith => _$QuickShoppingDataCopyWithImpl<QuickShoppingData>(this as QuickShoppingData, _$identity);

  /// Serializes this QuickShoppingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickShoppingData&&(identical(other.id, id) || other.id == id)&&(identical(other.done, done) || other.done == done)&&(identical(other.description, description) || other.description == description)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,done,description,deleted,uploaded);

@override
String toString() {
  return 'QuickShoppingData(id: $id, done: $done, description: $description, deleted: $deleted, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class $QuickShoppingDataCopyWith<$Res>  {
  factory $QuickShoppingDataCopyWith(QuickShoppingData value, $Res Function(QuickShoppingData) _then) = _$QuickShoppingDataCopyWithImpl;
@useResult
$Res call({
 String id, bool done, String description, bool deleted, bool uploaded
});




}
/// @nodoc
class _$QuickShoppingDataCopyWithImpl<$Res>
    implements $QuickShoppingDataCopyWith<$Res> {
  _$QuickShoppingDataCopyWithImpl(this._self, this._then);

  final QuickShoppingData _self;
  final $Res Function(QuickShoppingData) _then;

/// Create a copy of QuickShoppingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? done = null,Object? description = null,Object? deleted = null,Object? uploaded = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuickShoppingData].
extension QuickShoppingDataPatterns on QuickShoppingData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuickShoppingData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuickShoppingData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuickShoppingData value)  $default,){
final _that = this;
switch (_that) {
case _QuickShoppingData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuickShoppingData value)?  $default,){
final _that = this;
switch (_that) {
case _QuickShoppingData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool done,  String description,  bool deleted,  bool uploaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuickShoppingData() when $default != null:
return $default(_that.id,_that.done,_that.description,_that.deleted,_that.uploaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool done,  String description,  bool deleted,  bool uploaded)  $default,) {final _that = this;
switch (_that) {
case _QuickShoppingData():
return $default(_that.id,_that.done,_that.description,_that.deleted,_that.uploaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool done,  String description,  bool deleted,  bool uploaded)?  $default,) {final _that = this;
switch (_that) {
case _QuickShoppingData() when $default != null:
return $default(_that.id,_that.done,_that.description,_that.deleted,_that.uploaded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuickShoppingData implements QuickShoppingData {
  const _QuickShoppingData({required this.id, required this.done, required this.description, this.deleted = false, this.uploaded = false});
  factory _QuickShoppingData.fromJson(Map<String, dynamic> json) => _$QuickShoppingDataFromJson(json);

@override final  String id;
@override final  bool done;
@override final  String description;
@override@JsonKey() final  bool deleted;
@override@JsonKey() final  bool uploaded;

/// Create a copy of QuickShoppingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuickShoppingDataCopyWith<_QuickShoppingData> get copyWith => __$QuickShoppingDataCopyWithImpl<_QuickShoppingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuickShoppingDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuickShoppingData&&(identical(other.id, id) || other.id == id)&&(identical(other.done, done) || other.done == done)&&(identical(other.description, description) || other.description == description)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,done,description,deleted,uploaded);

@override
String toString() {
  return 'QuickShoppingData(id: $id, done: $done, description: $description, deleted: $deleted, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class _$QuickShoppingDataCopyWith<$Res> implements $QuickShoppingDataCopyWith<$Res> {
  factory _$QuickShoppingDataCopyWith(_QuickShoppingData value, $Res Function(_QuickShoppingData) _then) = __$QuickShoppingDataCopyWithImpl;
@override @useResult
$Res call({
 String id, bool done, String description, bool deleted, bool uploaded
});




}
/// @nodoc
class __$QuickShoppingDataCopyWithImpl<$Res>
    implements _$QuickShoppingDataCopyWith<$Res> {
  __$QuickShoppingDataCopyWithImpl(this._self, this._then);

  final _QuickShoppingData _self;
  final $Res Function(_QuickShoppingData) _then;

/// Create a copy of QuickShoppingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? done = null,Object? description = null,Object? deleted = null,Object? uploaded = null,}) {
  return _then(_QuickShoppingData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
