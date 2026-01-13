// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImportData {

 List<RecipeData> get recipes; Map<String, GroceryData> get groceries;
/// Create a copy of ImportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportDataCopyWith<ImportData> get copyWith => _$ImportDataCopyWithImpl<ImportData>(this as ImportData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportData&&const DeepCollectionEquality().equals(other.recipes, recipes)&&const DeepCollectionEquality().equals(other.groceries, groceries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recipes),const DeepCollectionEquality().hash(groceries));

@override
String toString() {
  return 'ImportData(recipes: $recipes, groceries: $groceries)';
}


}

/// @nodoc
abstract mixin class $ImportDataCopyWith<$Res>  {
  factory $ImportDataCopyWith(ImportData value, $Res Function(ImportData) _then) = _$ImportDataCopyWithImpl;
@useResult
$Res call({
 List<RecipeData> recipes, Map<String, GroceryData> groceries
});




}
/// @nodoc
class _$ImportDataCopyWithImpl<$Res>
    implements $ImportDataCopyWith<$Res> {
  _$ImportDataCopyWithImpl(this._self, this._then);

  final ImportData _self;
  final $Res Function(ImportData) _then;

/// Create a copy of ImportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipes = null,Object? groceries = null,}) {
  return _then(_self.copyWith(
recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<RecipeData>,groceries: null == groceries ? _self.groceries : groceries // ignore: cast_nullable_to_non_nullable
as Map<String, GroceryData>,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportData].
extension ImportDataPatterns on ImportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportData value)  $default,){
final _that = this;
switch (_that) {
case _ImportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportData value)?  $default,){
final _that = this;
switch (_that) {
case _ImportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RecipeData> recipes,  Map<String, GroceryData> groceries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportData() when $default != null:
return $default(_that.recipes,_that.groceries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RecipeData> recipes,  Map<String, GroceryData> groceries)  $default,) {final _that = this;
switch (_that) {
case _ImportData():
return $default(_that.recipes,_that.groceries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RecipeData> recipes,  Map<String, GroceryData> groceries)?  $default,) {final _that = this;
switch (_that) {
case _ImportData() when $default != null:
return $default(_that.recipes,_that.groceries);case _:
  return null;

}
}

}

/// @nodoc


class _ImportData implements ImportData {
  const _ImportData({required final  List<RecipeData> recipes, required final  Map<String, GroceryData> groceries}): _recipes = recipes,_groceries = groceries;
  

 final  List<RecipeData> _recipes;
@override List<RecipeData> get recipes {
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipes);
}

 final  Map<String, GroceryData> _groceries;
@override Map<String, GroceryData> get groceries {
  if (_groceries is EqualUnmodifiableMapView) return _groceries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_groceries);
}


/// Create a copy of ImportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportDataCopyWith<_ImportData> get copyWith => __$ImportDataCopyWithImpl<_ImportData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportData&&const DeepCollectionEquality().equals(other._recipes, _recipes)&&const DeepCollectionEquality().equals(other._groceries, _groceries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recipes),const DeepCollectionEquality().hash(_groceries));

@override
String toString() {
  return 'ImportData(recipes: $recipes, groceries: $groceries)';
}


}

/// @nodoc
abstract mixin class _$ImportDataCopyWith<$Res> implements $ImportDataCopyWith<$Res> {
  factory _$ImportDataCopyWith(_ImportData value, $Res Function(_ImportData) _then) = __$ImportDataCopyWithImpl;
@override @useResult
$Res call({
 List<RecipeData> recipes, Map<String, GroceryData> groceries
});




}
/// @nodoc
class __$ImportDataCopyWithImpl<$Res>
    implements _$ImportDataCopyWith<$Res> {
  __$ImportDataCopyWithImpl(this._self, this._then);

  final _ImportData _self;
  final $Res Function(_ImportData) _then;

/// Create a copy of ImportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipes = null,Object? groceries = null,}) {
  return _then(_ImportData(
recipes: null == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<RecipeData>,groceries: null == groceries ? _self._groceries : groceries // ignore: cast_nullable_to_non_nullable
as Map<String, GroceryData>,
  ));
}


}

// dart format on
