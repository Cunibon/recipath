// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_service_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storeSubscriptionService)
final storeSubscriptionServiceProvider = StoreSubscriptionServiceProvider._();

final class StoreSubscriptionServiceProvider
    extends
        $FunctionalProvider<
          AsyncValue<SubscriptionService>,
          SubscriptionService,
          FutureOr<SubscriptionService>
        >
    with
        $FutureModifier<SubscriptionService>,
        $FutureProvider<SubscriptionService> {
  StoreSubscriptionServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storeSubscriptionServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storeSubscriptionServiceHash();

  @$internal
  @override
  $FutureProviderElement<SubscriptionService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SubscriptionService> create(Ref ref) {
    return storeSubscriptionService(ref);
  }
}

String _$storeSubscriptionServiceHash() =>
    r'3120603fd73206da4e3cc167f1be396b5fbd87e7';

@ProviderFor(subscriptionServiceNotifier)
final subscriptionServiceProvider = SubscriptionServiceNotifierProvider._();

final class SubscriptionServiceNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<SubscriptionService>,
          SubscriptionService,
          FutureOr<SubscriptionService>
        >
    with
        $FutureModifier<SubscriptionService>,
        $FutureProvider<SubscriptionService> {
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
  $FutureProviderElement<SubscriptionService> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SubscriptionService> create(Ref ref) {
    return subscriptionServiceNotifier(ref);
  }
}

String _$subscriptionServiceNotifierHash() =>
    r'3eabf0f4e3b9600a2e84902bc683c0be48cf0a8f';
