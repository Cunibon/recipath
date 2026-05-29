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
          AsyncValue<IMap<TagTypeEnum, IMap<String, TagData>>>,
          IMap<TagTypeEnum, IMap<String, TagData>>,
          FutureOr<IMap<TagTypeEnum, IMap<String, TagData>>>
        >
    with
        $FutureModifier<IMap<TagTypeEnum, IMap<String, TagData>>>,
        $FutureProvider<IMap<TagTypeEnum, IMap<String, TagData>>> {
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
  $FutureProviderElement<IMap<TagTypeEnum, IMap<String, TagData>>>
  $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<IMap<TagTypeEnum, IMap<String, TagData>>> create(Ref ref) {
    return typedTagNotifier(ref);
  }
}

String _$typedTagNotifierHash() => r'2b63fb1c092d017fb2e307aac8438c68ece68ec1';
