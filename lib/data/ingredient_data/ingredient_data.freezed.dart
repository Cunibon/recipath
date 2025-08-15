// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientData {

 String get id; double get amount; UnitEnum get unit; String get groceryId;
/// Create a copy of IngredientData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientDataCopyWith<IngredientData> get copyWith => _$IngredientDataCopyWithImpl<IngredientData>(this as IngredientData, _$identity);

  /// Serializes this IngredientData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientData&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.groceryId, groceryId) || other.groceryId == groceryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,unit,groceryId);

@override
String toString() {
  return 'IngredientData(id: $id, amount: $amount, unit: $unit, groceryId: $groceryId)';
}


}

/// @nodoc
abstract mixin class $IngredientDataCopyWith<$Res>  {
  factory $IngredientDataCopyWith(IngredientData value, $Res Function(IngredientData) _then) = _$IngredientDataCopyWithImpl;
@useResult
$Res call({
 String id, double amount, UnitEnum unit, String groceryId
});




}
/// @nodoc
class _$IngredientDataCopyWithImpl<$Res>
    implements $IngredientDataCopyWith<$Res> {
  _$IngredientDataCopyWithImpl(this._self, this._then);

  final IngredientData _self;
  final $Res Function(IngredientData) _then;

/// Create a copy of IngredientData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? amount = null,Object? unit = null,Object? groceryId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEnum,groceryId: null == groceryId ? _self.groceryId : groceryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IngredientData].
extension IngredientDataPatterns on IngredientData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientData value)  $default,){
final _that = this;
switch (_that) {
case _IngredientData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientData value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double amount,  UnitEnum unit,  String groceryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientData() when $default != null:
return $default(_that.id,_that.amount,_that.unit,_that.groceryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double amount,  UnitEnum unit,  String groceryId)  $default,) {final _that = this;
switch (_that) {
case _IngredientData():
return $default(_that.id,_that.amount,_that.unit,_that.groceryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double amount,  UnitEnum unit,  String groceryId)?  $default,) {final _that = this;
switch (_that) {
case _IngredientData() when $default != null:
return $default(_that.id,_that.amount,_that.unit,_that.groceryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IngredientData implements IngredientData {
  const _IngredientData({required this.id, required this.amount, required this.unit, required this.groceryId});
  factory _IngredientData.fromJson(Map<String, dynamic> json) => _$IngredientDataFromJson(json);

@override final  String id;
@override final  double amount;
@override final  UnitEnum unit;
@override final  String groceryId;

/// Create a copy of IngredientData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientDataCopyWith<_IngredientData> get copyWith => __$IngredientDataCopyWithImpl<_IngredientData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientData&&(identical(other.id, id) || other.id == id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.groceryId, groceryId) || other.groceryId == groceryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,amount,unit,groceryId);

@override
String toString() {
  return 'IngredientData(id: $id, amount: $amount, unit: $unit, groceryId: $groceryId)';
}


}

/// @nodoc
abstract mixin class _$IngredientDataCopyWith<$Res> implements $IngredientDataCopyWith<$Res> {
  factory _$IngredientDataCopyWith(_IngredientData value, $Res Function(_IngredientData) _then) = __$IngredientDataCopyWithImpl;
@override @useResult
$Res call({
 String id, double amount, UnitEnum unit, String groceryId
});




}
/// @nodoc
class __$IngredientDataCopyWithImpl<$Res>
    implements _$IngredientDataCopyWith<$Res> {
  __$IngredientDataCopyWithImpl(this._self, this._then);

  final _IngredientData _self;
  final $Res Function(_IngredientData) _then;

/// Create a copy of IngredientData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? amount = null,Object? unit = null,Object? groceryId = null,}) {
  return _then(_IngredientData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEnum,groceryId: null == groceryId ? _self.groceryId : groceryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
