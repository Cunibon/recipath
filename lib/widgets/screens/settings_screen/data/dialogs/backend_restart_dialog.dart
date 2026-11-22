import 'dart:io';

import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/l10n/app_localizations.dart';

class BackendRestartDialog extends StatelessWidget {
  const BackendRestartDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return PopScope(
      canPop: false,
      child: AlertDialog(
        title: Text(localization.supabaseConfigRestartTitle),
        content: Text(localization.supabaseConfigRestartContent),
        actions: [
          if (Platform.isAndroid)
            TextButton(
              onPressed: SystemNavigator.pop,
              child: Text(localization.supabaseConfigCloseApp),
            ),
        ],
      ),
    );
  }
}
