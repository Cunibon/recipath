// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FileData {

 String get fileName; bool get uploaded;
/// Create a copy of FileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileDataCopyWith<FileData> get copyWith => _$FileDataCopyWithImpl<FileData>(this as FileData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileData&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}


@override
int get hashCode => Object.hash(runtimeType,fileName,uploaded);

@override
String toString() {
  return 'FileData(fileName: $fileName, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class $FileDataCopyWith<$Res>  {
  factory $FileDataCopyWith(FileData value, $Res Function(FileData) _then) = _$FileDataCopyWithImpl;
@useResult
$Res call({
 String fileName, bool uploaded
});




}
/// @nodoc
class _$FileDataCopyWithImpl<$Res>
    implements $FileDataCopyWith<$Res> {
  _$FileDataCopyWithImpl(this._self, this._then);

  final FileData _self;
  final $Res Function(FileData) _then;

/// Create a copy of FileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileName = null,Object? uploaded = null,}) {
  return _then(_self.copyWith(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FileData].
extension FileDataPatterns on FileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileData value)  $default,){
final _that = this;
switch (_that) {
case _FileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileData value)?  $default,){
final _that = this;
switch (_that) {
case _FileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fileName,  bool uploaded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileData() when $default != null:
return $default(_that.fileName,_that.uploaded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fileName,  bool uploaded)  $default,) {final _that = this;
switch (_that) {
case _FileData():
return $default(_that.fileName,_that.uploaded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fileName,  bool uploaded)?  $default,) {final _that = this;
switch (_that) {
case _FileData() when $default != null:
return $default(_that.fileName,_that.uploaded);case _:
  return null;

}
}

}

/// @nodoc


class _FileData implements FileData {
  const _FileData({required this.fileName, required this.uploaded});
  

@override final  String fileName;
@override final  bool uploaded;

/// Create a copy of FileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileDataCopyWith<_FileData> get copyWith => __$FileDataCopyWithImpl<_FileData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileData&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.uploaded, uploaded) || other.uploaded == uploaded));
}


@override
int get hashCode => Object.hash(runtimeType,fileName,uploaded);

@override
String toString() {
  return 'FileData(fileName: $fileName, uploaded: $uploaded)';
}


}

/// @nodoc
abstract mixin class _$FileDataCopyWith<$Res> implements $FileDataCopyWith<$Res> {
  factory _$FileDataCopyWith(_FileData value, $Res Function(_FileData) _then) = __$FileDataCopyWithImpl;
@override @useResult
$Res call({
 String fileName, bool uploaded
});




}
/// @nodoc
class __$FileDataCopyWithImpl<$Res>
    implements _$FileDataCopyWith<$Res> {
  __$FileDataCopyWithImpl(this._self, this._then);

  final _FileData _self;
  final $Res Function(_FileData) _then;

/// Create a copy of FileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? uploaded = null,}) {
  return _then(_FileData(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,uploaded: null == uploaded ? _self.uploaded : uploaded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
