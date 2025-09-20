import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_auth_state_notifier.g.dart';

@riverpod
Stream<AuthState> supabaseAuthState(Ref ref) =>
    ref.read(supabaseClientProvider).auth.onAuthStateChange;
