// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_tags_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groceryTagsNotifier)
final groceryTagsProvider = GroceryTagsNotifierProvider._();

final class GroceryTagsNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, GroceryTagData>>,
          Map<String, GroceryTagData>,
          Stream<Map<String, GroceryTagData>>
        >
    with
        $FutureModifier<Map<String, GroceryTagData>>,
        $StreamProvider<Map<String, GroceryTagData>> {
  GroceryTagsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groceryTagsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groceryTagsNotifierHash();

  @$internal
  @override
  $StreamProviderElement<Map<String, GroceryTagData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, GroceryTagData>> create(Ref ref) {
    return groceryTagsNotifier(ref);
  }
}

String _$groceryTagsNotifierHash() =>
    r'5f83fee210096d4ce7fe79b4ce4c1d9b6d7999dd';
