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
          LocalRepo<FileData>,
          LocalRepo<FileData>,
          LocalRepo<FileData>
        >
    with $Provider<LocalRepo<FileData>> {
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
  $ProviderElement<LocalRepo<FileData>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepo<FileData> create(Ref ref) {
    return fileRepoNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepo<FileData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepo<FileData>>(value),
    );
  }
}

String _$fileRepoNotifierHash() => r'92595aef7a825ac3c7aeb0202cf0ee1bffd0ed2a';
