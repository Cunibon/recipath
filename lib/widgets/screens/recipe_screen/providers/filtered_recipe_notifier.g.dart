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
          AsyncValue<Map<String, RecipeData>>,
          Map<String, RecipeData>,
          Stream<Map<String, RecipeData>>
        >
    with
        $FutureModifier<Map<String, RecipeData>>,
        $StreamProvider<Map<String, RecipeData>> {
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
  $StreamProviderElement<Map<String, RecipeData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, RecipeData>> create(Ref ref) {
    return filteredRecipeNotifier(ref);
  }
}

String _$filteredRecipeNotifierHash() =>
    r'cd3ce837c0abb8af691592439aaf548dbc440c39';
