import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/repos/grocery/grocery_repo_notifier.dart';
import 'package:recipath/repos/recipe/recipe_repo_notifier.dart';
import 'package:recipath/repos/shopping/shopping_repo_notifier.dart';
import 'package:recipath/repos/storage/storage_repo_notifier.dart';
import 'package:share_plus/share_plus.dart';

class ExportButton extends ConsumerWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () async {
        final dir = ref.read(applicationPathProvider);

        final allData = {
          recipeDataKey: await ref.read(recipeRepoProvider).get(),
          shoppingDataKey: await ref.read(shoppingRepoProvider).get(),
          storageDataKey: await ref.read(storageRepoProvider).get(),
          groceryDataKey: await ref.read(groceryRepoProvider).get(),
        };

        final filePath = "${dir.path}/recipath.json";

        final file = File(filePath);
        await file.writeAsString(jsonEncode(allData));

        final params = ShareParams(files: [XFile(filePath)]);

        await SharePlus.instance.share(params);
      },
      icon: Icon(Icons.upload),
      label: Text(AppLocalizations.of(context)!.exportData),
    );
  }
}
