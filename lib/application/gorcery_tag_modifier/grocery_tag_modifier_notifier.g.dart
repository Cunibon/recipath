// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_tag_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryTagModifierNotifier)
final groceryTagModifierProvider = GroceryTagModifierNotifierProvider._();

final class GroceryTagModifierNotifierProvider
    extends
        $FunctionalProvider<
          GroceryTagModifier,
          GroceryTagModifier,
          GroceryTagModifier
        >
    with $Provider<GroceryTagModifier> {
  GroceryTagModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groceryTagModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groceryTagModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<GroceryTagModifier> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GroceryTagModifier create(Ref ref) {
    return groceryTagModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GroceryTagModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GroceryTagModifier>(value),
    );
  }
}

String _$groceryTagModifierNotifierHash() =>
    r'b6df442472d796d83f624ac147eaccae146fdbb5';
