// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingNotifier)
const shoppingProvider = ShoppingNotifierProvider._();

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
  const ShoppingNotifierProvider._()
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

String _$shoppingNotifierHash() => r'5a69e2c827fa399d087bcea4ebb8f7293ddb1e4a';
