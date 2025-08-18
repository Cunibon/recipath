import 'package:flutter/material.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/widgets/generic/dialogs/two_option_dialog.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TwoOptionDialog(
      content: localization.reallyDelete,
      agree: localization.yes,
      disagree: localization.no,
    );
  }
}
