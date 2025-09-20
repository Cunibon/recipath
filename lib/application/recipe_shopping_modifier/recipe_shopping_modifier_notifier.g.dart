// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_shopping_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeShoppingModifierNotifier)
const recipeShoppingModifierProvider =
    RecipeShoppingModifierNotifierProvider._();

final class RecipeShoppingModifierNotifierProvider
    extends
        $FunctionalProvider<
          RecipeShoppingModifier,
          RecipeShoppingModifier,
          RecipeShoppingModifier
        >
    with $Provider<RecipeShoppingModifier> {
  const RecipeShoppingModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeShoppingModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeShoppingModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<RecipeShoppingModifier> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecipeShoppingModifier create(Ref ref) {
    return recipeShoppingModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeShoppingModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeShoppingModifier>(value),
    );
  }
}

String _$recipeShoppingModifierNotifierHash() =>
    r'd548ab758ea8fc3f1da5f9371b23f611dfb0b006';
