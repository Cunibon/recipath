import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';

class CloseAppDialog extends StatelessWidget {
  const CloseAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TwoOptionDialog(
      title: localization.closeTheApp,
      agree: localization.yes,
      disagree: localization.no,
    );
  }
}
