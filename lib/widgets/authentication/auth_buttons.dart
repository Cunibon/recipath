import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/authentication/auth_mutation.dart';
import 'package:recipath/widgets/authentication/dialogs/auth_dialog.dart';
import 'package:recipath/widgets/authentication/dialogs/logout_dialog.dart';
import 'package:recipath/widgets/authentication/reset_state_action.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/providers/subscription/pro_notifier.dart';
import 'package:recipath/widgets/providers/subscription/subscription_service_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_user_notifier.dart';

class AuthButtons extends ConsumerWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(supabaseUserProvider);
    final subscriptionService = ref.watch(subscriptionServiceProvider);
    final localization = AppLocalizations.of(context)!;

    return CachedAsyncValueWrapper(
      asyncState: ref.watch(proProvider),
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
            if (ref.watch(authMutation).isPending ||
                ref.watch(resetStateAction).isPending)
              CircularProgressIndicator()
            else
              TextButton.icon(
                onPressed: () async {
                  final result = await showDialog<bool>(
                    context: context,
                    builder: (context) => LogoutDialog(),
                  );

                  if (result == true) {
                    resetStateAction.run(ref);
                  }
                },
                label: Text(localization.logout),
                icon: Icon(Icons.logout),
              ),
            Text(user.email ?? ""),
            if (!pro && subscriptionService.purchasesAvailable)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: subscriptionService.presentPaywall,
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
