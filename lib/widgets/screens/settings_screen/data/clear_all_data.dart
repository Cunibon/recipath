import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/authentication/reset_state_mutation.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/clear_all_data_dialog.dart';

class ClearAllData extends ConsumerWidget {
  const ClearAllData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () async {
        final result = await showDialog<bool>(
          context: context,
          builder: (context) => ClearAllDataDialog(),
        );

        if (result == true) {
          resetStateMutation.run(ref, null);
        }
      },
      icon: Icon(Icons.delete_forever),
      label: Text(AppLocalizations.of(context)!.clearAllData),
    );
  }
}
