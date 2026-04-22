// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_provider_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiProviderData {

 String get token; AiProviderEnum get provider;
/// Create a copy of AiProviderData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiProviderDataCopyWith<AiProviderData> get copyWith => _$AiProviderDataCopyWithImpl<AiProviderData>(this as AiProviderData, _$identity);

  /// Serializes this AiProviderData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiProviderData&&(identical(other.token, token) || other.token == token)&&(identical(other.provider, provider) || other.provider == provider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,provider);

@override
String toString() {
  return 'AiProviderData(token: $token, provider: $provider)';
}


}

/// @nodoc
abstract mixin class $AiProviderDataCopyWith<$Res>  {
  factory $AiProviderDataCopyWith(AiProviderData value, $Res Function(AiProviderData) _then) = _$AiProviderDataCopyWithImpl;
@useResult
$Res call({
 String token, AiProviderEnum provider
});




}
/// @nodoc
class _$AiProviderDataCopyWithImpl<$Res>
    implements $AiProviderDataCopyWith<$Res> {
  _$AiProviderDataCopyWithImpl(this._self, this._then);

  final AiProviderData _self;
  final $Res Function(AiProviderData) _then;

/// Create a copy of AiProviderData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? provider = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderEnum,
  ));
}

}


/// Adds pattern-matching-related methods to [AiProviderData].
extension AiProviderDataPatterns on AiProviderData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiProviderData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiProviderData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiProviderData value)  $default,){
final _that = this;
switch (_that) {
case _AiProviderData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiProviderData value)?  $default,){
final _that = this;
switch (_that) {
case _AiProviderData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  AiProviderEnum provider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiProviderData() when $default != null:
return $default(_that.token,_that.provider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  AiProviderEnum provider)  $default,) {final _that = this;
switch (_that) {
case _AiProviderData():
return $default(_that.token,_that.provider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  AiProviderEnum provider)?  $default,) {final _that = this;
switch (_that) {
case _AiProviderData() when $default != null:
return $default(_that.token,_that.provider);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiProviderData implements AiProviderData {
  const _AiProviderData({required this.token, required this.provider});
  factory _AiProviderData.fromJson(Map<String, dynamic> json) => _$AiProviderDataFromJson(json);

@override final  String token;
@override final  AiProviderEnum provider;

/// Create a copy of AiProviderData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiProviderDataCopyWith<_AiProviderData> get copyWith => __$AiProviderDataCopyWithImpl<_AiProviderData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiProviderDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiProviderData&&(identical(other.token, token) || other.token == token)&&(identical(other.provider, provider) || other.provider == provider));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,provider);

@override
String toString() {
  return 'AiProviderData(token: $token, provider: $provider)';
}


}

/// @nodoc
abstract mixin class _$AiProviderDataCopyWith<$Res> implements $AiProviderDataCopyWith<$Res> {
  factory _$AiProviderDataCopyWith(_AiProviderData value, $Res Function(_AiProviderData) _then) = __$AiProviderDataCopyWithImpl;
@override @useResult
$Res call({
 String token, AiProviderEnum provider
});




}
/// @nodoc
class __$AiProviderDataCopyWithImpl<$Res>
    implements _$AiProviderDataCopyWith<$Res> {
  __$AiProviderDataCopyWithImpl(this._self, this._then);

  final _AiProviderData _self;
  final $Res Function(_AiProviderData) _then;

/// Create a copy of AiProviderData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? provider = null,}) {
  return _then(_AiProviderData(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AiProviderEnum,
  ));
}


}

// dart format on
