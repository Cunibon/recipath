// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_store_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(remoteStoreNotifier)
final remoteStoreProvider = RemoteStoreNotifierProvider._();

final class RemoteStoreNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<RemoteStore>,
          RemoteStore,
          FutureOr<RemoteStore>
        >
    with $FutureModifier<RemoteStore>, $FutureProvider<RemoteStore> {
  RemoteStoreNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteStoreNotifierHash();

  @$internal
  @override
  $FutureProviderElement<RemoteStore> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RemoteStore> create(Ref ref) {
    return remoteStoreNotifier(ref);
  }
}

String _$remoteStoreNotifierHash() =>
    r'ffa78d0b5c8a11a9bb5372d25f8e4f15fe306105';
