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
    extends $FunctionalProvider<Repo, Repo, Repo>
    with $Provider<Repo> {
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
  $ProviderElement<Repo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Repo create(Ref ref) {
    return ingredientRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Repo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Repo>(value),
    );
  }
}

String _$ingredientRepoNotifierHash() =>
    r'88f3105c4737b0c8bc3f4719073fdcad50ecf963';
