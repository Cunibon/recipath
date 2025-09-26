import 'dart:async';

import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'revenue_customer_notifier.g.dart';

@Riverpod(keepAlive: true)
Stream<CustomerInfo> revenueCustomerNotifier(Ref ref) {
  final controller = StreamController<CustomerInfo>();
  void addToStream(CustomerInfo info) => controller.add(info);

  Future.delayed(Duration.zero, () async {
    final firstValue = await Purchases.getCustomerInfo();
    addToStream(firstValue);
    Purchases.addCustomerInfoUpdateListener(addToStream);
    ref.onDispose(
      () => Purchases.removeCustomerInfoUpdateListener(addToStream),
    );
  });

  return controller.stream;
}
