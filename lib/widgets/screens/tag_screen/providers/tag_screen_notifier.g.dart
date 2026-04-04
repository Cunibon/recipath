// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagScreenNotifier)
final tagScreenProvider = TagScreenNotifierProvider._();

final class TagScreenNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<TagTypeEnum, Map<String, TagData>>>,
          Map<TagTypeEnum, Map<String, TagData>>,
          FutureOr<Map<TagTypeEnum, Map<String, TagData>>>
        >
    with
        $FutureModifier<Map<TagTypeEnum, Map<String, TagData>>>,
        $FutureProvider<Map<TagTypeEnum, Map<String, TagData>>> {
  TagScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagScreenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagScreenNotifierHash();

  @$internal
  @override
  $FutureProviderElement<Map<TagTypeEnum, Map<String, TagData>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<TagTypeEnum, Map<String, TagData>>> create(Ref ref) {
    return tagScreenNotifier(ref);
  }
}

String _$tagScreenNotifierHash() => r'45d9ba4217e11005d6b0816ebbecae232ca930a1';
