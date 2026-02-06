// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageRepoNotifier)
final storageRepoProvider = StorageRepoNotifierProvider._();

final class StorageRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<StorageData>,
          LocalRepo<StorageData>,
          LocalRepo<StorageData>
        >
    with $Provider<LocalRepo<StorageData>> {
  StorageRepoNotifierProvider._()
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
  $ProviderElement<LocalRepo<StorageData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<StorageData> create(Ref ref) {
    return storageRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<StorageData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<StorageData>>(value),
    );
  }
}

String _$storageRepoNotifierHash() =>
    r'dc030d9e775bcff2efd9480d43c557526b230ae7';
