// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StorageData {

 String get id; IngredientData get ingredient; bool get deleted; bool get uploaded;
/// Create a copy of StorageData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageDataCopyWith<StorageData> get copyWith => _$StorageDataCopyWithImpl<StorageData>(this as StorageData, _$identity);

  /// Serializes this StorageData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageData&&(identical(other.id, id) || other.id == id)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ingredient,deleted,uploaded);

@override
String toString() {
  return 'StorageData(id: $id, ingredient: $ingredient, deleted: $deleted, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class $StorageDataCopyWith<$Res>  {
  factory $StorageDataCopyWith(StorageData value, $Res Function(StorageData) _then) = _$StorageDataCopyWithImpl;
@useResult
$Res call({
 String id, IngredientData ingredient, bool deleted, bool uploaded
});


$IngredientDataCopyWith<$Res> get ingredient;

}
/// @nodoc
class _$StorageDataCopyWithImpl<$Res>
    implements $StorageDataCopyWith<$Res> {
  _$StorageDataCopyWithImpl(this._self, this._then);

  final StorageData _self;
  final $Res Function(StorageData) _then;

/// Create a copy of StorageData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ingredient = null,Object? deleted = null,Object? uploaded = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as IngredientData,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of StorageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientDataCopyWith<$Res> get ingredient {
  
  return $IngredientDataCopyWith<$Res>(_self.ingredient, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}


/// Adds pattern-matching-related methods to [StorageData].
extension StorageDataPatterns on StorageData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorageData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorageData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorageData value)  $default,){
final _that = this;
switch (_that) {
case _StorageData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorageData value)?  $default,){
final _that = this;
switch (_that) {
case _StorageData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  IngredientData ingredient,  bool deleted,  bool uploaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorageData() when $default != null:
return $default(_that.id,_that.ingredient,_that.deleted,_that.uploaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  IngredientData ingredient,  bool deleted,  bool uploaded)  $default,) {final _that = this;
switch (_that) {
case _StorageData():
return $default(_that.id,_that.ingredient,_that.deleted,_that.uploaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  IngredientData ingredient,  bool deleted,  bool uploaded)?  $default,) {final _that = this;
switch (_that) {
case _StorageData() when $default != null:
return $default(_that.id,_that.ingredient,_that.deleted,_that.uploaded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorageData implements StorageData {
  const _StorageData({required this.id, required this.ingredient, this.deleted = false, this.uploaded = false});
  factory _StorageData.fromJson(Map<String, dynamic> json) => _$StorageDataFromJson(json);

@override final  String id;
@override final  IngredientData ingredient;
@override@JsonKey() final  bool deleted;
@override@JsonKey() final  bool uploaded;

/// Create a copy of StorageData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorageDataCopyWith<_StorageData> get copyWith => __$StorageDataCopyWithImpl<_StorageData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorageDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorageData&&(identical(other.id, id) || other.id == id)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ingredient,deleted,uploaded);

@override
String toString() {
  return 'StorageData(id: $id, ingredient: $ingredient, deleted: $deleted, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class _$StorageDataCopyWith<$Res> implements $StorageDataCopyWith<$Res> {
  factory _$StorageDataCopyWith(_StorageData value, $Res Function(_StorageData) _then) = __$StorageDataCopyWithImpl;
@override @useResult
$Res call({
 String id, IngredientData ingredient, bool deleted, bool uploaded
});


@override $IngredientDataCopyWith<$Res> get ingredient;

}
/// @nodoc
class __$StorageDataCopyWithImpl<$Res>
    implements _$StorageDataCopyWith<$Res> {
  __$StorageDataCopyWithImpl(this._self, this._then);

  final _StorageData _self;
  final $Res Function(_StorageData) _then;

/// Create a copy of StorageData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ingredient = null,Object? deleted = null,Object? uploaded = null,}) {
  return _then(_StorageData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as IngredientData,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of StorageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientDataCopyWith<$Res> get ingredient {
  
  return $IngredientDataCopyWith<$Res>(_self.ingredient, (value) {
    return _then(_self.copyWith(ingredient: value));
  });
}
}

// dart format on
