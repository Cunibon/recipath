import 'dart:async';

import 'package:recipath/widgets/providers/revenue_cat/revenue_customer_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'revenue_pro_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<bool> revenueProNotifier(Ref ref) async {
  final userInfo = await ref.watch(revenueCustomerProvider.future);

  return userInfo.entitlements.active["pro"]?.isActive == true;
}
