// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_import_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeImportScreenState {

 String get path; List<RecipeData> get selectedRecipes;
/// Create a copy of RecipeImportScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeImportScreenStateCopyWith<RecipeImportScreenState> get copyWith => _$RecipeImportScreenStateCopyWithImpl<RecipeImportScreenState>(this as RecipeImportScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeImportScreenState&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.selectedRecipes, selectedRecipes));
}


@override
int get hashCode => Object.hash(runtimeType,path,const DeepCollectionEquality().hash(selectedRecipes));

@override
String toString() {
  return 'RecipeImportScreenState(path: $path, selectedRecipes: $selectedRecipes)';
}


}

/// @nodoc
abstract mixin class $RecipeImportScreenStateCopyWith<$Res>  {
  factory $RecipeImportScreenStateCopyWith(RecipeImportScreenState value, $Res Function(RecipeImportScreenState) _then) = _$RecipeImportScreenStateCopyWithImpl;
@useResult
$Res call({
 String path, List<RecipeData> selectedRecipes
});




}
/// @nodoc
class _$RecipeImportScreenStateCopyWithImpl<$Res>
    implements $RecipeImportScreenStateCopyWith<$Res> {
  _$RecipeImportScreenStateCopyWithImpl(this._self, this._then);

  final RecipeImportScreenState _self;
  final $Res Function(RecipeImportScreenState) _then;

/// Create a copy of RecipeImportScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? selectedRecipes = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,selectedRecipes: null == selectedRecipes ? _self.selectedRecipes : selectedRecipes // ignore: cast_nullable_to_non_nullable
as List<RecipeData>,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeImportScreenState].
extension RecipeImportScreenStatePatterns on RecipeImportScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeImportScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeImportScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeImportScreenState value)  $default,){
final _that = this;
switch (_that) {
case _RecipeImportScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeImportScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeImportScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  List<RecipeData> selectedRecipes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeImportScreenState() when $default != null:
return $default(_that.path,_that.selectedRecipes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  List<RecipeData> selectedRecipes)  $default,) {final _that = this;
switch (_that) {
case _RecipeImportScreenState():
return $default(_that.path,_that.selectedRecipes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  List<RecipeData> selectedRecipes)?  $default,) {final _that = this;
switch (_that) {
case _RecipeImportScreenState() when $default != null:
return $default(_that.path,_that.selectedRecipes);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeImportScreenState implements RecipeImportScreenState {
  const _RecipeImportScreenState({required this.path, required final  List<RecipeData> selectedRecipes}): _selectedRecipes = selectedRecipes;
  

@override final  String path;
 final  List<RecipeData> _selectedRecipes;
@override List<RecipeData> get selectedRecipes {
  if (_selectedRecipes is EqualUnmodifiableListView) return _selectedRecipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedRecipes);
}


/// Create a copy of RecipeImportScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeImportScreenStateCopyWith<_RecipeImportScreenState> get copyWith => __$RecipeImportScreenStateCopyWithImpl<_RecipeImportScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeImportScreenState&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other._selectedRecipes, _selectedRecipes));
}


@override
int get hashCode => Object.hash(runtimeType,path,const DeepCollectionEquality().hash(_selectedRecipes));

@override
String toString() {
  return 'RecipeImportScreenState(path: $path, selectedRecipes: $selectedRecipes)';
}


}

/// @nodoc
abstract mixin class _$RecipeImportScreenStateCopyWith<$Res> implements $RecipeImportScreenStateCopyWith<$Res> {
  factory _$RecipeImportScreenStateCopyWith(_RecipeImportScreenState value, $Res Function(_RecipeImportScreenState) _then) = __$RecipeImportScreenStateCopyWithImpl;
@override @useResult
$Res call({
 String path, List<RecipeData> selectedRecipes
});




}
/// @nodoc
class __$RecipeImportScreenStateCopyWithImpl<$Res>
    implements _$RecipeImportScreenStateCopyWith<$Res> {
  __$RecipeImportScreenStateCopyWithImpl(this._self, this._then);

  final _RecipeImportScreenState _self;
  final $Res Function(_RecipeImportScreenState) _then;

/// Create a copy of RecipeImportScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? selectedRecipes = null,}) {
  return _then(_RecipeImportScreenState(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,selectedRecipes: null == selectedRecipes ? _self._selectedRecipes : selectedRecipes // ignore: cast_nullable_to_non_nullable
as List<RecipeData>,
  ));
}


}

// dart format on
