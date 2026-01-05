import 'dart:convert';
import 'dart:io';

import 'package:recipath/application_constants.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'import_screen_notifier.g.dart';

@riverpod
Future<ImportScreenState> importScreenNotifier(Ref ref, String path) async {
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
    originalRecipe: recipeList,
    originalGrocery: groceryMap,
    importRecipe: recipeList,
    importGroceryLookup: {for (final id in groceryMap.keys) id: null},
  );
}
