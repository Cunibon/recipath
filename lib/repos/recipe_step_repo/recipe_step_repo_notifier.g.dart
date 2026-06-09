// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_step_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeStepRepoNotifier)
final recipeStepRepoProvider = RecipeStepRepoNotifierProvider._();

final class RecipeStepRepoNotifierProvider
    extends $FunctionalProvider<Repo, Repo, Repo>
    with $Provider<Repo> {
  RecipeStepRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeStepRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeStepRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<Repo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Repo create(Ref ref) {
    return recipeStepRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Repo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Repo>(value),
    );
  }
}

String _$recipeStepRepoNotifierHash() =>
    r'9c68c90ad85b921ef9f1687964719168633cc3a8';
