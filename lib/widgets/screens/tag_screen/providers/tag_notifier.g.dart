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
          AsyncValue<IMap<String, TagData>>,
          IMap<String, TagData>,
          Stream<IMap<String, TagData>>
        >
    with
        $FutureModifier<IMap<String, TagData>>,
        $StreamProvider<IMap<String, TagData>> {
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
  $StreamProviderElement<IMap<String, TagData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, TagData>> create(Ref ref) {
    return tagNotifier(ref);
  }
}

String _$tagNotifierHash() => r'50605f183510b6a64ee79ad2bad25bf8db5c4c3f';
