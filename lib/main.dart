// Copyright (c) 2025 Michael Neufeld
// Licensed under the MIT License. See LICENSE file in the project root for details.

import 'package:recipath/application_constants.dart';
import 'package:recipath/bootstrap.dart';
import 'package:recipath/domain_service/subscription_service/revenue_cat_subscription_service.dart';

void main() => bootstrap(
  createSubscriptionService: (userId) => RevenueCatSubscriptionService.create(
    apiKey: revenueCatPublicKey,
    userId: userId,
  ),
);
