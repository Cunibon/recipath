// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 String get id; String get name; double get normalAmount; UnitEnum get unit; double get conversionAmount; UnitEnum get conversionUnit;
/// Create a copy of GroceryData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroceryDataCopyWith<GroceryData> get copyWith => _$GroceryDataCopyWithImpl<GroceryData>(this as GroceryData, _$identity);

  /// Serializes this GroceryData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroceryData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.normalAmount, normalAmount) || other.normalAmount == normalAmount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.conversionAmount, conversionAmount) || other.conversionAmount == conversionAmount)&&(identical(other.conversionUnit, conversionUnit) || other.conversionUnit == conversionUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,normalAmount,unit,conversionAmount,conversionUnit);

@override
String toString() {
  return 'GroceryData(id: $id, name: $name, normalAmount: $normalAmount, unit: $unit, conversionAmount: $conversionAmount, conversionUnit: $conversionUnit)';
}


}

/// @nodoc
abstract mixin class $GroceryDataCopyWith<$Res>  {
  factory $GroceryDataCopyWith(GroceryData value, $Res Function(GroceryData) _then) = _$GroceryDataCopyWithImpl;
@useResult
$Res call({
 String id, String name, double normalAmount, UnitEnum unit, double conversionAmount, UnitEnum conversionUnit
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? normalAmount = null,Object? unit = null,Object? conversionAmount = null,Object? conversionUnit = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,normalAmount: null == normalAmount ? _self.normalAmount : normalAmount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEnum,conversionAmount: null == conversionAmount ? _self.conversionAmount : conversionAmount // ignore: cast_nullable_to_non_nullable
as double,conversionUnit: null == conversionUnit ? _self.conversionUnit : conversionUnit // ignore: cast_nullable_to_non_nullable
as UnitEnum,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GroceryData implements GroceryData {
  const _GroceryData({required this.id, required this.name, required this.normalAmount, required this.unit, required this.conversionAmount, required this.conversionUnit});
  factory _GroceryData.fromJson(Map<String, dynamic> json) => _$GroceryDataFromJson(json);

@override final  String id;
@override final  String name;
@override final  double normalAmount;
@override final  UnitEnum unit;
@override final  double conversionAmount;
@override final  UnitEnum conversionUnit;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroceryData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.normalAmount, normalAmount) || other.normalAmount == normalAmount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.conversionAmount, conversionAmount) || other.conversionAmount == conversionAmount)&&(identical(other.conversionUnit, conversionUnit) || other.conversionUnit == conversionUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,normalAmount,unit,conversionAmount,conversionUnit);

@override
String toString() {
  return 'GroceryData(id: $id, name: $name, normalAmount: $normalAmount, unit: $unit, conversionAmount: $conversionAmount, conversionUnit: $conversionUnit)';
}


}

/// @nodoc
abstract mixin class _$GroceryDataCopyWith<$Res> implements $GroceryDataCopyWith<$Res> {
  factory _$GroceryDataCopyWith(_GroceryData value, $Res Function(_GroceryData) _then) = __$GroceryDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double normalAmount, UnitEnum unit, double conversionAmount, UnitEnum conversionUnit
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? normalAmount = null,Object? unit = null,Object? conversionAmount = null,Object? conversionUnit = null,}) {
  return _then(_GroceryData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,normalAmount: null == normalAmount ? _self.normalAmount : normalAmount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEnum,conversionAmount: null == conversionAmount ? _self.conversionAmount : conversionAmount // ignore: cast_nullable_to_non_nullable
as double,conversionUnit: null == conversionUnit ? _self.conversionUnit : conversionUnit // ignore: cast_nullable_to_non_nullable
as UnitEnum,
  ));
}


}

// dart format on
