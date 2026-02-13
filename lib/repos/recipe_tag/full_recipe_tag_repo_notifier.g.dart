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
          LocalRepo<RecipeTagData>,
          LocalRepo<RecipeTagData>,
          LocalRepo<RecipeTagData>
        >
    with $Provider<LocalRepo<RecipeTagData>> {
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
  $ProviderElement<LocalRepo<RecipeTagData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<RecipeTagData> create(Ref ref) {
    return fullRecipeTagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<RecipeTagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<RecipeTagData>>(value),
    );
  }
}

String _$fullRecipeTagRepoNotifierHash() =>
    r'dcdab868f91eb032845e7d02ab7c7fc9729cf839';
