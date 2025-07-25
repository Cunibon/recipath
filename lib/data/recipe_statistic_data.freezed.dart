// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 String get id; DateTime get startDate; DateTime get endDate; RecipeStepData get data;
/// Create a copy of RecipeStatisticData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeStatisticDataCopyWith<RecipeStatisticData> get copyWith => _$RecipeStatisticDataCopyWithImpl<RecipeStatisticData>(this as RecipeStatisticData, _$identity);

  /// Serializes this RecipeStatisticData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeStatisticData&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,endDate,data);

@override
String toString() {
  return 'RecipeStatisticData(id: $id, startDate: $startDate, endDate: $endDate, data: $data)';
}


}

/// @nodoc
abstract mixin class $RecipeStatisticDataCopyWith<$Res>  {
  factory $RecipeStatisticDataCopyWith(RecipeStatisticData value, $Res Function(RecipeStatisticData) _then) = _$RecipeStatisticDataCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startDate, DateTime endDate, RecipeStepData data
});


$RecipeStepDataCopyWith<$Res> get data;

}
/// @nodoc
class _$RecipeStatisticDataCopyWithImpl<$Res>
    implements $RecipeStatisticDataCopyWith<$Res> {
  _$RecipeStatisticDataCopyWithImpl(this._self, this._then);

  final RecipeStatisticData _self;
  final $Res Function(RecipeStatisticData) _then;

/// Create a copy of RecipeStatisticData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startDate = null,Object? endDate = null,Object? data = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RecipeStepData,
  ));
}
/// Create a copy of RecipeStatisticData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeStepDataCopyWith<$Res> get data {
  
  return $RecipeStepDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _RecipeStatisticData implements RecipeStatisticData {
  const _RecipeStatisticData({required this.id, required this.startDate, required this.endDate, required this.data});
  factory _RecipeStatisticData.fromJson(Map<String, dynamic> json) => _$RecipeStatisticDataFromJson(json);

@override final  String id;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  RecipeStepData data;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeStatisticData&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,endDate,data);

@override
String toString() {
  return 'RecipeStatisticData(id: $id, startDate: $startDate, endDate: $endDate, data: $data)';
}


}

/// @nodoc
abstract mixin class _$RecipeStatisticDataCopyWith<$Res> implements $RecipeStatisticDataCopyWith<$Res> {
  factory _$RecipeStatisticDataCopyWith(_RecipeStatisticData value, $Res Function(_RecipeStatisticData) _then) = __$RecipeStatisticDataCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startDate, DateTime endDate, RecipeStepData data
});


@override $RecipeStepDataCopyWith<$Res> get data;

}
/// @nodoc
class __$RecipeStatisticDataCopyWithImpl<$Res>
    implements _$RecipeStatisticDataCopyWith<$Res> {
  __$RecipeStatisticDataCopyWithImpl(this._self, this._then);

  final _RecipeStatisticData _self;
  final $Res Function(_RecipeStatisticData) _then;

/// Create a copy of RecipeStatisticData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? endDate = null,Object? data = null,}) {
  return _then(_RecipeStatisticData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RecipeStepData,
  ));
}

/// Create a copy of RecipeStatisticData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeStepDataCopyWith<$Res> get data {
  
  return $RecipeStepDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
