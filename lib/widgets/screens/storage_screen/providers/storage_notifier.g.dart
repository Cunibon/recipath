// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageNotifier)
final storageProvider = StorageNotifierProvider._();

final class StorageNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<IMap<String, StorageData>>,
          IMap<String, StorageData>,
          Stream<IMap<String, StorageData>>
        >
    with
        $FutureModifier<IMap<String, StorageData>>,
        $StreamProvider<IMap<String, StorageData>> {
  StorageNotifierProvider._()
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
  $StreamProviderElement<IMap<String, StorageData>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<IMap<String, StorageData>> create(Ref ref) {
    return storageNotifier(ref);
  }
}

String _$storageNotifierHash() => r'478b7eb70a65e1db1edb3b228723679c6d731274';
