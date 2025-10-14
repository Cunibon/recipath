import 'dart:async';

import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'revenue_customer_notifier.g.dart';

@Riverpod(keepAlive: true)
class RevenueCustomerNotifier extends _$RevenueCustomerNotifier {
  @override
  Future<CustomerInfo> build() {
    Purchases.addCustomerInfoUpdateListener(setCustomer);
    ref.onDispose(
      () => Purchases.removeCustomerInfoUpdateListener(setCustomer),
    );

    return Purchases.getCustomerInfo();
  }

  void setCustomer(CustomerInfo info) => state = AsyncValue.data(info);
}
