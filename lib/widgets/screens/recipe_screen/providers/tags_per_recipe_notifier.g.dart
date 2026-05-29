// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags_per_recipe_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagsPerRecipeNotifier)
final tagsPerRecipeProvider = TagsPerRecipeNotifierProvider._();

final class TagsPerRecipeNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<String, Set<TagData>>>,
          IMap<String, Set<TagData>>,
          FutureOr<IMap<String, Set<TagData>>>
        >
    with
        $FutureModifier<IMap<String, Set<TagData>>>,
        $FutureProvider<IMap<String, Set<TagData>>> {
  TagsPerRecipeNotifierProvider._()
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
  $FutureProviderElement<IMap<String, Set<TagData>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<IMap<String, Set<TagData>>> create(Ref ref) {
    return tagsPerRecipeNotifier(ref);
  }
}

String _$tagsPerRecipeNotifierHash() =>
    r'7498a2693fb7ba4d1cbe4b23dd484b39fd115f4f';
