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
          SyncRepo<RecipeTagData>,
          SyncRepo<RecipeTagData>,
          SyncRepo<RecipeTagData>
        >
    with $Provider<SyncRepo<RecipeTagData>> {
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
  $ProviderElement<SyncRepo<RecipeTagData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SyncRepo<RecipeTagData> create(Ref ref) {
    return recipeTagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncRepo<RecipeTagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncRepo<RecipeTagData>>(value),
    );
  }
}

String _$recipeTagRepoNotifierHash() =>
    r'70c2361c089cf0b04470d761398fc1ead6536fd1';
