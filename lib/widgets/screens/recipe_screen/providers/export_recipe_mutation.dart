import 'dart:convert';

import 'package:bound_mutation/bound_mutation.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/common.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/providers/app_localizations_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/tags_per_grocery_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/export_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/tags_per_recipe_notifier.dart';
import 'package:share_plus/share_plus.dart';

final exportRecipeMutation = BoundMutation((tsx, _) async {
  final exportRecipeIds = tsx.get(exportProvider);

  final groceriesMap = await tsx.get(groceryProvider.future);
  final tagsPerRecipe = await tsx.get(tagsPerRecipeProvider.future);
  final tagsPerGrocery = await tsx.get(tagsPerGroceryProvider.future);
  final recipeMap = await tsx.get(recipeProvider.future);

  final recipes = exportRecipeIds?.map((e) => recipeMap[e]).nonNulls;

  if (recipes?.isEmpty ?? true) return;

  final groceries = <String, GroceryData>{};
  final recipeTags = <String, List<TagData>>{};
  final groceryTags = <String, List<TagData>>{};

  for (final recipe in recipes!) {
    final groceryIds = recipe
        .getIngredients(groceriesMap)
        .map((e) => e.groceryId)
        .toSet();

    for (final groceryId in groceryIds) {
      groceries[groceryId] = groceriesMap[groceryId]!;
      groceryTags[groceryId] = tagsPerGrocery[groceryId]?.toList() ?? [];
    }

    recipeTags[recipe.id] = tagsPerRecipe[recipe.id]?.toList() ?? [];
  }

  final allData = {
    recipeDataKey: {for (final recipe in recipes) recipe.id: recipe},
    groceryDataKey: groceries,
    recipeTagDataKey: recipeTags,
    groceryTagDataKey: groceryTags,
  };

  final jsonBytes = utf8.encode(jsonEncode(allData));
  final xfile = XFile.fromData(jsonBytes, mimeType: "application/json");

  final localization = await tsx.get(appLocalizationsProvider.future);

  late String title;

  if (recipes.length == 1) {
    title = normalizeFileName(recipes.first.title);
  } else {
    title = localization.recipe;
  }

  final params = ShareParams(
    files: [xfile],
    fileNameOverrides: ["$title.$fileExtension"],
    text: localization.downloadToImport(storeUrl),
    sharePositionOrigin: sharePopoverAnchor(),
  );

  await SharePlus.instance.share(params);
});
