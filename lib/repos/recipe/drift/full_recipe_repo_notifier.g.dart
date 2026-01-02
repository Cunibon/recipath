// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_recipe_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullRecipeRepoNotifier)
final fullRecipeRepoProvider = FullRecipeRepoNotifierProvider._();

final class FullRecipeRepoNotifierProvider
    extends $FunctionalProvider<RecipeRepo, RecipeRepo, RecipeRepo>
    with $Provider<RecipeRepo> {
  FullRecipeRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullRecipeRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullRecipeRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<RecipeRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RecipeRepo create(Ref ref) {
    return fullRecipeRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeRepo>(value),
    );
  }
}

String _$fullRecipeRepoNotifierHash() =>
    r'3c185db3e62f723d1f3b8d87a1dab9a7805efa69';
