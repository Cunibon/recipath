import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';

class PopConfirmationDialog extends StatelessWidget {
  const PopConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TwoOptionDialog(
      title: localization.leaveThisPage,
      content: localization.leaveThisPageContent,
      agree: localization.yes,
      disagree: localization.no,
    );
  }
}
