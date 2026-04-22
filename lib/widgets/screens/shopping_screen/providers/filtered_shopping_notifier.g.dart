// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_shopping_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredShoppingNotifier)
final filteredShoppingProvider = FilteredShoppingNotifierProvider._();

final class FilteredShoppingNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, ShoppingData>>,
          Map<String, ShoppingData>,
          Stream<Map<String, ShoppingData>>
        >
    with
        $FutureModifier<Map<String, ShoppingData>>,
        $StreamProvider<Map<String, ShoppingData>> {
  FilteredShoppingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredShoppingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredShoppingNotifierHash();

  @$internal
  @override
  $StreamProviderElement<Map<String, ShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, ShoppingData>> create(Ref ref) {
    return filteredShoppingNotifier(ref);
  }
}

String _$filteredShoppingNotifierHash() =>
    r'6dfa7e8ded5072b2afdf067e6bcefd67899d659b';
