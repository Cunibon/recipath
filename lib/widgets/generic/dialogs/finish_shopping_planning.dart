import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';

class FinishShoppingPlanning extends StatelessWidget {
  const FinishShoppingPlanning({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TwoOptionDialog(
      title: localization.finishShoppingPlanning,
      content: localization.finishShoppingContent,
      agree: localization.yes,
      disagree: localization.no,
    );
  }
}
