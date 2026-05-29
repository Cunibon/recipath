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
          AsyncValue<IMap<String, GroceryTagData>>,
          IMap<String, GroceryTagData>,
          Stream<IMap<String, GroceryTagData>>
        >
    with
        $FutureModifier<IMap<String, GroceryTagData>>,
        $StreamProvider<IMap<String, GroceryTagData>> {
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
  $StreamProviderElement<IMap<String, GroceryTagData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, GroceryTagData>> create(Ref ref) {
    return groceryTagsNotifier(ref);
  }
}

String _$groceryTagsNotifierHash() =>
    r'2542cb429cba98e24e51bde7873a84ab11694df9';
