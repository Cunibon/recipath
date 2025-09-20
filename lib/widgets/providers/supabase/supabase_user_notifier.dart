import 'package:recipath/widgets/providers/supabase/supabase_auth_state_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_user_notifier.g.dart';

@riverpod
User? supabaseUser(Ref ref) {
  ref.watch(supabaseAuthStateProvider);
  return ref.watch(supabaseClientProvider).auth.currentUser;
}
