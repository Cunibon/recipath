// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_groceries_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingGroceriesNotifier)
final shoppingGroceriesProvider = ShoppingGroceriesNotifierProvider._();

final class ShoppingGroceriesNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<ISet<String>>,
          ISet<String>,
          FutureOr<ISet<String>>
        >
    with $FutureModifier<ISet<String>>, $FutureProvider<ISet<String>> {
  ShoppingGroceriesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingGroceriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingGroceriesNotifierHash();

  @$internal
  @override
  $FutureProviderElement<ISet<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ISet<String>> create(Ref ref) {
    return shoppingGroceriesNotifier(ref);
  }
}

String _$shoppingGroceriesNotifierHash() =>
    r'cefab442f3ebd83f3c5eb03e07068fee41eec970';
