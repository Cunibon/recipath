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
    extends
        $FunctionalProvider<
          Repo<IngredientData>,
          Repo<IngredientData>,
          Repo<IngredientData>
        >
    with $Provider<Repo<IngredientData>> {
  IngredientRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ingredientRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ingredientRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<Repo<IngredientData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Repo<IngredientData> create(Ref ref) {
    return ingredientRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Repo<IngredientData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Repo<IngredientData>>(value),
    );
  }
}

String _$ingredientRepoNotifierHash() =>
    r'568b637d5f1fcdb60ef23a2a1cbb51dc8f0dc4ec';
