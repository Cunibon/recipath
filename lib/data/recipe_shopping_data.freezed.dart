// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_shopping_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeShoppingData {

 String get id; DateTime get date; String get recipeId;
/// Create a copy of RecipeShoppingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeShoppingDataCopyWith<RecipeShoppingData> get copyWith => _$RecipeShoppingDataCopyWithImpl<RecipeShoppingData>(this as RecipeShoppingData, _$identity);

  /// Serializes this RecipeShoppingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeShoppingData&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,recipeId);

@override
String toString() {
  return 'RecipeShoppingData(id: $id, date: $date, recipeId: $recipeId)';
}


}

/// @nodoc
abstract mixin class $RecipeShoppingDataCopyWith<$Res>  {
  factory $RecipeShoppingDataCopyWith(RecipeShoppingData value, $Res Function(RecipeShoppingData) _then) = _$RecipeShoppingDataCopyWithImpl;
@useResult
$Res call({
 String id, DateTime date, String recipeId
});




}
/// @nodoc
class _$RecipeShoppingDataCopyWithImpl<$Res>
    implements $RecipeShoppingDataCopyWith<$Res> {
  _$RecipeShoppingDataCopyWithImpl(this._self, this._then);

  final RecipeShoppingData _self;
  final $Res Function(RecipeShoppingData) _then;

/// Create a copy of RecipeShoppingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? recipeId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecipeShoppingData implements RecipeShoppingData {
  const _RecipeShoppingData({required this.id, required this.date, required this.recipeId});
  factory _RecipeShoppingData.fromJson(Map<String, dynamic> json) => _$RecipeShoppingDataFromJson(json);

@override final  String id;
@override final  DateTime date;
@override final  String recipeId;

/// Create a copy of RecipeShoppingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeShoppingDataCopyWith<_RecipeShoppingData> get copyWith => __$RecipeShoppingDataCopyWithImpl<_RecipeShoppingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeShoppingDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeShoppingData&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,recipeId);

@override
String toString() {
  return 'RecipeShoppingData(id: $id, date: $date, recipeId: $recipeId)';
}


}

/// @nodoc
abstract mixin class _$RecipeShoppingDataCopyWith<$Res> implements $RecipeShoppingDataCopyWith<$Res> {
  factory _$RecipeShoppingDataCopyWith(_RecipeShoppingData value, $Res Function(_RecipeShoppingData) _then) = __$RecipeShoppingDataCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime date, String recipeId
});




}
/// @nodoc
class __$RecipeShoppingDataCopyWithImpl<$Res>
    implements _$RecipeShoppingDataCopyWith<$Res> {
  __$RecipeShoppingDataCopyWithImpl(this._self, this._then);

  final _RecipeShoppingData _self;
  final $Res Function(_RecipeShoppingData) _then;

/// Create a copy of RecipeShoppingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? recipeId = null,}) {
  return _then(_RecipeShoppingData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
