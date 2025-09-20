// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_planning_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShoppingPlanningNotifier)
const shoppingPlanningProvider = ShoppingPlanningNotifierProvider._();

final class ShoppingPlanningNotifierProvider
    extends $NotifierProvider<ShoppingPlanningNotifier, Map<RecipeData, int>?> {
  const ShoppingPlanningNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingPlanningProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingPlanningNotifierHash();

  @$internal
  @override
  ShoppingPlanningNotifier create() => ShoppingPlanningNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<RecipeData, int>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<RecipeData, int>?>(value),
    );
  }
}

String _$shoppingPlanningNotifierHash() =>
    r'7ea6f1626b3c1596c0ecb1662c6be47a5f2006de';

abstract class _$ShoppingPlanningNotifier
    extends $Notifier<Map<RecipeData, int>?> {
  Map<RecipeData, int>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<RecipeData, int>?, Map<RecipeData, int>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<RecipeData, int>?, Map<RecipeData, int>?>,
              Map<RecipeData, int>?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
