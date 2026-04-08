// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_shopping_modifier_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(quickShoppingModifierNotifier)
final quickShoppingModifierProvider = QuickShoppingModifierNotifierProvider._();

final class QuickShoppingModifierNotifierProvider
    extends
        $FunctionalProvider<
          QuickShoppingModifier,
          QuickShoppingModifier,
          QuickShoppingModifier
        >
    with $Provider<QuickShoppingModifier> {
  QuickShoppingModifierNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'quickShoppingModifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$quickShoppingModifierNotifierHash();

  @$internal
  @override
  $ProviderElement<QuickShoppingModifier> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QuickShoppingModifier create(Ref ref) {
    return quickShoppingModifierNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuickShoppingModifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuickShoppingModifier>(value),
    );
  }
}

String _$quickShoppingModifierNotifierHash() =>
    r'475347193a40d8e4ca3ea4e57238ba76d9e5bea5';
