// Copyright (c) 2025 Michael Neufeld
// Licensed under the MIT License. See LICENSE file in the project root for details.

import 'package:recipath/bootstrap.dart';
import 'package:recipath/domain_service/subscription_service/no_subscription_service.dart';

void main() => bootstrap(
  createSubscriptionService: (userId) async => NoSubscriptionService(),
);
