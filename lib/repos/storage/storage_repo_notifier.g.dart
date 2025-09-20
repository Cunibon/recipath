// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageRepoNotifier)
const storageRepoProvider = StorageRepoNotifierProvider._();

final class StorageRepoNotifierProvider
    extends
        $FunctionalProvider<
          Repo<StorageData>,
          Repo<StorageData>,
          Repo<StorageData>
        >
    with $Provider<Repo<StorageData>> {
  const StorageRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<Repo<StorageData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Repo<StorageData> create(Ref ref) {
    return storageRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Repo<StorageData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Repo<StorageData>>(value),
    );
  }
}

String _$storageRepoNotifierHash() =>
    r'b26350991900dbb23dcab292fbddf1d944869913';
