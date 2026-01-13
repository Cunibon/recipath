import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';

class ConfirmCreationDialog extends StatelessWidget {
  const ConfirmCreationDialog({
    required this.count,
    required this.type,
    super.key,
  });

  final int count;
  final String type;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TwoOptionDialog(
      title: localization.missingMapping,
      content: Text(localization.missingMappingContent(count, type)),
      agree: localization.actionContinue,
      disagree: localization.actionCancel,
    );
  }
}
