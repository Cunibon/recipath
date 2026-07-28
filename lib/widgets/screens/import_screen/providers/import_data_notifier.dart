import 'dart:convert';
import 'dart:io';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
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
  final recipeTagData = data[recipeTagDataKey] ?? data[tagDataKey];
  final groceryTagData = data[groceryTagDataKey];

  final groceryMap = <String, GroceryData>{};
  final recipeList = <RecipeData>[];
  final tagsPerRecipe = <String, Set<TagData>>{};
  final tagsPerGrocery = <String, Set<TagData>>{};

  for (final data in groceryData.values) {
    final parsed = GroceryData.fromJson(data);
    groceryMap[parsed.id] = parsed;
  }

  for (final data in recipeData.values) {
    recipeList.add(RecipeData.fromJson(data));
  }

  for (final data in recipeTagData.entries) {
    tagsPerRecipe[data.key] = {
      for (final tagData in data.value) TagData.fromJson(tagData),
    };
  }

  for (final data in groceryTagData.entries) {
    tagsPerGrocery[data.key] = {
      for (final tagData in data.value) TagData.fromJson(tagData),
    };
  }

  return ImportData(
    recipes: recipeList,
    groceries: groceryMap.lock,
    tagsPerRecipe: tagsPerRecipe.toIMap(),
    tagsPerGrocery: tagsPerGrocery.toIMap(),
  );
}
