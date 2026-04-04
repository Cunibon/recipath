// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typed_tag_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(typedTagNotifier)
final typedTagProvider = TypedTagNotifierProvider._();

final class TypedTagNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<TagTypeEnum, Map<String, TagData>>>,
          Map<TagTypeEnum, Map<String, TagData>>,
          FutureOr<Map<TagTypeEnum, Map<String, TagData>>>
        >
    with
        $FutureModifier<Map<TagTypeEnum, Map<String, TagData>>>,
        $FutureProvider<Map<TagTypeEnum, Map<String, TagData>>> {
  TypedTagNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'typedTagProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$typedTagNotifierHash();

  @$internal
  @override
  $FutureProviderElement<Map<TagTypeEnum, Map<String, TagData>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<TagTypeEnum, Map<String, TagData>>> create(Ref ref) {
    return typedTagNotifier(ref);
  }
}

String _$typedTagNotifierHash() => r'ff8de40ed3b318159e8affcdfa14a26d252c2cb8';
