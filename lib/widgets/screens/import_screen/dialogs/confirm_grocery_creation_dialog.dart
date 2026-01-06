import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';

class ConfirmGroceryCreationDialog extends StatelessWidget {
  const ConfirmGroceryCreationDialog({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TwoOptionDialog(
      title: localization.missingMapping,
      content: Text(localization.missingMappingContent(count)),
      agree: localization.actionContinue,
      disagree: localization.actionCancel,
    );
  }
}
