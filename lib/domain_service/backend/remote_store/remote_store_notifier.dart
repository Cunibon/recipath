import 'package:recipath/domain_service/backend/remote_store/no_remote_store.dart';
import 'package:recipath/domain_service/backend/remote_store/remote_store.dart';
import 'package:recipath/domain_service/backend/remote_store/supabase_remote_store.dart';
import 'package:recipath/domain_service/backend/supabase_client_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_store_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<RemoteStore> remoteStoreNotifier(Ref ref) async {
  final client = await ref.watch(supabaseClientProvider.future);

  return client == null ? NoRemoteStore() : SupabaseRemoteStore(client);
}
