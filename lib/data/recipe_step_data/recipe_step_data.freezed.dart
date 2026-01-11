// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 String get id; String get description; List<IngredientData> get ingredients; int? get minutes;
/// Create a copy of RecipeStepData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeStepDataCopyWith<RecipeStepData> get copyWith => _$RecipeStepDataCopyWithImpl<RecipeStepData>(this as RecipeStepData, _$identity);

  /// Serializes this RecipeStepData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeStepData&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&(identical(other.minutes, minutes) || other.minutes == minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,const DeepCollectionEquality().hash(ingredients),minutes);

@override
String toString() {
  return 'RecipeStepData(id: $id, description: $description, ingredients: $ingredients, minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class $RecipeStepDataCopyWith<$Res>  {
  factory $RecipeStepDataCopyWith(RecipeStepData value, $Res Function(RecipeStepData) _then) = _$RecipeStepDataCopyWithImpl;
@useResult
$Res call({
 String id, String description, List<IngredientData> ingredients, int? minutes
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = null,Object? ingredients = null,Object? minutes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientData>,minutes: freezed == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeStepData].
extension RecipeStepDataPatterns on RecipeStepData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeStepData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeStepData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeStepData value)  $default,){
final _that = this;
switch (_that) {
case _RecipeStepData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeStepData value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeStepData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String description,  List<IngredientData> ingredients,  int? minutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeStepData() when $default != null:
return $default(_that.id,_that.description,_that.ingredients,_that.minutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String description,  List<IngredientData> ingredients,  int? minutes)  $default,) {final _that = this;
switch (_that) {
case _RecipeStepData():
return $default(_that.id,_that.description,_that.ingredients,_that.minutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String description,  List<IngredientData> ingredients,  int? minutes)?  $default,) {final _that = this;
switch (_that) {
case _RecipeStepData() when $default != null:
return $default(_that.id,_that.description,_that.ingredients,_that.minutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeStepData implements RecipeStepData {
  const _RecipeStepData({required this.id, required this.description, required final  List<IngredientData> ingredients, required this.minutes}): _ingredients = ingredients;
  factory _RecipeStepData.fromJson(Map<String, dynamic> json) => _$RecipeStepDataFromJson(json);

@override final  String id;
@override final  String description;
 final  List<IngredientData> _ingredients;
@override List<IngredientData> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

@override final  int? minutes;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeStepData&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&(identical(other.minutes, minutes) || other.minutes == minutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,const DeepCollectionEquality().hash(_ingredients),minutes);

@override
String toString() {
  return 'RecipeStepData(id: $id, description: $description, ingredients: $ingredients, minutes: $minutes)';
}


}

/// @nodoc
abstract mixin class _$RecipeStepDataCopyWith<$Res> implements $RecipeStepDataCopyWith<$Res> {
  factory _$RecipeStepDataCopyWith(_RecipeStepData value, $Res Function(_RecipeStepData) _then) = __$RecipeStepDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String description, List<IngredientData> ingredients, int? minutes
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = null,Object? ingredients = null,Object? minutes = freezed,}) {
  return _then(_RecipeStepData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientData>,minutes: freezed == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
