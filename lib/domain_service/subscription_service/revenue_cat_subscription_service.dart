import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:recipath/domain_service/subscription_service/subscription_service.dart';

class RevenueCatSubscriptionService implements SubscriptionService {
  RevenueCatSubscriptionService._();

  static Future<RevenueCatSubscriptionService> create({
    required String apiKey,
    required String? userId,
  }) async {
    if (kDebugMode) {
      await Purchases.setLogLevel(LogLevel.debug);
    }
    if (apiKey.isNotEmpty) {
      await Purchases.configure(PurchasesConfiguration(apiKey));

      if (userId != null) {
        await Purchases.logIn(userId);
      }
    }

    return RevenueCatSubscriptionService._();
  }

  bool _isPro(CustomerInfo info) =>
      info.entitlements.active["pro"]?.isActive == true;

  @override
  bool get purchasesAvailable => true;

  @override
  Stream<bool> get proChanges {
    late final StreamController<bool> controller;
    void onCustomerInfo(CustomerInfo info) => controller.add(_isPro(info));

    controller = StreamController<bool>(
      onListen: () => Purchases.addCustomerInfoUpdateListener(onCustomerInfo),
      onCancel: () =>
          Purchases.removeCustomerInfoUpdateListener(onCustomerInfo),
    );

    return controller.stream;
  }

  @override
  Future<bool> isPro() async => _isPro(await Purchases.getCustomerInfo());

  @override
  Future<bool> logIn(String userId) async {
    final result = await Purchases.logIn(userId);
    return _isPro(result.customerInfo);
  }

  @override
  Future<void> logOut() async {
    try {
      await Purchases.logOut();
    } on PlatformException catch (_) {}
  }

  @override
  Future<void> presentPaywall() => RevenueCatUI.presentPaywall();

  @override
  Future<void> presentCustomerCenter() => RevenueCatUI.presentCustomerCenter();
}
