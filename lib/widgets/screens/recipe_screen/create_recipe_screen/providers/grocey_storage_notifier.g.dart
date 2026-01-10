// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocey_storage_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryStorageNotifier)
final groceryStorageProvider = GroceryStorageNotifierProvider._();

final class GroceryStorageNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<GroceryStorageState>,
          GroceryStorageState,
          FutureOr<GroceryStorageState>
        >
    with
        $FutureModifier<GroceryStorageState>,
        $FutureProvider<GroceryStorageState> {
  GroceryStorageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groceryStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groceryStorageNotifierHash();

  @$internal
  @override
  $FutureProviderElement<GroceryStorageState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GroceryStorageState> create(Ref ref) {
    return groceryStorageNotifier(ref);
  }
}

String _$groceryStorageNotifierHash() =>
    r'36542cdcaf5078da9f1d9239f85f02ac546eed7a';
