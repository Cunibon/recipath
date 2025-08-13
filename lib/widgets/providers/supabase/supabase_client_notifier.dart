import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_client_notifier.g.dart';

@riverpod
SupabaseClient supabaseClient(Ref ref) => Supabase.instance.client;
