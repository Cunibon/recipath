// Copyright (c) 2025 Michael Neufeld
// Licensed under the MIT License. See LICENSE file in the project root for details.

import 'package:recipath/application_constants.dart';
import 'package:recipath/bootstrap.dart';
import 'package:recipath/domain_service/subscription_service/revenue_cat_subscription_service.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_service_notifier.dart';
import 'package:recipath/domain_service/subscription_service/subscription_service_notifier.dart';

void main() => bootstrap(
  overrides: [
    storeSubscriptionServiceProvider.overrideWith((ref) async {
      final authService = await ref.watch(authServiceProvider.future);

      return RevenueCatSubscriptionService.create(
        apiKey: revenueCatPublicKey,
        userId: authService.currentUser?.id,
      );
    }),
  ],
);
