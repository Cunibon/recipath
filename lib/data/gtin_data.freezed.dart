// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gtin_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GTINData {

 String get name; double get amount; UnitEnum get unit; double? get kcal; double? get fat; double? get carbs; double? get protein; double? get fiber;
/// Create a copy of GTINData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GTINDataCopyWith<GTINData> get copyWith => _$GTINDataCopyWithImpl<GTINData>(this as GTINData, _$identity);

  /// Serializes this GTINData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GTINData&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.kcal, kcal) || other.kcal == kcal)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.fiber, fiber) || other.fiber == fiber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,unit,kcal,fat,carbs,protein,fiber);

@override
String toString() {
  return 'GTINData(name: $name, amount: $amount, unit: $unit, kcal: $kcal, fat: $fat, carbs: $carbs, protein: $protein, fiber: $fiber)';
}


}

/// @nodoc
abstract mixin class $GTINDataCopyWith<$Res>  {
  factory $GTINDataCopyWith(GTINData value, $Res Function(GTINData) _then) = _$GTINDataCopyWithImpl;
@useResult
$Res call({
 String name, double amount, UnitEnum unit, double? kcal, double? fat, double? carbs, double? protein, double? fiber
});




}
/// @nodoc
class _$GTINDataCopyWithImpl<$Res>
    implements $GTINDataCopyWith<$Res> {
  _$GTINDataCopyWithImpl(this._self, this._then);

  final GTINData _self;
  final $Res Function(GTINData) _then;

/// Create a copy of GTINData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? amount = null,Object? unit = null,Object? kcal = freezed,Object? fat = freezed,Object? carbs = freezed,Object? protein = freezed,Object? fiber = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEnum,kcal: freezed == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as double?,fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double?,carbs: freezed == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as double?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GTINData implements GTINData {
  const _GTINData({required this.name, required this.amount, required this.unit, this.kcal, this.fat, this.carbs, this.protein, this.fiber});
  factory _GTINData.fromJson(Map<String, dynamic> json) => _$GTINDataFromJson(json);

@override final  String name;
@override final  double amount;
@override final  UnitEnum unit;
@override final  double? kcal;
@override final  double? fat;
@override final  double? carbs;
@override final  double? protein;
@override final  double? fiber;

/// Create a copy of GTINData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GTINDataCopyWith<_GTINData> get copyWith => __$GTINDataCopyWithImpl<_GTINData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GTINDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GTINData&&(identical(other.name, name) || other.name == name)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.kcal, kcal) || other.kcal == kcal)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.fiber, fiber) || other.fiber == fiber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,amount,unit,kcal,fat,carbs,protein,fiber);

@override
String toString() {
  return 'GTINData(name: $name, amount: $amount, unit: $unit, kcal: $kcal, fat: $fat, carbs: $carbs, protein: $protein, fiber: $fiber)';
}


}

/// @nodoc
abstract mixin class _$GTINDataCopyWith<$Res> implements $GTINDataCopyWith<$Res> {
  factory _$GTINDataCopyWith(_GTINData value, $Res Function(_GTINData) _then) = __$GTINDataCopyWithImpl;
@override @useResult
$Res call({
 String name, double amount, UnitEnum unit, double? kcal, double? fat, double? carbs, double? protein, double? fiber
});




}
/// @nodoc
class __$GTINDataCopyWithImpl<$Res>
    implements _$GTINDataCopyWith<$Res> {
  __$GTINDataCopyWithImpl(this._self, this._then);

  final _GTINData _self;
  final $Res Function(_GTINData) _then;

/// Create a copy of GTINData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? amount = null,Object? unit = null,Object? kcal = freezed,Object? fat = freezed,Object? carbs = freezed,Object? protein = freezed,Object? fiber = freezed,}) {
  return _then(_GTINData(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEnum,kcal: freezed == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as double?,fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double?,carbs: freezed == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as double?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
