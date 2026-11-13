import 'package:material_ui/material_ui.dart';
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

  Uri? _parseUrl(String value) {
    final trimmed = value.trim();
    final uri = Uri.tryParse(
      trimmed.contains('://') ? trimmed : 'https://$trimmed',
    );
    if (uri == null ||
        !(uri.isScheme('http') || uri.isScheme('https')) ||
        !uri.host.contains('.')) {
      return null;
    }
    return uri;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

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
                if (_parseUrl(value) == null) {
                  return localization.enterValidUrl;
                }

                return null;
              },
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
          child: Text(localization.actionContinue),
          onPressed: () async {
            if (formKey.currentState?.validate() == true) {
              AiImportMutation.runUrlImport(
                ref,
                _parseUrl(urlController.text)!.toString(),
              );

              if (context.mounted) {
                Navigator.pop(context);
              }
            }
          },
        ),
      ],
    );
  }
}
