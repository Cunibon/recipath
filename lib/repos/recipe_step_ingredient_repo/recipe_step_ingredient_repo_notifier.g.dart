// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step_ingredient_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeStepIngredientNotifier)
final recipeStepIngredientProvider = RecipeStepIngredientNotifierProvider._();

final class RecipeStepIngredientNotifierProvider
    extends $FunctionalProvider<Repo, Repo, Repo>
    with $Provider<Repo> {
  RecipeStepIngredientNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeStepIngredientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeStepIngredientNotifierHash();

  @$internal
  @override
  $ProviderElement<Repo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Repo create(Ref ref) {
    return recipeStepIngredientNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Repo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Repo>(value),
    );
  }
}

String _$recipeStepIngredientNotifierHash() =>
    r'11b73f8401d49b249d7ca2f35e60fe8949f7d950';
