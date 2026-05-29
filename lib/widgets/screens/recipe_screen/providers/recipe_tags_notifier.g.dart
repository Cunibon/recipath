// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_tags_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeTagsNotifier)
final recipeTagsProvider = RecipeTagsNotifierProvider._();

final class RecipeTagsNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<String, RecipeTagData>>,
          IMap<String, RecipeTagData>,
          Stream<IMap<String, RecipeTagData>>
        >
    with
        $FutureModifier<IMap<String, RecipeTagData>>,
        $StreamProvider<IMap<String, RecipeTagData>> {
  RecipeTagsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeTagsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeTagsNotifierHash();

  @$internal
  @override
  $StreamProviderElement<IMap<String, RecipeTagData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, RecipeTagData>> create(Ref ref) {
    return recipeTagsNotifier(ref);
  }
}

String _$recipeTagsNotifierHash() =>
    r'6c4c76d610355eacafa985321f723b31dda9e9ed';
