import 'dart:convert';
import 'dart:io';

import 'package:recipath/application_constants.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/import_screen/data/import_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'import_data_notifier.g.dart';

@riverpod
Future<ImportData> importDataNotifier(Ref ref, String path) async {
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

  return ImportData(recipes: recipeList, groceries: groceryMap);
}
