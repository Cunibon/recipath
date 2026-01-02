// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syncing_service_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(syncingServiceNotifier)
final syncingServiceProvider = SyncingServiceNotifierProvider._();

final class SyncingServiceNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<SyncingService>,
          SyncingService,
          FutureOr<SyncingService>
        >
    with $FutureModifier<SyncingService>, $FutureProvider<SyncingService> {
  SyncingServiceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncingServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncingServiceNotifierHash();

  @$internal
  @override
  $FutureProviderElement<SyncingService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SyncingService> create(Ref ref) {
    return syncingServiceNotifier(ref);
  }
}

String _$syncingServiceNotifierHash() =>
    r'6bfbacacb745613257d86c31a778ededc9699a2e';
