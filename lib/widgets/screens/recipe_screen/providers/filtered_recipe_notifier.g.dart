// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_recipe_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredRecipeNotifier)
const filteredRecipeProvider = FilteredRecipeNotifierProvider._();

final class FilteredRecipeNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, RecipeData>>,
          Map<String, RecipeData>,
          Stream<Map<String, RecipeData>>
        >
    with
        $FutureModifier<Map<String, RecipeData>>,
        $StreamProvider<Map<String, RecipeData>> {
  const FilteredRecipeNotifierProvider._()
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
  $StreamProviderElement<Map<String, RecipeData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, RecipeData>> create(Ref ref) {
    return filteredRecipeNotifier(ref);
  }
}

String _$filteredRecipeNotifierHash() =>
    r'ba749a429b26274823320b52b8b5ecee401f7212';
