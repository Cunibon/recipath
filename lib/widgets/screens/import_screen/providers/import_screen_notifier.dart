import 'dart:convert';
import 'dart:io';

import 'package:recipath/application_constants.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/import_screen/data/import_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'import_screen_notifier.g.dart';

@riverpod
class ImportScreenNotifier extends _$ImportScreenNotifier {
  @override
  Future<ImportScreenState> build(String path) async {
    final file = File(path);

    final data = jsonDecode(await file.readAsString());

    final groceryData = data[groceryDataKey];
    final recipeData = data[recipeDataKey];

    final groceryMap = <String, GroceryData>{};
    final recipeList = <RecipeData>[];

    for (final data in groceryData.values) {
      final parsed = GroceryData.fromJson(data);
      groceryMap[parsed.id] = parsed;
    }

    for (final data in recipeData.values) {
      recipeList.add(RecipeData.fromJson(data));
    }

    return ImportScreenState(
      path: path,
      originalRecipe: recipeList,
      originalGrocery: groceryMap,
      importRecipe: recipeList,
      importGroceryLookup: {},
    );
  }

  void toggleRecipe(RecipeData recipe) {
    final currentState = state.value!;
    final currentList = List<RecipeData>.from(currentState.importRecipe);

    state = AsyncValue.data(
      currentState.copyWith(
        importRecipe: currentList.contains(recipe)
            ? (currentList..remove(recipe))
            : (currentList..add(recipe)),
      ),
    );
  }

  void calculateGroceries() {
    final currentState = state.value!;

    final groceryIds = currentState.importRecipe
        .expand(
          (element) => element.getIngredients(currentState.originalGrocery),
        )
        .map((e) => e.groceryId)
        .toSet();
    final groceries = {
      for (final groceryId in groceryIds)
        if (currentState.originalGrocery.containsKey(groceryId))
          groceryId: currentState.originalGrocery[groceryId]!,
    };

    state = AsyncValue.data(
      currentState.copyWith(importGroceryLookup: groceries),
    );
  }

  void selectGrocery(String origin, GroceryData groceryData) {
    final currentState = state.value!;
    final currentLookup = Map<String, GroceryData>.from(
      currentState.importGroceryLookup,
    );

    state = AsyncValue.data(
      currentState.copyWith(
        importGroceryLookup: currentLookup..[origin] = groceryData,
      ),
    );
  }
}
