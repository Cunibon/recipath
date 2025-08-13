import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/widgets/authentication/auth_dialog.dart';
import 'package:recipe_list/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:recipe_list/widgets/providers/supabase/supabase_user_notifier.dart';

class AuthButtons extends ConsumerWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(supabaseUserProvider);

    return Column(
      children: [
        if (user == null) ...[
          TextButton.icon(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AuthDialog(isLogin: true),
            ),
            label: Text("Login"),
            icon: Icon(Icons.person),
          ),
          TextButton.icon(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AuthDialog(isLogin: false),
            ),
            label: Text("Register"),
            icon: Icon(Icons.person_add),
          ),
        ] else ...[
          TextButton.icon(
            onPressed: () async {
              await ref.read(supabaseClientProvider).auth.signOut();
              await ref.read(syncingServiceNotifierProvider).reset();
              await ref.read(databaseNotifierProvider).clear();
            },
            label: Text("Logout"),
            icon: Icon(Icons.logout),
          ),
          Text(user.email ?? ""),
        ],
      ],
    );
  }
}
