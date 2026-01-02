// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingNotifier)
final shoppingProvider = ShoppingNotifierProvider._();

final class ShoppingNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, ShoppingData>>,
          Map<String, ShoppingData>,
          Stream<Map<String, ShoppingData>>
        >
    with
        $FutureModifier<Map<String, ShoppingData>>,
        $StreamProvider<Map<String, ShoppingData>> {
  ShoppingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingNotifierHash();

  @$internal
  @override
  $StreamProviderElement<Map<String, ShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, ShoppingData>> create(Ref ref) {
    return shoppingNotifier(ref);
  }
}

String _$shoppingNotifierHash() => r'3d15f7de2a79d90c3675c58781c3b61ec8488c29';
