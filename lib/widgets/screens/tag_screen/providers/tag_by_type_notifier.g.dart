// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_by_type_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagByTypeNotifier)
final tagByTypeProvider = TagByTypeNotifierProvider._();

final class TagByTypeNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<TagTypeEnum, IMap<String, TagData>>>,
          IMap<TagTypeEnum, IMap<String, TagData>>,
          FutureOr<IMap<TagTypeEnum, IMap<String, TagData>>>
        >
    with
        $FutureModifier<IMap<TagTypeEnum, IMap<String, TagData>>>,
        $FutureProvider<IMap<TagTypeEnum, IMap<String, TagData>>> {
  TagByTypeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagByTypeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagByTypeNotifierHash();

  @$internal
  @override
  $FutureProviderElement<IMap<TagTypeEnum, IMap<String, TagData>>>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<IMap<TagTypeEnum, IMap<String, TagData>>> create(Ref ref) {
    return tagByTypeNotifier(ref);
  }
}

String _$tagByTypeNotifierHash() => r'47c15a16d25f14f5ffe0f119499987b728b3dc7d';
