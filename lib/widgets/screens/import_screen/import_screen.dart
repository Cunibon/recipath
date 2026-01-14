import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/screens/import_screen/import_routes.dart';

class ImportScreen extends StatelessWidget {
  const ImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return NavigationDrawerScaffold(
      titleBuilder: (title) =>
          DefaultNavigationTitle(title: title, syncState: SyncState.synced),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(
              localization.selectFileToImport,
              style: TextTheme.of(context).titleMedium,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: [".recipath"],
                );

                if (result != null && context.mounted) {
                  context.goRelative(
                    ImportRoutes.recipeImport.path,
                    extra: result.files.single.path,
                  );
                }
              },
              icon: Icon(Icons.download),
              label: Text(AppLocalizations.of(context)!.importData),
            ),
          ],
        ),
      ),
    );
  }
}
