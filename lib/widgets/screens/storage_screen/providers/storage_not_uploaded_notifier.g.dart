// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_not_uploaded_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageNotUploadedNotifier)
final storageNotUploadedProvider = StorageNotUploadedNotifierProvider._();

final class StorageNotUploadedNotifierProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  StorageNotUploadedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageNotUploadedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageNotUploadedNotifierHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return storageNotUploadedNotifier(ref);
  }
}

String _$storageNotUploadedNotifierHash() =>
    r'2e7a4cb6dccf25b417f9e89fee11690a39cbcc2d';
