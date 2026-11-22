import 'package:material_ui/material_ui.dart';
import 'package:recipath/l10n/app_localizations.dart';

class InformationDialog extends StatelessWidget {
  const InformationDialog({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return AlertDialog(
      content: Text(message, style: TextTheme.of(context).bodyLarge),
      actions: [
        TextButton(
          child: Text(localization.actionOkay),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
