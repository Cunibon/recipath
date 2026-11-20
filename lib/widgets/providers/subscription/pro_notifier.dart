import 'dart:async';

import 'package:recipath/widgets/providers/subscription/subscription_service_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pro_notifier.g.dart';

@Riverpod(keepAlive: true)
class ProNotifier extends _$ProNotifier {
  @override
  Future<bool> build() {
    final service = ref.watch(subscriptionServiceProvider);

    final subscription = service.proChanges.listen(
      (pro) => state = AsyncValue.data(pro),
    );
    ref.onDispose(subscription.cancel);

    return service.isPro();
  }

  Future<void> login(String userId) async {
    final pro = await ref.read(subscriptionServiceProvider).logIn(userId);
    state = AsyncValue.data(pro);
  }
}
