// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_per_grocery_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagsPerGroceryNotifier)
final tagsPerGroceryProvider = TagsPerGroceryNotifierProvider._();

final class TagsPerGroceryNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, Set<TagData>>>,
          Map<String, Set<TagData>>,
          FutureOr<Map<String, Set<TagData>>>
        >
    with
        $FutureModifier<Map<String, Set<TagData>>>,
        $FutureProvider<Map<String, Set<TagData>>> {
  TagsPerGroceryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagsPerGroceryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagsPerGroceryNotifierHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, Set<TagData>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, Set<TagData>>> create(Ref ref) {
    return tagsPerGroceryNotifier(ref);
  }
}

String _$tagsPerGroceryNotifierHash() =>
    r'5c378ed24f12ce9f7e9d6133be0039b0ad338b0b';
