import 'package:recipath/domain_service/backend/auth_service/auth_service.dart';
import 'package:recipath/domain_service/backend/auth_service/no_auth_service.dart';
import 'package:recipath/domain_service/backend/auth_service/supabase_auth_service.dart';
import 'package:recipath/domain_service/backend/supabase_client_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<AuthService> authServiceNotifier(Ref ref) async {
  final client = await ref.watch(supabaseClientProvider.future);

  return client == null ? NoAuthService() : SupabaseAuthService(client);
}
