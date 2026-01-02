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
          AsyncValue<Map<String, RecipeTagData>>,
          Map<String, RecipeTagData>,
          Stream<Map<String, RecipeTagData>>
        >
    with
        $FutureModifier<Map<String, RecipeTagData>>,
        $StreamProvider<Map<String, RecipeTagData>> {
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
  $StreamProviderElement<Map<String, RecipeTagData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, RecipeTagData>> create(Ref ref) {
    return recipeTagsNotifier(ref);
  }
}

String _$recipeTagsNotifierHash() =>
    r'a2130495cc925a2f1dc3bf745ef9294b82cd6806';
