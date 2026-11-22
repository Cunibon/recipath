import 'package:material_ui/material_ui.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';

class DeleteBackendConfigDialog extends StatelessWidget {
  const DeleteBackendConfigDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TwoOptionDialog(
      title: localization.supabaseConfigRemoveTitle,
      content: Text(localization.supabaseConfigRemoveContent),
      agree: localization.actionContinue,
      disagree: localization.actionCancel,
    );
  }
}
