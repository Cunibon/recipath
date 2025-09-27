// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_tag_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeTagModifierNotifier)
const recipeTagModifierProvider = RecipeTagModifierNotifierProvider._();

final class RecipeTagModifierNotifierProvider
    extends
        $FunctionalProvider<
          RecipeTagModifier,
          RecipeTagModifier,
          RecipeTagModifier
        >
    with $Provider<RecipeTagModifier> {
  const RecipeTagModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeTagModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeTagModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<RecipeTagModifier> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecipeTagModifier create(Ref ref) {
    return recipeTagModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeTagModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeTagModifier>(value),
    );
  }
}

String _$recipeTagModifierNotifierHash() =>
    r'54d14833307b8753614510f9d549d47eba0c76c4';
