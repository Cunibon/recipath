// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeNotifier)
final recipeProvider = RecipeNotifierProvider._();

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
  RecipeNotifierProvider._()
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

String _$recipeNotifierHash() => r'92911a34ecce6d345d8dab988e2af7e9719f482e';
