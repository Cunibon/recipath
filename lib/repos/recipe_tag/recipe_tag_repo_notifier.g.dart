// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_tag_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeTagRepoNotifier)
final recipeTagRepoProvider = RecipeTagRepoNotifierProvider._();

final class RecipeTagRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<RecipeTagData>,
          LocalRepo<RecipeTagData>,
          LocalRepo<RecipeTagData>
        >
    with $Provider<LocalRepo<RecipeTagData>> {
  RecipeTagRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeTagRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeTagRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<LocalRepo<RecipeTagData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<RecipeTagData> create(Ref ref) {
    return recipeTagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<RecipeTagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<RecipeTagData>>(value),
    );
  }
}

String _$recipeTagRepoNotifierHash() =>
    r'4c52dfae2acdfe95edbd59669b615ab629e85f9c';
