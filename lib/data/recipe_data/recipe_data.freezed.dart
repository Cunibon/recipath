// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeData {

 String get id; String get title; int? get servings; String? get imageName; List<RecipeStepData> get steps; bool get archived; dynamic get uploaded;
/// Create a copy of RecipeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDataCopyWith<RecipeData> get copyWith => _$RecipeDataCopyWithImpl<RecipeData>(this as RecipeData, _$identity);

  /// Serializes this RecipeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.imageName, imageName) || other.imageName == imageName)&&const DeepCollectionEquality().equals(other.steps, steps)&&(identical(other.archived, archived) || other.archived == archived)&&const DeepCollectionEquality().equals(other.uploaded, uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,servings,imageName,const DeepCollectionEquality().hash(steps),archived,const DeepCollectionEquality().hash(uploaded));

@override
String toString() {
  return 'RecipeData(id: $id, title: $title, servings: $servings, imageName: $imageName, steps: $steps, archived: $archived, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class $RecipeDataCopyWith<$Res>  {
  factory $RecipeDataCopyWith(RecipeData value, $Res Function(RecipeData) _then) = _$RecipeDataCopyWithImpl;
@useResult
$Res call({
 String id, String title, int? servings, String? imageName, List<RecipeStepData> steps, bool archived, dynamic uploaded
});




}
/// @nodoc
class _$RecipeDataCopyWithImpl<$Res>
    implements $RecipeDataCopyWith<$Res> {
  _$RecipeDataCopyWithImpl(this._self, this._then);

  final RecipeData _self;
  final $Res Function(RecipeData) _then;

/// Create a copy of RecipeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? servings = freezed,Object? imageName = freezed,Object? steps = null,Object? archived = null,Object? uploaded = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,servings: freezed == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int?,imageName: freezed == imageName ? _self.imageName : imageName // ignore: cast_nullable_to_non_nullable
as String?,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<RecipeStepData>,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,uploaded: freezed == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecipeData implements RecipeData {
  const _RecipeData({required this.id, required this.title, this.servings, this.imageName, required final  List<RecipeStepData> steps, this.archived = false, this.uploaded = false}): _steps = steps;
  factory _RecipeData.fromJson(Map<String, dynamic> json) => _$RecipeDataFromJson(json);

@override final  String id;
@override final  String title;
@override final  int? servings;
@override final  String? imageName;
 final  List<RecipeStepData> _steps;
@override List<RecipeStepData> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override@JsonKey() final  bool archived;
@override@JsonKey() final  dynamic uploaded;

/// Create a copy of RecipeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDataCopyWith<_RecipeData> get copyWith => __$RecipeDataCopyWithImpl<_RecipeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.imageName, imageName) || other.imageName == imageName)&&const DeepCollectionEquality().equals(other._steps, _steps)&&(identical(other.archived, archived) || other.archived == archived)&&const DeepCollectionEquality().equals(other.uploaded, uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,servings,imageName,const DeepCollectionEquality().hash(_steps),archived,const DeepCollectionEquality().hash(uploaded));

@override
String toString() {
  return 'RecipeData(id: $id, title: $title, servings: $servings, imageName: $imageName, steps: $steps, archived: $archived, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class _$RecipeDataCopyWith<$Res> implements $RecipeDataCopyWith<$Res> {
  factory _$RecipeDataCopyWith(_RecipeData value, $Res Function(_RecipeData) _then) = __$RecipeDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int? servings, String? imageName, List<RecipeStepData> steps, bool archived, dynamic uploaded
});




}
/// @nodoc
class __$RecipeDataCopyWithImpl<$Res>
    implements _$RecipeDataCopyWith<$Res> {
  __$RecipeDataCopyWithImpl(this._self, this._then);

  final _RecipeData _self;
  final $Res Function(_RecipeData) _then;

/// Create a copy of RecipeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? servings = freezed,Object? imageName = freezed,Object? steps = null,Object? archived = null,Object? uploaded = freezed,}) {
  return _then(_RecipeData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,servings: freezed == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int?,imageName: freezed == imageName ? _self.imageName : imageName // ignore: cast_nullable_to_non_nullable
as String?,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<RecipeStepData>,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,uploaded: freezed == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
