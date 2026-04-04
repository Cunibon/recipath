// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryScreenNotifier)
final groceryScreenProvider = GroceryScreenNotifierProvider._();

final class GroceryScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GroceryItemData>>,
          List<GroceryItemData>,
          FutureOr<List<GroceryItemData>>
        >
    with
        $FutureModifier<List<GroceryItemData>>,
        $FutureProvider<List<GroceryItemData>> {
  GroceryScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groceryScreenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groceryScreenNotifierHash();

  @$internal
  @override
  $FutureProviderElement<List<GroceryItemData>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GroceryItemData>> create(Ref ref) {
    return groceryScreenNotifier(ref);
  }
}

String _$groceryScreenNotifierHash() =>
    r'39de1303d4ffa50dff9e0e6f038eea1ca98e389c';
