// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_storage_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullStorageRepoNotifier)
const fullStorageRepoProvider = FullStorageRepoNotifierProvider._();

final class FullStorageRepoNotifierProvider
    extends
        $FunctionalProvider<
          SyncRepo<StorageData>,
          SyncRepo<StorageData>,
          SyncRepo<StorageData>
        >
    with $Provider<SyncRepo<StorageData>> {
  const FullStorageRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullStorageRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullStorageRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<SyncRepo<StorageData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SyncRepo<StorageData> create(Ref ref) {
    return fullStorageRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncRepo<StorageData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncRepo<StorageData>>(value),
    );
  }
}

String _$fullStorageRepoNotifierHash() =>
    r'63141cc628b84520ccc6a9913dbcec69aa57dd10';
