// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeRepoNotifier)
const recipeRepoProvider = RecipeRepoNotifierProvider._();

final class RecipeRepoNotifierProvider
    extends
        $FunctionalProvider<
          Repo<RecipeData>,
          Repo<RecipeData>,
          Repo<RecipeData>
        >
    with $Provider<Repo<RecipeData>> {
  const RecipeRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<Repo<RecipeData>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Repo<RecipeData> create(Ref ref) {
    return recipeRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Repo<RecipeData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Repo<RecipeData>>(value),
    );
  }
}

String _$recipeRepoNotifierHash() =>
    r'19fa7cb653c1160a69415fca88f5a749cdf6e297';
