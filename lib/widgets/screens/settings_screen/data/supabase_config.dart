import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/data/backend_config/backend_config_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/authentication/reset_state_action.dart';
import 'package:recipath/widgets/generic/dialogs/delete_confirmation_dialog.dart';
import 'package:recipath/widgets/providers/backend/auth_user_notifier.dart';
import 'package:recipath/widgets/providers/backend/backend_config_notifier.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/backend_config_credentials_dialog.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/backend_restart_dialog.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/confirm_backend_switch_dialog.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/delete_backend_config_dialog.dart';

class SupabaseConfig extends ConsumerWidget {
  const SupabaseConfig({super.key});

  Future<void> _showRestartDialog(BuildContext context) => showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => const BackendRestartDialog(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final config = ref.watch(backendConfigProvider).value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: () async {
            final signedIn = ref.read(authUserProvider).value != null;

            if (signedIn) {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => ConfirmBackendSwitchDialog(),
              );

              if (confirm != true || !context.mounted) return;
            }

            final result = await showDialog<BackendConfigData>(
              context: context,
              builder: (context) => BackendConfigCredentialsDialog(),
            );

            if (result == null || !context.mounted) return;

            if (signedIn) {
              await resetStateAction.run(ref);
            }
            await ref.read(backendConfigProvider.notifier).set(result);

            if (context.mounted) {
              await _showRestartDialog(context);
            }
          },
          icon: const Icon(Icons.dns),
          label: Text(localization.supabaseConfig),
        ),
        if (config?.custom == true)
          IconButton(
            onPressed: () async {
              final signedIn = ref.read(authUserProvider).value != null;

              final result = await showDialog<bool>(
                context: context,
                builder: (context) => signedIn
                    ? const DeleteBackendConfigDialog()
                    : const DeleteConfirmationDialog(),
              );

              if (result != true || !context.mounted) return;

              if (signedIn) {
                await resetStateAction.run(ref);
              }
              await ref.read(backendConfigProvider.notifier).set(null);

              if (context.mounted) {
                await _showRestartDialog(context);
              }
            },
            icon: const Icon(Icons.delete),
          ),
      ],
    );
  }
}
