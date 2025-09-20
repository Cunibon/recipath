// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_recipe_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullRecipeRepoNotifier)
const fullRecipeRepoProvider = FullRecipeRepoNotifierProvider._();

final class FullRecipeRepoNotifierProvider
    extends
        $FunctionalProvider<
          SyncRepo<RecipeData>,
          SyncRepo<RecipeData>,
          SyncRepo<RecipeData>
        >
    with $Provider<SyncRepo<RecipeData>> {
  const FullRecipeRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullRecipeRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullRecipeRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<SyncRepo<RecipeData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SyncRepo<RecipeData> create(Ref ref) {
    return fullRecipeRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncRepo<RecipeData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncRepo<RecipeData>>(value),
    );
  }
}

String _$fullRecipeRepoNotifierHash() =>
    r'1af4e3164eca31a4b73aed2035a5c8c4b3313965';
