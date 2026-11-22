// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backend_config_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackendConfigData {

 String get url; String get key;
/// Create a copy of BackendConfigData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackendConfigDataCopyWith<BackendConfigData> get copyWith => _$BackendConfigDataCopyWithImpl<BackendConfigData>(this as BackendConfigData, _$identity);

  /// Serializes this BackendConfigData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BackendConfigData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackendConfigData&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.key, _this.key) || other.key == _this.key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BackendConfigData;
  return Object.hash(runtimeType,_this.url,_this.key);
}

@override
String toString() {
  final _this = this as BackendConfigData;
  return 'BackendConfigData(url: ${_this.url}, key: ${_this.key})';
}


}

/// @nodoc
abstract mixin class $BackendConfigDataCopyWith<$Res>  {
  factory $BackendConfigDataCopyWith(BackendConfigData value, $Res Function(BackendConfigData) _then) = _$BackendConfigDataCopyWithImpl;
@useResult
$Res call({
 String url, String key
});




}
/// @nodoc
class _$BackendConfigDataCopyWithImpl<$Res>
    implements $BackendConfigDataCopyWith<$Res> {
  _$BackendConfigDataCopyWithImpl(this._self, this._then);

  final BackendConfigData _self;
  final $Res Function(BackendConfigData) _then;

/// Create a copy of BackendConfigData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? key = null,}) {
  return _then(BackendConfigData(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BackendConfigData].
extension BackendConfigDataPatterns on BackendConfigData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackendConfigData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackendConfigData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackendConfigData value)  $default,){
final _that = this;
switch (_that) {
case _BackendConfigData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackendConfigData value)?  $default,){
final _that = this;
switch (_that) {
case _BackendConfigData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String key)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackendConfigData() when $default != null:
return $default(_that.url,_that.key);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String key)  $default,) {final _that = this;
switch (_that) {
case _BackendConfigData():
return $default(_that.url,_that.key);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String key)?  $default,) {final _that = this;
switch (_that) {
case _BackendConfigData() when $default != null:
return $default(_that.url,_that.key);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BackendConfigData extends BackendConfigData {
  const _BackendConfigData({required this.url, required this.key}): super._();
  factory _BackendConfigData.fromJson(Map<String, dynamic> json) => _$BackendConfigDataFromJson(json);

@override final  String url;
@override final  String key;

/// Create a copy of BackendConfigData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackendConfigDataCopyWith<_BackendConfigData> get copyWith => __$BackendConfigDataCopyWithImpl<_BackendConfigData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackendConfigDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackendConfigData&&(identical(other.url, url) || other.url == url)&&(identical(other.key, key) || other.key == key));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,url,key);
}

@override
String toString() {
    return 'BackendConfigData(url: $url, key: $key)';
}


}

/// @nodoc
abstract mixin class _$BackendConfigDataCopyWith<$Res> implements $BackendConfigDataCopyWith<$Res> {
  factory _$BackendConfigDataCopyWith(_BackendConfigData value, $Res Function(_BackendConfigData) _then) = __$BackendConfigDataCopyWithImpl;
@override @useResult
$Res call({
 String url, String key
});




}
/// @nodoc
class __$BackendConfigDataCopyWithImpl<$Res>
    implements _$BackendConfigDataCopyWith<$Res> {
  __$BackendConfigDataCopyWithImpl(this._self, this._then);

  final _BackendConfigData _self;
  final $Res Function(_BackendConfigData) _then;

/// Create a copy of BackendConfigData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? key = null,}) {
  return _then(_BackendConfigData(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
