import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/providers/application_path_provider.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationDrawerScaffold(
      body: Column(
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(alignment: Alignment.centerLeft),
            onPressed: () async {
              final dir = await ref.read(applicationPathProvider.future);

              final allData = {
                for (final key in dataKeys) key: localStorage.getItem(key),
              };

              final filePath = "${dir.path}/recipe_list.json";

              final file = File(filePath);
              await file.writeAsString(jsonEncode(allData));

              final params = ShareParams(files: [XFile(filePath)]);

              await SharePlus.instance.share(params);
            },
            icon: Icon(Icons.upload),
            label: Text("Export data"),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(alignment: Alignment.centerLeft),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ["json"],
              );

              if (result != null) {
                File file = File(result.files.single.path!);

                final data = jsonDecode(await file.readAsString());

                if (data is Map) {
                  for (final key in dataKeys) {
                    localStorage.setItem(key, data[key]);
                  }
                }
              }
            },
            icon: Icon(Icons.download),
            label: Text("Import data"),
          ),
        ],
      ),
    );
  }
}
