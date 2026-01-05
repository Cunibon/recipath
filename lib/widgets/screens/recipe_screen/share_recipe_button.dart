import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:share_plus/share_plus.dart';

class ShareRecipeButton extends ConsumerWidget {
  const ShareRecipeButton({required this.recipes, super.key});

  final List<RecipeData> recipes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    return IconButton(
      onPressed: () async {
        if (recipes.isEmpty) return;
        final groceriesMap = await ref.watch(groceryProvider.future);

        final groceryIds = recipes
            .expand((element) => element.getIngredients(groceriesMap))
            .map((e) => e.groceryId)
            .toSet();
        final groceries = {
          for (final groceryId in groceryIds)
            if (groceriesMap.containsKey(groceryId))
              groceryId: groceriesMap[groceryId]!,
        };

        final allData = {
          recipeDataKey: {for (final recipe in recipes) recipe.id: recipe},
          groceryDataKey: groceries,
        };

        final jsonBytes = utf8.encode(jsonEncode(allData));
        final xfile = XFile.fromData(jsonBytes, mimeType: "application/json");

        late String titel;

        if (recipes.length == 1) {
          titel = recipes.first.title;
        } else {
          titel = localization.recipe;
        }

        final params = ShareParams(
          files: [xfile],
          fileNameOverrides: ["$titel.$fileExtenstion"],
        );

        await SharePlus.instance.share(params);
      },
      icon: Icon(Icons.share),
    );
  }
}
