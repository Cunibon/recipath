// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tagRepoNotifier)
const tagRepoProvider = TagRepoNotifierProvider._();

final class TagRepoNotifierProvider
    extends $FunctionalProvider<Repo<TagData>, Repo<TagData>, Repo<TagData>>
    with $Provider<Repo<TagData>> {
  const TagRepoNotifierProvider._()
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
  $ProviderElement<Repo<TagData>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Repo<TagData> create(Ref ref) {
    return tagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Repo<TagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Repo<TagData>>(value),
    );
  }
}

String _$tagRepoNotifierHash() => r'b7f51304352c9e4e7c544ad56d04d730e693fb30';
