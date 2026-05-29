// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_grocery_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredGroceryNotifier)
final filteredGroceryProvider = FilteredGroceryNotifierProvider._();

final class FilteredGroceryNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<String, GroceryData>>,
          IMap<String, GroceryData>,
          Stream<IMap<String, GroceryData>>
        >
    with
        $FutureModifier<IMap<String, GroceryData>>,
        $StreamProvider<IMap<String, GroceryData>> {
  FilteredGroceryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredGroceryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredGroceryNotifierHash();

  @$internal
  @override
  $StreamProviderElement<IMap<String, GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, GroceryData>> create(Ref ref) {
    return filteredGroceryNotifier(ref);
  }
}

String _$filteredGroceryNotifierHash() =>
    r'8346fac34e74cc76b8a723912fb375465b5cbe8c';
