import 'package:recipath/domain_service/subscription_service/subscription_service.dart';

class NoSubscriptionService implements SubscriptionService {
  @override
  bool get purchasesAvailable => false;

  @override
  Stream<bool> get proChanges => const Stream.empty();

  @override
  Future<bool> isPro() async => true;

  @override
  Future<bool> logIn(String userId) async => true;

  @override
  Future<void> logOut() async {}

  @override
  Future<void> presentPaywall() async {}

  @override
  Future<void> presentCustomerCenter() async {}
}
