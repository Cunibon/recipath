import 'dart:convert';
import 'dart:io';

import 'package:recipath/application_constants.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/screens/import_screen/data/import_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'import_data_notifier.g.dart';

@riverpod
Future<ImportData> importDataNotifier(Ref ref, String path) async {
  final file = File(path);

  final data = jsonDecode(await file.readAsString());

  final groceryData = data[groceryDataKey];
  final recipeData = data[recipeDataKey];
  final tagData = data[tagDataKey];

  final groceryMap = <String, GroceryData>{};
  final recipeList = <RecipeData>[];
  final tagsPerRecipe = <String, Set<TagData>>{};

  for (final data in groceryData.values) {
    final parsed = GroceryData.fromJson(data);
    groceryMap[parsed.id] = parsed;
  }

  for (final data in recipeData.values) {
    recipeList.add(RecipeData.fromJson(data));
  }

  for (final data in tagData.entries) {
    tagsPerRecipe[data.key] = {
      for (final tagData in data.value) TagData.fromJson(tagData),
    };
  }

  return ImportData(
    recipes: recipeList,
    groceries: groceryMap,
    tagsPerRecipe: tagsPerRecipe,
  );
}
