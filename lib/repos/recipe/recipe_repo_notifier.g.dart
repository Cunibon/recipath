// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeRepoNotifier)
final recipeRepoProvider = RecipeRepoNotifierProvider._();

final class RecipeRepoNotifierProvider
    extends
        $FunctionalProvider<
          TagFilteredRepo<RecipeData>,
          TagFilteredRepo<RecipeData>,
          TagFilteredRepo<RecipeData>
        >
    with $Provider<TagFilteredRepo<RecipeData>> {
  RecipeRepoNotifierProvider._()
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
  $ProviderElement<TagFilteredRepo<RecipeData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TagFilteredRepo<RecipeData> create(Ref ref) {
    return recipeRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagFilteredRepo<RecipeData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagFilteredRepo<RecipeData>>(value),
    );
  }
}

String _$recipeRepoNotifierHash() =>
    r'dc9be872850d03a6cc63146a25e192e29311a663';
