import 'dart:convert';

import 'package:recipath/application_constants.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/providers/app_localizations_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';

part 'export_notifier.g.dart';

@riverpod
class ExportNotifier extends _$ExportNotifier {
  @override
  List<String>? build() => null;

  void start() => state = [];

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
    final recipeMap = await ref.read(recipeProvider.future);

    final recipes = state?.map((e) => recipeMap[e]).nonNulls;

    if (recipes?.isEmpty ?? true) return;

    final groceryIds = recipes!
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
