// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_import_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TagImportScreenNotifier)
final tagImportScreenProvider = TagImportScreenNotifierFamily._();

final class TagImportScreenNotifierProvider
    extends
        $AsyncNotifierProvider<TagImportScreenNotifier, TagImportScreenState> {
  TagImportScreenNotifierProvider._({
    required TagImportScreenNotifierFamily super.from,
    required (String, TagTypeEnum) super.argument,
  }) : super(
         retry: null,
         name: r'tagImportScreenProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tagImportScreenNotifierHash();

  @override
  String toString() {
    return r'tagImportScreenProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TagImportScreenNotifier create() => TagImportScreenNotifier();

  @override
  bool operator ==(Object other) {
    return other is TagImportScreenNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tagImportScreenNotifierHash() =>
    r'e403168be4a4bd382c86e86b04cf75f5d1536530';

final class TagImportScreenNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TagImportScreenNotifier,
          AsyncValue<TagImportScreenState>,
          TagImportScreenState,
          FutureOr<TagImportScreenState>,
          (String, TagTypeEnum)
        > {
  TagImportScreenNotifierFamily._()
    : super(
        retry: null,
        name: r'tagImportScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TagImportScreenNotifierProvider call(String path, TagTypeEnum tagType) =>
      TagImportScreenNotifierProvider._(argument: (path, tagType), from: this);

  @override
  String toString() => r'tagImportScreenProvider';
}

abstract class _$TagImportScreenNotifier
    extends $AsyncNotifier<TagImportScreenState> {
  late final _$args = ref.$arg as (String, TagTypeEnum);
  String get path => _$args.$1;
  TagTypeEnum get tagType => _$args.$2;

  FutureOr<TagImportScreenState> build(String path, TagTypeEnum tagType);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<TagImportScreenState>, TagImportScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<TagImportScreenState>,
                TagImportScreenState
              >,
              AsyncValue<TagImportScreenState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
