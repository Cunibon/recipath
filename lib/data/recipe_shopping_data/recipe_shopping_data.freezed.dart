// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 String get id; DateTime get date; String get recipeId; bool get uploaded;
/// Create a copy of RecipeShoppingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeShoppingDataCopyWith<RecipeShoppingData> get copyWith => _$RecipeShoppingDataCopyWithImpl<RecipeShoppingData>(this as RecipeShoppingData, _$identity);

  /// Serializes this RecipeShoppingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeShoppingData&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,recipeId,uploaded);

@override
String toString() {
  return 'RecipeShoppingData(id: $id, date: $date, recipeId: $recipeId, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class $RecipeShoppingDataCopyWith<$Res>  {
  factory $RecipeShoppingDataCopyWith(RecipeShoppingData value, $Res Function(RecipeShoppingData) _then) = _$RecipeShoppingDataCopyWithImpl;
@useResult
$Res call({
 String id, DateTime date, String recipeId, bool uploaded
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? recipeId = null,Object? uploaded = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeShoppingData].
extension RecipeShoppingDataPatterns on RecipeShoppingData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeShoppingData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeShoppingData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeShoppingData value)  $default,){
final _that = this;
switch (_that) {
case _RecipeShoppingData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeShoppingData value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeShoppingData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime date,  String recipeId,  bool uploaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeShoppingData() when $default != null:
return $default(_that.id,_that.date,_that.recipeId,_that.uploaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime date,  String recipeId,  bool uploaded)  $default,) {final _that = this;
switch (_that) {
case _RecipeShoppingData():
return $default(_that.id,_that.date,_that.recipeId,_that.uploaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime date,  String recipeId,  bool uploaded)?  $default,) {final _that = this;
switch (_that) {
case _RecipeShoppingData() when $default != null:
return $default(_that.id,_that.date,_that.recipeId,_that.uploaded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeShoppingData implements RecipeShoppingData {
  const _RecipeShoppingData({required this.id, required this.date, required this.recipeId, this.uploaded = false});
  factory _RecipeShoppingData.fromJson(Map<String, dynamic> json) => _$RecipeShoppingDataFromJson(json);

@override final  String id;
@override final  DateTime date;
@override final  String recipeId;
@override@JsonKey() final  bool uploaded;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeShoppingData&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,recipeId,uploaded);

@override
String toString() {
  return 'RecipeShoppingData(id: $id, date: $date, recipeId: $recipeId, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class _$RecipeShoppingDataCopyWith<$Res> implements $RecipeShoppingDataCopyWith<$Res> {
  factory _$RecipeShoppingDataCopyWith(_RecipeShoppingData value, $Res Function(_RecipeShoppingData) _then) = __$RecipeShoppingDataCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime date, String recipeId, bool uploaded
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? recipeId = null,Object? uploaded = null,}) {
  return _then(_RecipeShoppingData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
