// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_statistics_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipeStatisticsModifierNotifier)
final recipeStatisticsModifierProvider =
    RecipeStatisticsModifierNotifierProvider._();

final class RecipeStatisticsModifierNotifierProvider
    extends
        $FunctionalProvider<
          RecipeStatisticsModifier,
          RecipeStatisticsModifier,
          RecipeStatisticsModifier
        >
    with $Provider<RecipeStatisticsModifier> {
  RecipeStatisticsModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeStatisticsModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeStatisticsModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<RecipeStatisticsModifier> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecipeStatisticsModifier create(Ref ref) {
    return recipeStatisticsModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeStatisticsModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeStatisticsModifier>(value),
    );
  }
}

String _$recipeStatisticsModifierNotifierHash() =>
    r'04e4ff64124c3f21acb7725f8aeedc1d98982c70';
