// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagRepoNotifier)
final tagRepoProvider = TagRepoNotifierProvider._();

final class TagRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<TagData>,
          LocalRepo<TagData>,
          LocalRepo<TagData>
        >
    with $Provider<LocalRepo<TagData>> {
  TagRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<LocalRepo<TagData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<TagData> create(Ref ref) {
    return tagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<TagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<TagData>>(value),
    );
  }
}

String _$tagRepoNotifierHash() => r'b898f976a80f6519b4bb88fcb499327b745903c6';
