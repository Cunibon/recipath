import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawerScaffold(
      body: Column(
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(alignment: Alignment.centerLeft),
            onPressed: () async {
              final dir = await FilePicker.platform.getDirectoryPath();
              if (dir == null) {
                throw Exception("Could not find the downloads directory");
              }

              final allData = {
                for (final key in dataKeys) key: localStorage.getItem(key),
              };

              final file = File("$dir/recipe_list.json");
              await file.writeAsString(jsonEncode(allData));
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
