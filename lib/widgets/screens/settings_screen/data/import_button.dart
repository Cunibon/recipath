import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/domain_service/import_service/data_import_service_notifier.dart';
import 'package:recipe_list/l10n/app_localizations.dart';

class ImportButton extends ConsumerWidget {
  const ImportButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ["json"],
        );

        if (result != null) {
          File file = File(result.files.single.path!);

          final data = jsonDecode(await file.readAsString());

          if (data is Map<String, dynamic>) {
            ref.read(dataImportServiceNotifierProvider).import(data);
          }
        }
      },
      icon: Icon(Icons.download),
      label: Text(AppLocalizations.of(context)!.importData),
    );
  }
}
