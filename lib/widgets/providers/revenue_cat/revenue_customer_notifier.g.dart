// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_customer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RevenueCustomerNotifier)
final revenueCustomerProvider = RevenueCustomerNotifierProvider._();

final class RevenueCustomerNotifierProvider
    extends $AsyncNotifierProvider<RevenueCustomerNotifier, CustomerInfo> {
  RevenueCustomerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'revenueCustomerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$revenueCustomerNotifierHash();

  @$internal
  @override
  RevenueCustomerNotifier create() => RevenueCustomerNotifier();
}

String _$revenueCustomerNotifierHash() =>
    r'12950234fb93ee748a3546d866ed6eb11315e7d7';

abstract class _$RevenueCustomerNotifier extends $AsyncNotifier<CustomerInfo> {
  FutureOr<CustomerInfo> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CustomerInfo>, CustomerInfo>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CustomerInfo>, CustomerInfo>,
              AsyncValue<CustomerInfo>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
