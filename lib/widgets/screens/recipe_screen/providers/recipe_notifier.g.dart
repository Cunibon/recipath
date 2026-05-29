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
          AsyncValue<IMap<String, RecipeData>>,
          IMap<String, RecipeData>,
          Stream<IMap<String, RecipeData>>
        >
    with
        $FutureModifier<IMap<String, RecipeData>>,
        $StreamProvider<IMap<String, RecipeData>> {
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
  $StreamProviderElement<IMap<String, RecipeData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, RecipeData>> create(Ref ref) {
    return recipeNotifier(ref);
  }
}

String _$recipeNotifierHash() => r'd3ee94cc933004c543058a91e3dd5a2ebb40b848';
