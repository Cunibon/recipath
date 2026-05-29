// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_recipe_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredRecipeNotifier)
final filteredRecipeProvider = FilteredRecipeNotifierProvider._();

final class FilteredRecipeNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<String, RecipeData>>,
          IMap<String, RecipeData>,
          Stream<IMap<String, RecipeData>>
        >
    with
        $FutureModifier<IMap<String, RecipeData>>,
        $StreamProvider<IMap<String, RecipeData>> {
  FilteredRecipeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredRecipeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredRecipeNotifierHash();

  @$internal
  @override
  $StreamProviderElement<IMap<String, RecipeData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, RecipeData>> create(Ref ref) {
    return filteredRecipeNotifier(ref);
  }
}

String _$filteredRecipeNotifierHash() =>
    r'305400d4caea4e284c9b6abfeca78cb265f1a9cb';
