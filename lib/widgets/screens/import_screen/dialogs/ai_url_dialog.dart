import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/import_screen/mutation/ai_import_mutation.dart';

class AiUrlDialog extends ConsumerStatefulWidget {
  const AiUrlDialog({super.key});

  @override
  ConsumerState<AiUrlDialog> createState() => _AiUrlDialogState();
}

class _AiUrlDialogState extends ConsumerState<AiUrlDialog> {
  final formKey = GlobalKey<FormState>();
  final urlController = TextEditingController();

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final import = ref.watch(AiImportMutation.mutation);

    return AlertDialog(
      title: Text(localization.addAiUrlDescription),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            TextFormField(
              controller: urlController,
              decoration: InputDecoration(hintText: localization.importUrl),
              validator: (value) {
                if (value == null) {
                  return localization.addAiToken;
                }
                final uri = Uri.tryParse(value);
                if (uri == null) {
                  return localization.enterValidUrl;
                }

                return null;
              },
            ),
            if (import is MutationError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  localization.somethingWentWrong,
                  style: TextTheme.of(
                    context,
                  ).bodyMedium?.copyWith(color: ColorScheme.of(context).error),
                ),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text(localization.actionCancel),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        TextButton(
          child: import is MutationPending
              ? CircularProgressIndicator()
              : Text(localization.actionContinue),
          onPressed: () async {
            if (formKey.currentState?.validate() == true) {
              final result = await AiImportMutation.runUrlImport(
                ref,
                urlController.text,
              );

              if (context.mounted) {
                Navigator.pop(context, result);
              }
            }
          },
        ),
      ],
    );
  }
}
