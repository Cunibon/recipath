import 'dart:convert';

import 'package:recipath/application_constants.dart';
import 'package:recipath/common.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/providers/app_localizations_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_screen_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/tags_per_recipe_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';

part 'export_notifier.g.dart';

@riverpod
class ExportNotifier extends _$ExportNotifier {
  @override
  List<String>? build() => null;

  Future<void> start() async => state = (await ref.read(
    recipeScreenProvider.future,
  )).recipe.map((e) => e.recipeData.id).toList();

  void toggleRecipe(RecipeData data) {
    final stateCopy = List<String>.from(state ?? []);

    if (stateCopy.contains(data.id)) {
      stateCopy.remove(data.id);
    } else {
      stateCopy.add(data.id);
    }

    state = stateCopy;
  }

  Future<void> export() async {
    final groceriesMap = await ref.read(groceryProvider.future);
    final tagsPerRecipe = await ref.watch(tagsPerRecipeProvider.future);
    final recipeMap = await ref.read(recipeProvider.future);

    final recipes = state?.map((e) => recipeMap[e]).nonNulls;

    if (recipes?.isEmpty ?? true) return;

    final groceries = <String, GroceryData>{};
    final tags = <String, List<TagData>>{};

    for (final recipe in recipes!) {
      final groceryIds = recipe
          .getIngredients(groceriesMap)
          .map((e) => e.groceryId)
          .toSet();

      for (final groceryId in groceryIds) {
        groceries[groceryId] = groceriesMap[groceryId]!;
      }

      tags[recipe.id] = tagsPerRecipe[recipe.id]?.toList() ?? [];
    }

    final allData = {
      recipeDataKey: {for (final recipe in recipes) recipe.id: recipe},
      groceryDataKey: groceries,
      tagDataKey: tags,
    };

    final jsonBytes = utf8.encode(jsonEncode(allData));
    final xfile = XFile.fromData(jsonBytes, mimeType: "application/json");

    late String titel;

    if (recipes.length == 1) {
      titel = normalizeFileName(recipes.first.title);
    } else {
      titel = (await ref.read(appLocalizationsProvider.future)).recipe;
    }

    final params = ShareParams(
      files: [xfile],
      fileNameOverrides: ["$titel.$fileExtenstion"],
    );

    await SharePlus.instance.share(params);
  }

  void clear() {
    state = null;
  }
}
