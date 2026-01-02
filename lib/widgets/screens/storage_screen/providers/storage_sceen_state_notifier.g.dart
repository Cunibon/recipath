// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_sceen_state_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storageScreenStateNotifier)
final storageScreenStateProvider = StorageScreenStateNotifierProvider._();

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
  StorageScreenStateNotifierProvider._()
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
    r'cb9320ec3f97da8d91755c8a6b1e42aeec7e5521';
