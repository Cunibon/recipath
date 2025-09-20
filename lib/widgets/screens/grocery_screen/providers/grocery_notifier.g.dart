// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryNotifier)
const groceryProvider = GroceryNotifierProvider._();

final class GroceryNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, GroceryData>>,
          Map<String, GroceryData>,
          Stream<Map<String, GroceryData>>
        >
    with
        $FutureModifier<Map<String, GroceryData>>,
        $StreamProvider<Map<String, GroceryData>> {
  const GroceryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groceryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groceryNotifierHash();

  @$internal
  @override
  $StreamProviderElement<Map<String, GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, GroceryData>> create(Ref ref) {
    return groceryNotifier(ref);
  }
}

String _$groceryNotifierHash() => r'9e5a69f91133327b66bd40f9e888b867c5aa2f0c';
