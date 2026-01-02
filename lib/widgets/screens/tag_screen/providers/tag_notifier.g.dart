// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagNotifier)
final tagProvider = TagNotifierProvider._();

final class TagNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, TagData>>,
          Map<String, TagData>,
          Stream<Map<String, TagData>>
        >
    with
        $FutureModifier<Map<String, TagData>>,
        $StreamProvider<Map<String, TagData>> {
  TagNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagNotifierHash();

  @$internal
  @override
  $StreamProviderElement<Map<String, TagData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, TagData>> create(Ref ref) {
    return tagNotifier(ref);
  }
}

String _$tagNotifierHash() => r'68fee921a6ea8fe838840ee0af868f18496fe45f';
