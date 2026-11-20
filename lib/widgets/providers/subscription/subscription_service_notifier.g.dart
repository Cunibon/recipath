// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_service_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subscriptionServiceNotifier)
final subscriptionServiceProvider = SubscriptionServiceNotifierProvider._();

final class SubscriptionServiceNotifierProvider
    extends
        $FunctionalProvider<
          SubscriptionService,
          SubscriptionService,
          SubscriptionService
        >
    with $Provider<SubscriptionService> {
  SubscriptionServiceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subscriptionServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subscriptionServiceNotifierHash();

  @$internal
  @override
  $ProviderElement<SubscriptionService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubscriptionService create(Ref ref) {
    return subscriptionServiceNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubscriptionService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubscriptionService>(value),
    );
  }
}

String _$subscriptionServiceNotifierHash() =>
    r'2eb7f0460256b1b602ba4e64642e6ed4cb9c95d5';
