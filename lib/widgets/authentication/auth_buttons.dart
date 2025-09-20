import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/authentication/auth_dialog.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/providers/revenue_cat/revenue_pro_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_user_notifier.dart';

class AuthButtons extends ConsumerWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(supabaseUserProvider);
    final localization = AppLocalizations.of(context)!;

    return CachedAsyncValueWrapper(
      asyncState: ref.watch(revenueProProvider),
      builder: (pro) => Column(
        children: [
          if (user == null) ...[
            TextButton.icon(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AuthDialog(isLogin: true),
              ),
              label: Text(localization.login),
              icon: Icon(Icons.person),
            ),
            TextButton.icon(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AuthDialog(isLogin: false),
              ),
              label: Text(localization.register),
              icon: Icon(Icons.person_add),
            ),
          ] else ...[
            TextButton.icon(
              onPressed: () async {
                Purchases.logOut();
                await ref.read(supabaseClientProvider).auth.signOut();
                await (await ref.read(syncingServiceProvider.future)).reset();
                await ref.read(databaseProvider).clear();
              },
              label: Text(localization.logout),
              icon: Icon(Icons.logout),
            ),
            Text(user.email ?? ""),
            if (!pro)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () => RevenueCatUI.presentPaywall(),
                  label: Text(localization.goPro),
                  icon: Icon(Icons.star),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
