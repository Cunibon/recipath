import 'package:bound_mutation/bound_mutation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';

final resetStateMutation = BoundMutation((tsx, _) async {
  final supabaseclient = tsx.get(supabaseClientProvider);
  final syncingService = tsx.get(syncingServiceProvider);
  final database = tsx.get(databaseProvider);

  try {
    await Purchases.logOut();
  } on PlatformException catch (_) {}
  await supabaseclient.auth.signOut();
  await syncingService.reset();
  await database.clear();
});
