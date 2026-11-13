// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ingredientRepoNotifier)
final ingredientRepoProvider = IngredientRepoNotifierProvider._();

final class IngredientRepoNotifierProvider
    extends $FunctionalProvider<IngredientRepo, IngredientRepo, IngredientRepo>
    with $Provider<IngredientRepo> {
  IngredientRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ingredientRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ingredientRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<IngredientRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IngredientRepo create(Ref ref) {
    return ingredientRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IngredientRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IngredientRepo>(value),
    );
  }
}

String _$ingredientRepoNotifierHash() =>
    r'b9a37ed3e75e37b39a21f08bec0ea82d6fbd95af';
