// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_shopping_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeShoppingRepoNotifier)
final recipeShoppingRepoProvider = RecipeShoppingRepoNotifierProvider._();

final class RecipeShoppingRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<RecipeShoppingData>,
          LocalRepo<RecipeShoppingData>,
          LocalRepo<RecipeShoppingData>
        >
    with $Provider<LocalRepo<RecipeShoppingData>> {
  RecipeShoppingRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeShoppingRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeShoppingRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<LocalRepo<RecipeShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<RecipeShoppingData> create(Ref ref) {
    return recipeShoppingRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<RecipeShoppingData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<RecipeShoppingData>>(
        value,
      ),
    );
  }
}

String _$recipeShoppingRepoNotifierHash() =>
    r'4a50d0fc3a5559975e114346e9666a4858efeee4';
