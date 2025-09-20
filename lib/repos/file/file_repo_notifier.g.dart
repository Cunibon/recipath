// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fileRepoNotifier)
const fileRepoProvider = FileRepoNotifierProvider._();

final class FileRepoNotifierProvider
    extends
        $FunctionalProvider<
          SyncRepo<FileData>,
          SyncRepo<FileData>,
          SyncRepo<FileData>
        >
    with $Provider<SyncRepo<FileData>> {
  const FileRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fileRepoNotifierHash();

  @$internal
  @override
  $ProviderElement<SyncRepo<FileData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SyncRepo<FileData> create(Ref ref) {
    return fileRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncRepo<FileData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncRepo<FileData>>(value),
    );
  }
}

String _$fileRepoNotifierHash() => r'1d6f76ac690490f511821d17ba6b3f8a9f0a737f';
