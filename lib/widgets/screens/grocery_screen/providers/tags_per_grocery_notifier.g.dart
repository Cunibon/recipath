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
          AsyncValue<IMap<String, Set<TagData>>>,
          IMap<String, Set<TagData>>,
          FutureOr<IMap<String, Set<TagData>>>
        >
    with
        $FutureModifier<IMap<String, Set<TagData>>>,
        $FutureProvider<IMap<String, Set<TagData>>> {
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
  $FutureProviderElement<IMap<String, Set<TagData>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<IMap<String, Set<TagData>>> create(Ref ref) {
    return tagsPerGroceryNotifier(ref);
  }
}

String _$tagsPerGroceryNotifierHash() =>
    r'aa3984638083a14723ad800aedcde3c072a6078a';
