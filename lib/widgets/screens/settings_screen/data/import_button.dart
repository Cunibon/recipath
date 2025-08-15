import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/providers/application_path_provider.dart';
import 'package:recipe_list/repos/grocery/grocery_repo_notifier.dart';
import 'package:recipe_list/repos/recipe/recipe_repo_notifier.dart';
import 'package:recipe_list/repos/shopping/shopping_repo_notifier.dart';
import 'package:recipe_list/repos/storage/storage_repo_notifier.dart';
import 'package:share_plus/share_plus.dart';

class ImportButton extends ConsumerWidget {
  const ImportButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () async {
        final dir = ref.read(applicationPathProvider);

        final allData = {
          recipeDataKey: await ref.read(recipeRepoNotifierProvider).get(),
          shoppingDataKey: await ref.read(shoppingRepoNotifierProvider).get(),
          storageDataKey: await ref.read(storageRepoNotifierProvider).get(),
          groceryDataKey: await ref.read(groceryRepoNotifierProvider).get(),
        };

        final filePath = "${dir.path}/recipe_list.json";

        final file = File(filePath);
        await file.writeAsString(jsonEncode(allData));

        final params = ShareParams(files: [XFile(filePath)]);

        await SharePlus.instance.share(params);
      },
      icon: Icon(Icons.upload),
      label: Text("Export data"),
    );
  }
}
