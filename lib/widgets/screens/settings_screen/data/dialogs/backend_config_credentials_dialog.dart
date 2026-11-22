import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/data/backend_config/backend_config_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/backend_config_check_mutation.dart';

class BackendConfigCredentialsDialog extends ConsumerStatefulWidget {
  const BackendConfigCredentialsDialog({super.key});

  @override
  ConsumerState<BackendConfigCredentialsDialog> createState() =>
      _BackendConfigCredentialsDialogState();
}

class _BackendConfigCredentialsDialogState
    extends ConsumerState<BackendConfigCredentialsDialog> {
  final formKey = GlobalKey<FormState>();
  final urlController = TextEditingController();
  final keyController = TextEditingController();

  @override
  void dispose() {
    urlController.dispose();
    keyController.dispose();
    super.dispose();
  }

  Future<void> save() async {
    if (formKey.currentState?.validate() != true) {
      return;
    }

    final newConfig = BackendConfigData(
      url: urlController.text.trim().replaceAll(RegExp(r'/+$'), ''),
      key: keyController.text.trim(),
    );

    await backendConfigCheck.run(ref, newConfig);

    if (mounted) {
      Navigator.pop(context, newConfig);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final checkState = ref.watch(backendConfigCheck);

    return AlertDialog(
      title: Text(localization.supabaseConfig),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localization.supabaseConfigDescription,
                style: TextTheme.of(context).bodyMedium,
              ),
              TextFormField(
                controller: urlController,
                decoration: InputDecoration(
                  labelText: localization.supabaseConfigUrl,
                  prefixIcon: const Icon(Icons.language),
                ),
                keyboardType: TextInputType.url,
                autocorrect: false,
                validator: (value) {
                  final uri = Uri.tryParse(value?.trim() ?? '');
                  if (uri == null ||
                      !uri.isScheme('https') ||
                      uri.host.isEmpty) {
                    return localization.supabaseConfigUrlInvalid;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: keyController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: localization.supabaseConfigKey,
                  prefixIcon: const Icon(Icons.key),
                ),
                autocorrect: false,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return localization.objectInvalid(
                      localization.supabaseConfigKey,
                    );
                  }
                  return null;
                },
              ),
              if (checkState case MutationError(:final error))
                Text(
                  error is BackendConfigKeyRejectedException
                      ? localization.supabaseConfigKeyRejected
                      : localization.supabaseConfigUnreachable,
                  style: TextTheme.of(
                    context,
                  ).bodyMedium?.copyWith(color: ColorScheme.of(context).error),
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: checkState.isPending
              ? null
              : () {
                  Navigator.pop(context, null);
                },
          child: Text(localization.actionCancel),
        ),
        TextButton(
          onPressed: checkState.isPending ? null : save,
          child: checkState.isPending
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(localization.save),
        ),
      ],
    );
  }
}
