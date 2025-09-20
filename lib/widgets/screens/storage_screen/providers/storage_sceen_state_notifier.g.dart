// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_sceen_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageScreenStateNotifier)
const storageScreenStateProvider = StorageScreenStateNotifierProvider._();

final class StorageScreenStateNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<StorageScreenState>,
          StorageScreenState,
          FutureOr<StorageScreenState>
        >
    with
        $FutureModifier<StorageScreenState>,
        $FutureProvider<StorageScreenState> {
  const StorageScreenStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageScreenStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageScreenStateNotifierHash();

  @$internal
  @override
  $FutureProviderElement<StorageScreenState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StorageScreenState> create(Ref ref) {
    return storageScreenStateNotifier(ref);
  }
}

String _$storageScreenStateNotifierHash() =>
    r'c684f400c765bd63190fef8bfedb67e283c7b712';
