import 'package:bound_mutation/bound_mutation.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_service_notifier.dart';
import 'package:recipath/domain_service/subscription_service/subscription_service_notifier.dart';

final resetStateAction = BoundAction((tsx) async {
  final authService = await tsx.get(authServiceProvider.future);
  final syncingService = tsx.get(syncingServiceProvider);
  final database = tsx.get(databaseProvider);

  final subscriptionService = await tsx.get(subscriptionServiceProvider.future);

  await subscriptionService.logOut();
  await authService.signOut();
  await syncingService.reset();
  await database.clear();
});
