// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryModifierNotifier)
final groceryModifierProvider = GroceryModifierNotifierProvider._();

final class GroceryModifierNotifierProvider
    extends
        $FunctionalProvider<GroceryModifier, GroceryModifier, GroceryModifier>
    with $Provider<GroceryModifier> {
  GroceryModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groceryModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groceryModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<GroceryModifier> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GroceryModifier create(Ref ref) {
    return groceryModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GroceryModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GroceryModifier>(value),
    );
  }
}

String _$groceryModifierNotifierHash() =>
    r'78355fdf7d12cd3b88949d6ffbad30c9164b2a79';
