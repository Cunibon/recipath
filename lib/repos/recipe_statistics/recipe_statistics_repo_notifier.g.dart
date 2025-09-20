// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_statistics_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeStatisticsRepoNotifier)
const recipeStatisticsRepoProvider = RecipeStatisticsRepoNotifierProvider._();

final class RecipeStatisticsRepoNotifierProvider
    extends
        $FunctionalProvider<
          RecipeStatisticsRepo,
          RecipeStatisticsRepo,
          RecipeStatisticsRepo
        >
    with $Provider<RecipeStatisticsRepo> {
  const RecipeStatisticsRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeStatisticsRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeStatisticsRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<RecipeStatisticsRepo> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecipeStatisticsRepo create(Ref ref) {
    return recipeStatisticsRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeStatisticsRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeStatisticsRepo>(value),
    );
  }
}

String _$recipeStatisticsRepoNotifierHash() =>
    r'e72dc9c9c612884929b59575be7b5dc1bcf51ea5';
