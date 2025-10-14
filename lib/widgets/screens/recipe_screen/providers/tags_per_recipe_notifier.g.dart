// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_per_recipe_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagsPerRecipeNotifier)
const tagsPerRecipeProvider = TagsPerRecipeNotifierProvider._();

final class TagsPerRecipeNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, Set<TagData>>>,
          Map<String, Set<TagData>>,
          FutureOr<Map<String, Set<TagData>>>
        >
    with
        $FutureModifier<Map<String, Set<TagData>>>,
        $FutureProvider<Map<String, Set<TagData>>> {
  const TagsPerRecipeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagsPerRecipeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagsPerRecipeNotifierHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, Set<TagData>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, Set<TagData>>> create(Ref ref) {
    return tagsPerRecipeNotifier(ref);
  }
}

String _$tagsPerRecipeNotifierHash() =>
    r'3ef4446e09afc7e76d6321bf9d07493bb3d67f49';
