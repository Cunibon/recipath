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
        $AsyncNotifierProvider<TagImportScreenNotifier, Map<String, TagData?>> {
  TagImportScreenNotifierProvider._({
    required TagImportScreenNotifierFamily super.from,
    required String super.argument,
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
        '($argument)';
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
    r'a4e38422b8c1707df6c1895dec3b22f9e2ffc47c';

final class TagImportScreenNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TagImportScreenNotifier,
          AsyncValue<Map<String, TagData?>>,
          Map<String, TagData?>,
          FutureOr<Map<String, TagData?>>,
          String
        > {
  TagImportScreenNotifierFamily._()
    : super(
        retry: null,
        name: r'tagImportScreenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TagImportScreenNotifierProvider call(String path) =>
      TagImportScreenNotifierProvider._(argument: path, from: this);

  @override
  String toString() => r'tagImportScreenProvider';
}

abstract class _$TagImportScreenNotifier
    extends $AsyncNotifier<Map<String, TagData?>> {
  late final _$args = ref.$arg as String;
  String get path => _$args;

  FutureOr<Map<String, TagData?>> build(String path);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<Map<String, TagData?>>, Map<String, TagData?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, TagData?>>,
                Map<String, TagData?>
              >,
              AsyncValue<Map<String, TagData?>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
