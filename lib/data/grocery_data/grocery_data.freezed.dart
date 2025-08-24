// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grocery_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroceryData {

 String get id; String get name; double get normalAmount; UnitEnum get unit; double get conversionAmount; UnitEnum get conversionUnit; String? get barcode; double? get kcal; double? get fat; double? get carbs; double? get protein; double? get fiber; bool get archived; bool get uploaded;
/// Create a copy of GroceryData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroceryDataCopyWith<GroceryData> get copyWith => _$GroceryDataCopyWithImpl<GroceryData>(this as GroceryData, _$identity);

  /// Serializes this GroceryData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroceryData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.normalAmount, normalAmount) || other.normalAmount == normalAmount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.conversionAmount, conversionAmount) || other.conversionAmount == conversionAmount)&&(identical(other.conversionUnit, conversionUnit) || other.conversionUnit == conversionUnit)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.kcal, kcal) || other.kcal == kcal)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.fiber, fiber) || other.fiber == fiber)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,normalAmount,unit,conversionAmount,conversionUnit,barcode,kcal,fat,carbs,protein,fiber,archived,uploaded);

@override
String toString() {
  return 'GroceryData(id: $id, name: $name, normalAmount: $normalAmount, unit: $unit, conversionAmount: $conversionAmount, conversionUnit: $conversionUnit, barcode: $barcode, kcal: $kcal, fat: $fat, carbs: $carbs, protein: $protein, fiber: $fiber, archived: $archived, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class $GroceryDataCopyWith<$Res>  {
  factory $GroceryDataCopyWith(GroceryData value, $Res Function(GroceryData) _then) = _$GroceryDataCopyWithImpl;
@useResult
$Res call({
 String id, String name, double normalAmount, UnitEnum unit, double conversionAmount, UnitEnum conversionUnit, String? barcode, double? kcal, double? fat, double? carbs, double? protein, double? fiber, bool archived, bool uploaded
});




}
/// @nodoc
class _$GroceryDataCopyWithImpl<$Res>
    implements $GroceryDataCopyWith<$Res> {
  _$GroceryDataCopyWithImpl(this._self, this._then);

  final GroceryData _self;
  final $Res Function(GroceryData) _then;

/// Create a copy of GroceryData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? normalAmount = null,Object? unit = null,Object? conversionAmount = null,Object? conversionUnit = null,Object? barcode = freezed,Object? kcal = freezed,Object? fat = freezed,Object? carbs = freezed,Object? protein = freezed,Object? fiber = freezed,Object? archived = null,Object? uploaded = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,normalAmount: null == normalAmount ? _self.normalAmount : normalAmount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEnum,conversionAmount: null == conversionAmount ? _self.conversionAmount : conversionAmount // ignore: cast_nullable_to_non_nullable
as double,conversionUnit: null == conversionUnit ? _self.conversionUnit : conversionUnit // ignore: cast_nullable_to_non_nullable
as UnitEnum,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,kcal: freezed == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as double?,fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double?,carbs: freezed == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as double?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as double?,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GroceryData].
extension GroceryDataPatterns on GroceryData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroceryData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroceryData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroceryData value)  $default,){
final _that = this;
switch (_that) {
case _GroceryData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroceryData value)?  $default,){
final _that = this;
switch (_that) {
case _GroceryData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double normalAmount,  UnitEnum unit,  double conversionAmount,  UnitEnum conversionUnit,  String? barcode,  double? kcal,  double? fat,  double? carbs,  double? protein,  double? fiber,  bool archived,  bool uploaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroceryData() when $default != null:
return $default(_that.id,_that.name,_that.normalAmount,_that.unit,_that.conversionAmount,_that.conversionUnit,_that.barcode,_that.kcal,_that.fat,_that.carbs,_that.protein,_that.fiber,_that.archived,_that.uploaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double normalAmount,  UnitEnum unit,  double conversionAmount,  UnitEnum conversionUnit,  String? barcode,  double? kcal,  double? fat,  double? carbs,  double? protein,  double? fiber,  bool archived,  bool uploaded)  $default,) {final _that = this;
switch (_that) {
case _GroceryData():
return $default(_that.id,_that.name,_that.normalAmount,_that.unit,_that.conversionAmount,_that.conversionUnit,_that.barcode,_that.kcal,_that.fat,_that.carbs,_that.protein,_that.fiber,_that.archived,_that.uploaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double normalAmount,  UnitEnum unit,  double conversionAmount,  UnitEnum conversionUnit,  String? barcode,  double? kcal,  double? fat,  double? carbs,  double? protein,  double? fiber,  bool archived,  bool uploaded)?  $default,) {final _that = this;
switch (_that) {
case _GroceryData() when $default != null:
return $default(_that.id,_that.name,_that.normalAmount,_that.unit,_that.conversionAmount,_that.conversionUnit,_that.barcode,_that.kcal,_that.fat,_that.carbs,_that.protein,_that.fiber,_that.archived,_that.uploaded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroceryData implements GroceryData {
  const _GroceryData({required this.id, required this.name, required this.normalAmount, required this.unit, required this.conversionAmount, required this.conversionUnit, this.barcode, this.kcal, this.fat, this.carbs, this.protein, this.fiber, this.archived = false, this.uploaded = false});
  factory _GroceryData.fromJson(Map<String, dynamic> json) => _$GroceryDataFromJson(json);

@override final  String id;
@override final  String name;
@override final  double normalAmount;
@override final  UnitEnum unit;
@override final  double conversionAmount;
@override final  UnitEnum conversionUnit;
@override final  String? barcode;
@override final  double? kcal;
@override final  double? fat;
@override final  double? carbs;
@override final  double? protein;
@override final  double? fiber;
@override@JsonKey() final  bool archived;
@override@JsonKey() final  bool uploaded;

/// Create a copy of GroceryData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroceryDataCopyWith<_GroceryData> get copyWith => __$GroceryDataCopyWithImpl<_GroceryData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroceryDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroceryData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.normalAmount, normalAmount) || other.normalAmount == normalAmount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.conversionAmount, conversionAmount) || other.conversionAmount == conversionAmount)&&(identical(other.conversionUnit, conversionUnit) || other.conversionUnit == conversionUnit)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.kcal, kcal) || other.kcal == kcal)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.fiber, fiber) || other.fiber == fiber)&&(identical(other.archived, archived) || other.archived == archived)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,normalAmount,unit,conversionAmount,conversionUnit,barcode,kcal,fat,carbs,protein,fiber,archived,uploaded);

@override
String toString() {
  return 'GroceryData(id: $id, name: $name, normalAmount: $normalAmount, unit: $unit, conversionAmount: $conversionAmount, conversionUnit: $conversionUnit, barcode: $barcode, kcal: $kcal, fat: $fat, carbs: $carbs, protein: $protein, fiber: $fiber, archived: $archived, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class _$GroceryDataCopyWith<$Res> implements $GroceryDataCopyWith<$Res> {
  factory _$GroceryDataCopyWith(_GroceryData value, $Res Function(_GroceryData) _then) = __$GroceryDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double normalAmount, UnitEnum unit, double conversionAmount, UnitEnum conversionUnit, String? barcode, double? kcal, double? fat, double? carbs, double? protein, double? fiber, bool archived, bool uploaded
});




}
/// @nodoc
class __$GroceryDataCopyWithImpl<$Res>
    implements _$GroceryDataCopyWith<$Res> {
  __$GroceryDataCopyWithImpl(this._self, this._then);

  final _GroceryData _self;
  final $Res Function(_GroceryData) _then;

/// Create a copy of GroceryData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? normalAmount = null,Object? unit = null,Object? conversionAmount = null,Object? conversionUnit = null,Object? barcode = freezed,Object? kcal = freezed,Object? fat = freezed,Object? carbs = freezed,Object? protein = freezed,Object? fiber = freezed,Object? archived = null,Object? uploaded = null,}) {
  return _then(_GroceryData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,normalAmount: null == normalAmount ? _self.normalAmount : normalAmount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEnum,conversionAmount: null == conversionAmount ? _self.conversionAmount : conversionAmount // ignore: cast_nullable_to_non_nullable
as double,conversionUnit: null == conversionUnit ? _self.conversionUnit : conversionUnit // ignore: cast_nullable_to_non_nullable
as UnitEnum,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,kcal: freezed == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as double?,fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double?,carbs: freezed == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as double?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as double?,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
