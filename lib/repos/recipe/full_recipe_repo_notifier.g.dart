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
    extends
        $FunctionalProvider<
          TagFilteredRepo<RecipeData>,
          TagFilteredRepo<RecipeData>,
          TagFilteredRepo<RecipeData>
        >
    with $Provider<TagFilteredRepo<RecipeData>> {
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
  $ProviderElement<TagFilteredRepo<RecipeData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TagFilteredRepo<RecipeData> create(Ref ref) {
    return fullRecipeRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagFilteredRepo<RecipeData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagFilteredRepo<RecipeData>>(value),
    );
  }
}

String _$fullRecipeRepoNotifierHash() =>
    r'6b2cdc407595b354b2d7112e892ee086f599e7fb';
