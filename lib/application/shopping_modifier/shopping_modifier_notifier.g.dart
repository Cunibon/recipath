// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingModifierNotifier)
final shoppingModifierProvider = ShoppingModifierNotifierProvider._();

final class ShoppingModifierNotifierProvider
    extends
        $FunctionalProvider<
          ShoppingModifier,
          ShoppingModifier,
          ShoppingModifier
        >
    with $Provider<ShoppingModifier> {
  ShoppingModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<ShoppingModifier> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShoppingModifier create(Ref ref) {
    return shoppingModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingModifier>(value),
    );
  }
}

String _$shoppingModifierNotifierHash() =>
    r'7c8958bbe6471ff90332fec65234f0b918dd2f64';
