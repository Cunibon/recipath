// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeNotifier)
const recipeProvider = RecipeNotifierProvider._();

final class RecipeNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, RecipeData>>,
          Map<String, RecipeData>,
          Stream<Map<String, RecipeData>>
        >
    with
        $FutureModifier<Map<String, RecipeData>>,
        $StreamProvider<Map<String, RecipeData>> {
  const RecipeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeNotifierHash();

  @$internal
  @override
  $StreamProviderElement<Map<String, RecipeData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, RecipeData>> create(Ref ref) {
    return recipeNotifier(ref);
  }
}

String _$recipeNotifierHash() => r'2d1711149a26f50a7c7279c92beb281bead8ef38';
