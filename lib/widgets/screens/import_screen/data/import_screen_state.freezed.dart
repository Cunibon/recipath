// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImportScreenState {

 String get path; List<RecipeData> get originalRecipe; Map<String, GroceryData> get originalGrocery; List<RecipeData> get importRecipe; Map<String, GroceryData> get importGroceryLookup;
/// Create a copy of ImportScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportScreenStateCopyWith<ImportScreenState> get copyWith => _$ImportScreenStateCopyWithImpl<ImportScreenState>(this as ImportScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportScreenState&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.originalRecipe, originalRecipe)&&const DeepCollectionEquality().equals(other.originalGrocery, originalGrocery)&&const DeepCollectionEquality().equals(other.importRecipe, importRecipe)&&const DeepCollectionEquality().equals(other.importGroceryLookup, importGroceryLookup));
}


@override
int get hashCode => Object.hash(runtimeType,path,const DeepCollectionEquality().hash(originalRecipe),const DeepCollectionEquality().hash(originalGrocery),const DeepCollectionEquality().hash(importRecipe),const DeepCollectionEquality().hash(importGroceryLookup));

@override
String toString() {
  return 'ImportScreenState(path: $path, originalRecipe: $originalRecipe, originalGrocery: $originalGrocery, importRecipe: $importRecipe, importGroceryLookup: $importGroceryLookup)';
}


}

/// @nodoc
abstract mixin class $ImportScreenStateCopyWith<$Res>  {
  factory $ImportScreenStateCopyWith(ImportScreenState value, $Res Function(ImportScreenState) _then) = _$ImportScreenStateCopyWithImpl;
@useResult
$Res call({
 String path, List<RecipeData> originalRecipe, Map<String, GroceryData> originalGrocery, List<RecipeData> importRecipe, Map<String, GroceryData> importGroceryLookup
});




}
/// @nodoc
class _$ImportScreenStateCopyWithImpl<$Res>
    implements $ImportScreenStateCopyWith<$Res> {
  _$ImportScreenStateCopyWithImpl(this._self, this._then);

  final ImportScreenState _self;
  final $Res Function(ImportScreenState) _then;

/// Create a copy of ImportScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? originalRecipe = null,Object? originalGrocery = null,Object? importRecipe = null,Object? importGroceryLookup = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,originalRecipe: null == originalRecipe ? _self.originalRecipe : originalRecipe // ignore: cast_nullable_to_non_nullable
as List<RecipeData>,originalGrocery: null == originalGrocery ? _self.originalGrocery : originalGrocery // ignore: cast_nullable_to_non_nullable
as Map<String, GroceryData>,importRecipe: null == importRecipe ? _self.importRecipe : importRecipe // ignore: cast_nullable_to_non_nullable
as List<RecipeData>,importGroceryLookup: null == importGroceryLookup ? _self.importGroceryLookup : importGroceryLookup // ignore: cast_nullable_to_non_nullable
as Map<String, GroceryData>,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportScreenState].
extension ImportScreenStatePatterns on ImportScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportScreenState value)  $default,){
final _that = this;
switch (_that) {
case _ImportScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _ImportScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  List<RecipeData> originalRecipe,  Map<String, GroceryData> originalGrocery,  List<RecipeData> importRecipe,  Map<String, GroceryData> importGroceryLookup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportScreenState() when $default != null:
return $default(_that.path,_that.originalRecipe,_that.originalGrocery,_that.importRecipe,_that.importGroceryLookup);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  List<RecipeData> originalRecipe,  Map<String, GroceryData> originalGrocery,  List<RecipeData> importRecipe,  Map<String, GroceryData> importGroceryLookup)  $default,) {final _that = this;
switch (_that) {
case _ImportScreenState():
return $default(_that.path,_that.originalRecipe,_that.originalGrocery,_that.importRecipe,_that.importGroceryLookup);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  List<RecipeData> originalRecipe,  Map<String, GroceryData> originalGrocery,  List<RecipeData> importRecipe,  Map<String, GroceryData> importGroceryLookup)?  $default,) {final _that = this;
switch (_that) {
case _ImportScreenState() when $default != null:
return $default(_that.path,_that.originalRecipe,_that.originalGrocery,_that.importRecipe,_that.importGroceryLookup);case _:
  return null;

}
}

}

