// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_screen_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingScreenStateNotifier)
final shoppingScreenStateProvider = ShoppingScreenStateNotifierProvider._();

final class ShoppingScreenStateNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ShoppingScreenState>,
          ShoppingScreenState,
          FutureOr<ShoppingScreenState>
        >
    with
        $FutureModifier<ShoppingScreenState>,
        $FutureProvider<ShoppingScreenState> {
  ShoppingScreenStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingScreenStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingScreenStateNotifierHash();

  @$internal
  @override
  $FutureProviderElement<ShoppingScreenState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ShoppingScreenState> create(Ref ref) {
    return shoppingScreenStateNotifier(ref);
  }
}

String _$shoppingScreenStateNotifierHash() =>
    r'ac230086605f687c47018f29b887542dd5023728';
