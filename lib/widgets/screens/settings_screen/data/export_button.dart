import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/repos/grocery/grocery_repo_notifier.dart';
import 'package:recipath/repos/recipe/drift/recipe_repo_notifier.dart';
import 'package:recipath/repos/shopping/shopping_repo_notifier.dart';
import 'package:recipath/repos/storage/storage_repo_notifier.dart';
import 'package:share_plus/share_plus.dart';

class ExportButton extends ConsumerWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () async {
        final allData = {
          recipeDataKey: await ref.read(recipeRepoProvider).get(),
          shoppingDataKey: await ref.read(shoppingRepoProvider).get(),
          storageDataKey: await ref.read(storageRepoProvider).get(),
          groceryDataKey: await ref.read(groceryRepoProvider).get(),
        };

        final jsonBytes = utf8.encode(jsonEncode(allData));

        final xfile = XFile.fromData(jsonBytes, mimeType: "application/json");

        final params = ShareParams(
          files: [xfile],
          fileNameOverrides: ["recipath.json"],
        );

        await SharePlus.instance.share(params);
      },
      icon: Icon(Icons.upload),
      label: Text(AppLocalizations.of(context)!.exportData),
    );
  }
}
