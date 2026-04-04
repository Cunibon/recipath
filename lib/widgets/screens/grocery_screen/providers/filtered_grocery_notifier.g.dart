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
          AsyncValue<Map<String, GroceryData>>,
          Map<String, GroceryData>,
          Stream<Map<String, GroceryData>>
        >
    with
        $FutureModifier<Map<String, GroceryData>>,
        $StreamProvider<Map<String, GroceryData>> {
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
  $StreamProviderElement<Map<String, GroceryData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, GroceryData>> create(Ref ref) {
    return filteredGroceryNotifier(ref);
  }
}

String _$filteredGroceryNotifierHash() =>
    r'47c9bd250a11c32227629f02f5112146c39ce974';
