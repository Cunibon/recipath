import 'dart:async';

import 'package:recipath/domain_service/subscription_service/subscription_service_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pro_notifier.g.dart';

@Riverpod(keepAlive: true)
class ProNotifier extends _$ProNotifier {
  @override
  Future<bool> build() async {
    final service = await ref.watch(subscriptionServiceProvider.future);

    final subscription = service.proChanges.listen(
      (pro) => state = AsyncValue.data(pro),
    );
    ref.onDispose(subscription.cancel);

    return service.isPro();
  }

  Future<void> login(String userId) async {
    final service = await ref.read(subscriptionServiceProvider.future);
    final pro = await service.logIn(userId);
    state = AsyncValue.data(pro);
  }
}
