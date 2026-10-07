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
          AsyncValue<IMap<String, ShoppingData>>,
          IMap<String, ShoppingData>,
          Stream<IMap<String, ShoppingData>>
        >
    with
        $FutureModifier<IMap<String, ShoppingData>>,
        $StreamProvider<IMap<String, ShoppingData>> {
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
  $StreamProviderElement<IMap<String, ShoppingData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, ShoppingData>> create(Ref ref) {
    return filteredShoppingNotifier(ref);
  }
}

String _$filteredShoppingNotifierHash() =>
    r'23daa40cd90fda9dab74196d7045967be0843b5e';
