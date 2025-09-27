// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_customer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(revenueCustomerNotifier)
const revenueCustomerProvider = RevenueCustomerNotifierProvider._();

final class RevenueCustomerNotifierProvider
    extends
        $FunctionalProvider<
          AsyncValue<CustomerInfo>,
          CustomerInfo,
          Stream<CustomerInfo>
        >
    with $FutureModifier<CustomerInfo>, $StreamProvider<CustomerInfo> {
  const RevenueCustomerNotifierProvider._()
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
  $StreamProviderElement<CustomerInfo> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<CustomerInfo> create(Ref ref) {
    return revenueCustomerNotifier(ref);
  }
}

String _$revenueCustomerNotifierHash() =>
    r'e246d0f035cdbf521ade7653b91f1bbf79a5ba59';
