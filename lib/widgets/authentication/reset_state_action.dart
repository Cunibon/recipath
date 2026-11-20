import 'package:bound_mutation/bound_mutation.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/widgets/providers/subscription/subscription_service_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';

final resetStateAction = BoundAction((tsx) async {
  final supabaseclient = tsx.get(supabaseClientProvider);
  final syncingService = tsx.get(syncingServiceProvider);
  final database = tsx.get(databaseProvider);

  await tsx.get(subscriptionServiceProvider).logOut();
  await supabaseclient.auth.signOut();
  await syncingService.reset();
  await database.clear();
});
