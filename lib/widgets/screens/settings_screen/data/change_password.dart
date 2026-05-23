import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/change_password_dialog.dart';

class ChangePassword extends ConsumerWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => ChangePasswordDialog(),
      ),
      icon: Icon(Icons.password),
      label: Text(AppLocalizations.of(context)!.changePassword),
    );
  }
}
