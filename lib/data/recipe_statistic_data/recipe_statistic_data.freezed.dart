// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_statistic_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeStatisticData {

 String get id; DateTime get startDate; DateTime get endDate; String get recipeId; int? get servings; bool get uploaded;
/// Create a copy of RecipeStatisticData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeStatisticDataCopyWith<RecipeStatisticData> get copyWith => _$RecipeStatisticDataCopyWithImpl<RecipeStatisticData>(this as RecipeStatisticData, _$identity);

  /// Serializes this RecipeStatisticData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeStatisticData&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,endDate,recipeId,servings,uploaded);

@override
String toString() {
  return 'RecipeStatisticData(id: $id, startDate: $startDate, endDate: $endDate, recipeId: $recipeId, servings: $servings, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class $RecipeStatisticDataCopyWith<$Res>  {
  factory $RecipeStatisticDataCopyWith(RecipeStatisticData value, $Res Function(RecipeStatisticData) _then) = _$RecipeStatisticDataCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startDate, DateTime endDate, String recipeId, int? servings, bool uploaded
});




}
/// @nodoc
class _$RecipeStatisticDataCopyWithImpl<$Res>
    implements $RecipeStatisticDataCopyWith<$Res> {
  _$RecipeStatisticDataCopyWithImpl(this._self, this._then);

  final RecipeStatisticData _self;
  final $Res Function(RecipeStatisticData) _then;

/// Create a copy of RecipeStatisticData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startDate = null,Object? endDate = null,Object? recipeId = null,Object? servings = freezed,Object? uploaded = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,servings: freezed == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int?,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeStatisticData].
extension RecipeStatisticDataPatterns on RecipeStatisticData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeStatisticData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeStatisticData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeStatisticData value)  $default,){
final _that = this;
switch (_that) {
case _RecipeStatisticData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeStatisticData value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeStatisticData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime startDate,  DateTime endDate,  String recipeId,  int? servings,  bool uploaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeStatisticData() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.recipeId,_that.servings,_that.uploaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime startDate,  DateTime endDate,  String recipeId,  int? servings,  bool uploaded)  $default,) {final _that = this;
switch (_that) {
case _RecipeStatisticData():
return $default(_that.id,_that.startDate,_that.endDate,_that.recipeId,_that.servings,_that.uploaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime startDate,  DateTime endDate,  String recipeId,  int? servings,  bool uploaded)?  $default,) {final _that = this;
switch (_that) {
case _RecipeStatisticData() when $default != null:
return $default(_that.id,_that.startDate,_that.endDate,_that.recipeId,_that.servings,_that.uploaded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeStatisticData implements RecipeStatisticData {
  const _RecipeStatisticData({required this.id, required this.startDate, required this.endDate, required this.recipeId, required this.servings, this.uploaded = false});
  factory _RecipeStatisticData.fromJson(Map<String, dynamic> json) => _$RecipeStatisticDataFromJson(json);

@override final  String id;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  String recipeId;
@override final  int? servings;
@override@JsonKey() final  bool uploaded;

/// Create a copy of RecipeStatisticData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeStatisticDataCopyWith<_RecipeStatisticData> get copyWith => __$RecipeStatisticDataCopyWithImpl<_RecipeStatisticData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeStatisticDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeStatisticData&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.servings, servings) || other.servings == servings)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,endDate,recipeId,servings,uploaded);

@override
String toString() {
  return 'RecipeStatisticData(id: $id, startDate: $startDate, endDate: $endDate, recipeId: $recipeId, servings: $servings, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class _$RecipeStatisticDataCopyWith<$Res> implements $RecipeStatisticDataCopyWith<$Res> {
  factory _$RecipeStatisticDataCopyWith(_RecipeStatisticData value, $Res Function(_RecipeStatisticData) _then) = __$RecipeStatisticDataCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startDate, DateTime endDate, String recipeId, int? servings, bool uploaded
});




}
/// @nodoc
class __$RecipeStatisticDataCopyWithImpl<$Res>
    implements _$RecipeStatisticDataCopyWith<$Res> {
  __$RecipeStatisticDataCopyWithImpl(this._self, this._then);

  final _RecipeStatisticData _self;
  final $Res Function(_RecipeStatisticData) _then;

/// Create a copy of RecipeStatisticData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? endDate = null,Object? recipeId = null,Object? servings = freezed,Object? uploaded = null,}) {
  return _then(_RecipeStatisticData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,servings: freezed == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int?,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
