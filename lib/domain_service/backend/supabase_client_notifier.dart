import 'package:recipath/widgets/providers/backend/backend_config_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_client_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<SupabaseClient?> supabaseClientNotifier(Ref ref) async {
  final config = await ref.watch(backendConfigProvider.future);
  if (config == null) return null;

  final supabase = await Supabase.initialize(
    url: config.url,
    publishableKey: config.key,
  );

  return supabase.client;
}
