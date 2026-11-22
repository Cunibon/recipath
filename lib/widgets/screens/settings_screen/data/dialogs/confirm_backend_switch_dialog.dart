import 'package:flutter/widgets.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';

class ConfirmBackendSwitchDialog extends StatelessWidget {
  const ConfirmBackendSwitchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TwoOptionDialog(
      title: localization.supabaseConfigDataLossTitle,
      content: Text(localization.supabaseConfigDataLossContent),
      agree: localization.actionContinue,
      disagree: localization.actionCancel,
    );
  }
}
