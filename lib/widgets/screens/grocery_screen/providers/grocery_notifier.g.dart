// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryNotifier)
final groceryProvider = GroceryNotifierProvider._();

final class GroceryNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<String, GroceryData>>,
          IMap<String, GroceryData>,
          Stream<IMap<String, GroceryData>>
        >
    with
        $FutureModifier<IMap<String, GroceryData>>,
        $StreamProvider<IMap<String, GroceryData>> {
  GroceryNotifierProvider._()
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
  $StreamProviderElement<IMap<String, GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, GroceryData>> create(Ref ref) {
    return groceryNotifier(ref);
  }
}

String _$groceryNotifierHash() => r'db2af7f5f1ceafc236e72c883034f30d2635e2fd';
