import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';

class MakeCopyDialog extends StatelessWidget {
  const MakeCopyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TwoOptionDialog(
      content: Text(localization.saveCopyContent),
      agree: localization.yes,
      disagree: localization.no,
    );
  }
}
