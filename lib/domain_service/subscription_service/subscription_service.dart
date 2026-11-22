abstract class SubscriptionService {
  bool get purchasesAvailable;

  Stream<bool> get proChanges;

  Future<bool> isPro();

  Future<bool> logIn(String userId);

  Future<void> logOut();

  Future<void> presentPaywall();

  Future<void> presentCustomerCenter();
}
