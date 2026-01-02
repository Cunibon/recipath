// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_repo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fileRepoNotifier)
final fileRepoProvider = FileRepoNotifierProvider._();

final class FileRepoNotifierProvider
    extends
        $FunctionalProvider<
          SyncRepo<FileData>,
          SyncRepo<FileData>,
          SyncRepo<FileData>
        >
    with $Provider<SyncRepo<FileData>> {
  FileRepoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileRepoProvider',
        isAutoDispose: false,
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

String _$fileRepoNotifierHash() => r'ad48675213ce22f8d12517b8c4ab27e7eb0a40ca';
