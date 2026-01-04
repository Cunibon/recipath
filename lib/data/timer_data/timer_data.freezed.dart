// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerData {

 DateTime get startTime; int? get servings; Set<String> get finishedSteps;
/// Create a copy of TimerData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerDataCopyWith<TimerData> get copyWith => _$TimerDataCopyWithImpl<TimerData>(this as TimerData, _$identity);

  /// Serializes this TimerData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerData&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.servings, servings) || other.servings == servings)&&const DeepCollectionEquality().equals(other.finishedSteps, finishedSteps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,servings,const DeepCollectionEquality().hash(finishedSteps));

@override
String toString() {
  return 'TimerData(startTime: $startTime, servings: $servings, finishedSteps: $finishedSteps)';
}


}

/// @nodoc
abstract mixin class $TimerDataCopyWith<$Res>  {
  factory $TimerDataCopyWith(TimerData value, $Res Function(TimerData) _then) = _$TimerDataCopyWithImpl;
@useResult
$Res call({
 DateTime startTime, int? servings, Set<String> finishedSteps
});




}
/// @nodoc
class _$TimerDataCopyWithImpl<$Res>
    implements $TimerDataCopyWith<$Res> {
  _$TimerDataCopyWithImpl(this._self, this._then);

  final TimerData _self;
  final $Res Function(TimerData) _then;

/// Create a copy of TimerData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startTime = null,Object? servings = freezed,Object? finishedSteps = null,}) {
  return _then(_self.copyWith(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,servings: freezed == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int?,finishedSteps: null == finishedSteps ? _self.finishedSteps : finishedSteps // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TimerData].
extension TimerDataPatterns on TimerData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerData value)  $default,){
final _that = this;
switch (_that) {
case _TimerData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerData value)?  $default,){
final _that = this;
switch (_that) {
case _TimerData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime startTime,  int? servings,  Set<String> finishedSteps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerData() when $default != null:
return $default(_that.startTime,_that.servings,_that.finishedSteps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime startTime,  int? servings,  Set<String> finishedSteps)  $default,) {final _that = this;
switch (_that) {
case _TimerData():
return $default(_that.startTime,_that.servings,_that.finishedSteps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime startTime,  int? servings,  Set<String> finishedSteps)?  $default,) {final _that = this;
switch (_that) {
case _TimerData() when $default != null:
return $default(_that.startTime,_that.servings,_that.finishedSteps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimerData implements TimerData {
  const _TimerData({required this.startTime, required this.servings, required final  Set<String> finishedSteps}): _finishedSteps = finishedSteps;
  factory _TimerData.fromJson(Map<String, dynamic> json) => _$TimerDataFromJson(json);

@override final  DateTime startTime;
@override final  int? servings;
 final  Set<String> _finishedSteps;
@override Set<String> get finishedSteps {
  if (_finishedSteps is EqualUnmodifiableSetView) return _finishedSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_finishedSteps);
}


/// Create a copy of TimerData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerDataCopyWith<_TimerData> get copyWith => __$TimerDataCopyWithImpl<_TimerData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimerDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerData&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.servings, servings) || other.servings == servings)&&const DeepCollectionEquality().equals(other._finishedSteps, _finishedSteps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,servings,const DeepCollectionEquality().hash(_finishedSteps));

@override
String toString() {
  return 'TimerData(startTime: $startTime, servings: $servings, finishedSteps: $finishedSteps)';
}


}

/// @nodoc
abstract mixin class _$TimerDataCopyWith<$Res> implements $TimerDataCopyWith<$Res> {
  factory _$TimerDataCopyWith(_TimerData value, $Res Function(_TimerData) _then) = __$TimerDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime startTime, int? servings, Set<String> finishedSteps
});




}
/// @nodoc
class __$TimerDataCopyWithImpl<$Res>
    implements _$TimerDataCopyWith<$Res> {
  __$TimerDataCopyWithImpl(this._self, this._then);

  final _TimerData _self;
  final $Res Function(_TimerData) _then;

/// Create a copy of TimerData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startTime = null,Object? servings = freezed,Object? finishedSteps = null,}) {
  return _then(_TimerData(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,servings: freezed == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as int?,finishedSteps: null == finishedSteps ? _self._finishedSteps : finishedSteps // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
