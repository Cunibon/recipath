// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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


/// @nodoc
@JsonSerializable()

class _StorageData implements StorageData {
  const _StorageData({required this.id, required this.ingredient, this.deleted = false, required this.uploaded});
  factory _StorageData.fromJson(Map<String, dynamic> json) => _$StorageDataFromJson(json);

@override final  String id;
@override final  IngredientData ingredient;
@override@JsonKey() final  bool deleted;
@override final  bool uploaded;

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
