// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_shopping_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeShoppingRepoNotifier)
const recipeShoppingRepoProvider = RecipeShoppingRepoNotifierProvider._();

final class RecipeShoppingRepoNotifierProvider
    extends
        $FunctionalProvider<
          RecipeShoppingRepoDrift,
          RecipeShoppingRepoDrift,
          RecipeShoppingRepoDrift
        >
    with $Provider<RecipeShoppingRepoDrift> {
  const RecipeShoppingRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeShoppingRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeShoppingRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<RecipeShoppingRepoDrift> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecipeShoppingRepoDrift create(Ref ref) {
    return recipeShoppingRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeShoppingRepoDrift value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeShoppingRepoDrift>(value),
    );
  }
}

String _$recipeShoppingRepoNotifierHash() =>
    r'b37a0fa7a648357bb103f475857e59360d7b8106';
