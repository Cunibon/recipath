// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_recipe_tag_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullRecipeTagRepoNotifier)
final fullRecipeTagRepoProvider = FullRecipeTagRepoNotifierProvider._();

final class FullRecipeTagRepoNotifierProvider
    extends
        $FunctionalProvider<
          SyncRepo<RecipeTagData>,
          SyncRepo<RecipeTagData>,
          SyncRepo<RecipeTagData>
        >
    with $Provider<SyncRepo<RecipeTagData>> {
  FullRecipeTagRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullRecipeTagRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullRecipeTagRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<SyncRepo<RecipeTagData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SyncRepo<RecipeTagData> create(Ref ref) {
    return fullRecipeTagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncRepo<RecipeTagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncRepo<RecipeTagData>>(value),
    );
  }
}

String _$fullRecipeTagRepoNotifierHash() =>
    r'3c79f397beb44a7da5bcba4d2264ac9b342b4c1e';
