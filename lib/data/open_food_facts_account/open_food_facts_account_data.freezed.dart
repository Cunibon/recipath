// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_food_facts_account_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpenFoodFactsAccountData {

 String get username; String get password; String get appUuid;
/// Create a copy of OpenFoodFactsAccountData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenFoodFactsAccountDataCopyWith<OpenFoodFactsAccountData> get copyWith => _$OpenFoodFactsAccountDataCopyWithImpl<OpenFoodFactsAccountData>(this as OpenFoodFactsAccountData, _$identity);

  /// Serializes this OpenFoodFactsAccountData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OpenFoodFactsAccountData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenFoodFactsAccountData&&(identical(other.username, _this.username) || other.username == _this.username)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.appUuid, _this.appUuid) || other.appUuid == _this.appUuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OpenFoodFactsAccountData;
  return Object.hash(runtimeType,_this.username,_this.password,_this.appUuid);
}

@override
String toString() {
  final _this = this as OpenFoodFactsAccountData;
  return 'OpenFoodFactsAccountData(username: ${_this.username}, password: ${_this.password}, appUuid: ${_this.appUuid})';
}


}

/// @nodoc
abstract mixin class $OpenFoodFactsAccountDataCopyWith<$Res>  {
  factory $OpenFoodFactsAccountDataCopyWith(OpenFoodFactsAccountData value, $Res Function(OpenFoodFactsAccountData) _then) = _$OpenFoodFactsAccountDataCopyWithImpl;
@useResult
$Res call({
 String username, String password, String appUuid
});




}
/// @nodoc
class _$OpenFoodFactsAccountDataCopyWithImpl<$Res>
    implements $OpenFoodFactsAccountDataCopyWith<$Res> {
  _$OpenFoodFactsAccountDataCopyWithImpl(this._self, this._then);

  final OpenFoodFactsAccountData _self;
  final $Res Function(OpenFoodFactsAccountData) _then;

/// Create a copy of OpenFoodFactsAccountData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = null,Object? password = null,Object? appUuid = null,}) {
  return _then(OpenFoodFactsAccountData(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,appUuid: null == appUuid ? _self.appUuid : appUuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenFoodFactsAccountData].
extension OpenFoodFactsAccountDataPatterns on OpenFoodFactsAccountData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenFoodFactsAccountData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenFoodFactsAccountData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenFoodFactsAccountData value)  $default,){
final _that = this;
switch (_that) {
case _OpenFoodFactsAccountData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenFoodFactsAccountData value)?  $default,){
final _that = this;
switch (_that) {
case _OpenFoodFactsAccountData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String username,  String password,  String appUuid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenFoodFactsAccountData() when $default != null:
return $default(_that.username,_that.password,_that.appUuid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String username,  String password,  String appUuid)  $default,) {final _that = this;
switch (_that) {
case _OpenFoodFactsAccountData():
return $default(_that.username,_that.password,_that.appUuid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String username,  String password,  String appUuid)?  $default,) {final _that = this;
switch (_that) {
case _OpenFoodFactsAccountData() when $default != null:
return $default(_that.username,_that.password,_that.appUuid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenFoodFactsAccountData implements OpenFoodFactsAccountData {
  const _OpenFoodFactsAccountData({required this.username, required this.password, required this.appUuid});
  factory _OpenFoodFactsAccountData.fromJson(Map<String, dynamic> json) => _$OpenFoodFactsAccountDataFromJson(json);

@override final  String username;
@override final  String password;
@override final  String appUuid;

/// Create a copy of OpenFoodFactsAccountData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenFoodFactsAccountDataCopyWith<_OpenFoodFactsAccountData> get copyWith => __$OpenFoodFactsAccountDataCopyWithImpl<_OpenFoodFactsAccountData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenFoodFactsAccountDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenFoodFactsAccountData&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.appUuid, appUuid) || other.appUuid == appUuid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,username,password,appUuid);
}

@override
String toString() {
    return 'OpenFoodFactsAccountData(username: $username, password: $password, appUuid: $appUuid)';
}


}

/// @nodoc
abstract mixin class _$OpenFoodFactsAccountDataCopyWith<$Res> implements $OpenFoodFactsAccountDataCopyWith<$Res> {
  factory _$OpenFoodFactsAccountDataCopyWith(_OpenFoodFactsAccountData value, $Res Function(_OpenFoodFactsAccountData) _then) = __$OpenFoodFactsAccountDataCopyWithImpl;
@override @useResult
$Res call({
 String username, String password, String appUuid
});




}
/// @nodoc
class __$OpenFoodFactsAccountDataCopyWithImpl<$Res>
    implements _$OpenFoodFactsAccountDataCopyWith<$Res> {
  __$OpenFoodFactsAccountDataCopyWithImpl(this._self, this._then);

  final _OpenFoodFactsAccountData _self;
  final $Res Function(_OpenFoodFactsAccountData) _then;

/// Create a copy of OpenFoodFactsAccountData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,Object? appUuid = null,}) {
  return _then(_OpenFoodFactsAccountData(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,appUuid: null == appUuid ? _self.appUuid : appUuid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
