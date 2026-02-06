// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_storage_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fullStorageRepoNotifier)
final fullStorageRepoProvider = FullStorageRepoNotifierProvider._();

final class FullStorageRepoNotifierProvider
    extends
        $FunctionalProvider<
          LocalRepo<StorageData>,
          LocalRepo<StorageData>,
          LocalRepo<StorageData>
        >
    with $Provider<LocalRepo<StorageData>> {
  FullStorageRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fullStorageRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fullStorageRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<LocalRepo<StorageData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<StorageData> create(Ref ref) {
    return fullStorageRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<StorageData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<StorageData>>(value),
    );
  }
}

String _$fullStorageRepoNotifierHash() =>
    r'1509ae8de2ed30ce46a3aad17d1ae4625c2c5251';