/// @nodoc


class _ImportScreenState implements ImportScreenState {
  const _ImportScreenState({required this.path, required final  List<RecipeData> originalRecipe, required final  Map<String, GroceryData> originalGrocery, required final  List<RecipeData> importRecipe, required final  Map<String, GroceryData> importGroceryLookup}): _originalRecipe = originalRecipe,_originalGrocery = originalGrocery,_importRecipe = importRecipe,_importGroceryLookup = importGroceryLookup;
  

@override final  String path;
 final  List<RecipeData> _originalRecipe;
@override List<RecipeData> get originalRecipe {
  if (_originalRecipe is EqualUnmodifiableListView) return _originalRecipe;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_originalRecipe);
}

 final  Map<String, GroceryData> _originalGrocery;
@override Map<String, GroceryData> get originalGrocery {
  if (_originalGrocery is EqualUnmodifiableMapView) return _originalGrocery;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_originalGrocery);
}

 final  List<RecipeData> _importRecipe;
@override List<RecipeData> get importRecipe {
  if (_importRecipe is EqualUnmodifiableListView) return _importRecipe;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_importRecipe);
}

 final  Map<String, GroceryData> _importGroceryLookup;
@override Map<String, GroceryData> get importGroceryLookup {
  if (_importGroceryLookup is EqualUnmodifiableMapView) return _importGroceryLookup;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_importGroceryLookup);
}


/// Create a copy of ImportScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportScreenStateCopyWith<_ImportScreenState> get copyWith => __$ImportScreenStateCopyWithImpl<_ImportScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportScreenState&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other._originalRecipe, _originalRecipe)&&const DeepCollectionEquality().equals(other._originalGrocery, _originalGrocery)&&const DeepCollectionEquality().equals(other._importRecipe, _importRecipe)&&const DeepCollectionEquality().equals(other._importGroceryLookup, _importGroceryLookup));
}


@override
int get hashCode => Object.hash(runtimeType,path,const DeepCollectionEquality().hash(_originalRecipe),const DeepCollectionEquality().hash(_originalGrocery),const DeepCollectionEquality().hash(_importRecipe),const DeepCollectionEquality().hash(_importGroceryLookup));

@override
String toString() {
  return 'ImportScreenState(path: $path, originalRecipe: $originalRecipe, originalGrocery: $originalGrocery, importRecipe: $importRecipe, importGroceryLookup: $importGroceryLookup)';
}


}

/// @nodoc
abstract mixin class _$ImportScreenStateCopyWith<$Res> implements $ImportScreenStateCopyWith<$Res> {
  factory _$ImportScreenStateCopyWith(_ImportScreenState value, $Res Function(_ImportScreenState) _then) = __$ImportScreenStateCopyWithImpl;
@override @useResult
$Res call({
 String path, List<RecipeData> originalRecipe, Map<String, GroceryData> originalGrocery, List<RecipeData> importRecipe, Map<String, GroceryData> importGroceryLookup
});




}
/// @nodoc
class __$ImportScreenStateCopyWithImpl<$Res>
    implements _$ImportScreenStateCopyWith<$Res> {
  __$ImportScreenStateCopyWithImpl(this._self, this._then);

  final _ImportScreenState _self;
  final $Res Function(_ImportScreenState) _then;

/// Create a copy of ImportScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? originalRecipe = null,Object? originalGrocery = null,Object? importRecipe = null,Object? importGroceryLookup = null,}) {
  return _then(_ImportScreenState(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,originalRecipe: null == originalRecipe ? _self._originalRecipe : originalRecipe // ignore: cast_nullable_to_non_nullable
as List<RecipeData>,originalGrocery: null == originalGrocery ? _self._originalGrocery : originalGrocery // ignore: cast_nullable_to_non_nullable
as Map<String, GroceryData>,importRecipe: null == importRecipe ? _self._importRecipe : importRecipe // ignore: cast_nullable_to_non_nullable
as List<RecipeData>,importGroceryLookup: null == importGroceryLookup ? _self._importGroceryLookup : importGroceryLookup // ignore: cast_nullable_to_non_nullable
as Map<String, GroceryData>,
  ));
}


}

// dart format on
