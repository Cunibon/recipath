import 'package:recipath/widgets/providers/backend/backend_config_notifier.dart';
import 'package:recipath/domain_service/subscription_service/no_subscription_service.dart';
import 'package:recipath/domain_service/subscription_service/subscription_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscription_service_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<SubscriptionService> storeSubscriptionService(Ref ref) async =>
    NoSubscriptionService();

@Riverpod(keepAlive: true)
Future<SubscriptionService> subscriptionServiceNotifier(Ref ref) async {
  final config = await ref.watch(backendConfigProvider.future);
  if (config == null || config.custom) return NoSubscriptionService();

  return ref.watch(storeSubscriptionServiceProvider.future);
}
