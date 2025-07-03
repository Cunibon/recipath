// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShoppingData {

 String get id; bool get done; IngredientData get ingredient;
/// Create a copy of ShoppingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingDataCopyWith<ShoppingData> get copyWith => _$ShoppingDataCopyWithImpl<ShoppingData>(this as ShoppingData, _$identity);

  /// Serializes this ShoppingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingData&&(identical(other.id, id) || other.id == id)&&(identical(other.done, done) || other.done == done)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,done,ingredient);

@override
String toString() {
  return 'ShoppingData(id: $id, done: $done, ingredient: $ingredient)';
}


}

/// @nodoc
abstract mixin class $ShoppingDataCopyWith<$Res>  {
  factory $ShoppingDataCopyWith(ShoppingData value, $Res Function(ShoppingData) _then) = _$ShoppingDataCopyWithImpl;
@useResult
$Res call({
 String id, bool done, IngredientData ingredient
});


$IngredientDataCopyWith<$Res> get ingredient;

}
/// @nodoc
class _$ShoppingDataCopyWithImpl<$Res>
    implements $ShoppingDataCopyWith<$Res> {
  _$ShoppingDataCopyWithImpl(this._self, this._then);

  final ShoppingData _self;
  final $Res Function(ShoppingData) _then;

/// Create a copy of ShoppingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? done = null,Object? ingredient = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as IngredientData,
  ));
}
/// Create a copy of ShoppingData
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

class _ShoppingData implements ShoppingData {
  const _ShoppingData({required this.id, required this.done, required this.ingredient});
  factory _ShoppingData.fromJson(Map<String, dynamic> json) => _$ShoppingDataFromJson(json);

@override final  String id;
@override final  bool done;
@override final  IngredientData ingredient;

/// Create a copy of ShoppingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingDataCopyWith<_ShoppingData> get copyWith => __$ShoppingDataCopyWithImpl<_ShoppingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoppingDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingData&&(identical(other.id, id) || other.id == id)&&(identical(other.done, done) || other.done == done)&&(identical(other.ingredient, ingredient) || other.ingredient == ingredient));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,done,ingredient);

@override
String toString() {
  return 'ShoppingData(id: $id, done: $done, ingredient: $ingredient)';
}


}

/// @nodoc
abstract mixin class _$ShoppingDataCopyWith<$Res> implements $ShoppingDataCopyWith<$Res> {
  factory _$ShoppingDataCopyWith(_ShoppingData value, $Res Function(_ShoppingData) _then) = __$ShoppingDataCopyWithImpl;
@override @useResult
$Res call({
 String id, bool done, IngredientData ingredient
});


@override $IngredientDataCopyWith<$Res> get ingredient;

}
/// @nodoc
class __$ShoppingDataCopyWithImpl<$Res>
    implements _$ShoppingDataCopyWith<$Res> {
  __$ShoppingDataCopyWithImpl(this._self, this._then);

  final _ShoppingData _self;
  final $Res Function(_ShoppingData) _then;

/// Create a copy of ShoppingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? done = null,Object? ingredient = null,}) {
  return _then(_ShoppingData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as IngredientData,
  ));
}

/// Create a copy of ShoppingData
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
