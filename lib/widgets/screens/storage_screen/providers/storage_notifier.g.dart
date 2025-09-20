// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageNotifier)
const storageProvider = StorageNotifierProvider._();

final class StorageNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, StorageData>>,
          Map<String, StorageData>,
          Stream<Map<String, StorageData>>
        >
    with
        $FutureModifier<Map<String, StorageData>>,
        $StreamProvider<Map<String, StorageData>> {
  const StorageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageNotifierHash();

  @$internal
  @override
  $StreamProviderElement<Map<String, StorageData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<Map<String, StorageData>> create(Ref ref) {
    return storageNotifier(ref);
  }
}

String _$storageNotifierHash() => r'3ac4e68ea5761a336220eac4432e1519166c69b3';
