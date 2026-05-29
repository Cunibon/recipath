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
          AsyncValue<IMap<String, ShoppingData>>,
          IMap<String, ShoppingData>,
          Stream<IMap<String, ShoppingData>>
        >
    with
        $FutureModifier<IMap<String, ShoppingData>>,
        $StreamProvider<IMap<String, ShoppingData>> {
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
  $StreamProviderElement<IMap<String, ShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, ShoppingData>> create(Ref ref) {
    return shoppingNotifier(ref);
  }
}

String _$shoppingNotifierHash() => r'95a8d8e79dfa29d4bf02e71589e0ea10de259b46';
