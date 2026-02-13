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
    extends $FunctionalProvider<SyncingService, SyncingService, SyncingService>
    with $Provider<SyncingService> {
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
  $ProviderElement<SyncingService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SyncingService create(Ref ref) {
    return syncingServiceNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncingService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncingService>(value),
    );
  }
}

String _$syncingServiceNotifierHash() =>
    r'ae91d6bbfda799902dea19a3215b7979b0ed1dff';
