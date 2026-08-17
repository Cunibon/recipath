import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/delete_account_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        final result = await showDialog<bool>(
          context: context,
          builder: (context) => DeleteAccountDialog(),
        );

        if (result == true) {
          await launchUrl(
            Uri.parse(
              "https://firebon.de:8081/recipath/accountDeletion/delete-account.php",
            ),
          );
        }
      },
      icon: Icon(Icons.person_off),
      label: Text(AppLocalizations.of(context)!.deleteAccount),
    );
  }
}
