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
    extends $FunctionalProvider<RecipeRepo, RecipeRepo, RecipeRepo>
    with $Provider<RecipeRepo> {
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
  $ProviderElement<RecipeRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RecipeRepo create(Ref ref) {
    return recipeRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeRepo>(value),
    );
  }
}

String _$recipeRepoNotifierHash() =>
    r'd59c666da7d42aa12a230331782b4dae98751f7e';
