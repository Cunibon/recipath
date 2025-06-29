// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_step_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeStepData {

 String get id; String get description; List<String> get ingredientIds;
/// Create a copy of RecipeStepData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeStepDataCopyWith<RecipeStepData> get copyWith => _$RecipeStepDataCopyWithImpl<RecipeStepData>(this as RecipeStepData, _$identity);

  /// Serializes this RecipeStepData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeStepData&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.ingredientIds, ingredientIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,const DeepCollectionEquality().hash(ingredientIds));

@override
String toString() {
  return 'RecipeStepData(id: $id, description: $description, ingredientIds: $ingredientIds)';
}


}

/// @nodoc
abstract mixin class $RecipeStepDataCopyWith<$Res>  {
  factory $RecipeStepDataCopyWith(RecipeStepData value, $Res Function(RecipeStepData) _then) = _$RecipeStepDataCopyWithImpl;
@useResult
$Res call({
 String id, String description, List<String> ingredientIds
});




}
/// @nodoc
class _$RecipeStepDataCopyWithImpl<$Res>
    implements $RecipeStepDataCopyWith<$Res> {
  _$RecipeStepDataCopyWithImpl(this._self, this._then);

  final RecipeStepData _self;
  final $Res Function(RecipeStepData) _then;

/// Create a copy of RecipeStepData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = null,Object? ingredientIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredientIds: null == ingredientIds ? _self.ingredientIds : ingredientIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecipeStepData implements RecipeStepData {
  const _RecipeStepData({required this.id, required this.description, required final  List<String> ingredientIds}): _ingredientIds = ingredientIds;
  factory _RecipeStepData.fromJson(Map<String, dynamic> json) => _$RecipeStepDataFromJson(json);

@override final  String id;
@override final  String description;
 final  List<String> _ingredientIds;
@override List<String> get ingredientIds {
  if (_ingredientIds is EqualUnmodifiableListView) return _ingredientIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredientIds);
}


/// Create a copy of RecipeStepData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeStepDataCopyWith<_RecipeStepData> get copyWith => __$RecipeStepDataCopyWithImpl<_RecipeStepData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeStepDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeStepData&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._ingredientIds, _ingredientIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,const DeepCollectionEquality().hash(_ingredientIds));

@override
String toString() {
  return 'RecipeStepData(id: $id, description: $description, ingredientIds: $ingredientIds)';
}


}

/// @nodoc
abstract mixin class _$RecipeStepDataCopyWith<$Res> implements $RecipeStepDataCopyWith<$Res> {
  factory _$RecipeStepDataCopyWith(_RecipeStepData value, $Res Function(_RecipeStepData) _then) = __$RecipeStepDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String description, List<String> ingredientIds
});




}
/// @nodoc
class __$RecipeStepDataCopyWithImpl<$Res>
    implements _$RecipeStepDataCopyWith<$Res> {
  __$RecipeStepDataCopyWithImpl(this._self, this._then);

  final _RecipeStepData _self;
  final $Res Function(_RecipeStepData) _then;

/// Create a copy of RecipeStepData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = null,Object? ingredientIds = null,}) {
  return _then(_RecipeStepData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredientIds: null == ingredientIds ? _self._ingredientIds : ingredientIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
