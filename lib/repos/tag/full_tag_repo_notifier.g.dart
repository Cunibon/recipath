// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_tag_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullTagRepoNotifier)
const fullTagRepoProvider = FullTagRepoNotifierProvider._();

final class FullTagRepoNotifierProvider
    extends
        $FunctionalProvider<
          SyncRepo<TagData>,
          SyncRepo<TagData>,
          SyncRepo<TagData>
        >
    with $Provider<SyncRepo<TagData>> {
  const FullTagRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullTagRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullTagRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<SyncRepo<TagData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SyncRepo<TagData> create(Ref ref) {
    return fullTagRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncRepo<TagData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncRepo<TagData>>(value),
    );
  }
}

String _$fullTagRepoNotifierHash() =>
    r'67c1790bbab67640c8c9cbfd82f05a8c3decb107';
