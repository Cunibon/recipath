import 'dart:convert';

import 'package:random_string/random_string.dart';
import 'package:recipe_list/application/grocery_modifier/grocery_modifier.dart';
import 'package:recipe_list/application/recipe_modifier/recipe_modifier.dart';
import 'package:recipe_list/application/shopping_modifier/shopping_modifier.dart';
import 'package:recipe_list/application/storage_modifier/storage_modifier.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/data/shopping_data.dart';

class DataImportService {
  DataImportService({
    required this.recipeModifier,
    required this.shoppingModifier,
    required this.storageModifier,
    required this.groceryModifier,
  });
  final RecipeModifier recipeModifier;
  final ShoppingModifier shoppingModifier;
  final StorageModifier storageModifier;
  final GroceryModifier groceryModifier;

  Future<void> import(Map<String, dynamic> data) async {
    final groceryData = jsonDecode(data[groceryDataKey]);
    if (groceryData is Map<String, dynamic>) {
      await importGrocery(groceryData);
    }

    final recipeData = jsonDecode(data[recipeDataKey]);
    if (recipeData is Map<String, dynamic>) {
      await importRecipe(recipeData);
    }

    final shoppingData = jsonDecode(data[shoppingDataKey]);
    if (shoppingData is Map<String, dynamic>) {
      await importShopping(shoppingData);
    }

    final storageData = jsonDecode(data[storageDataKey]);
    if (storageData is Map<String, dynamic>) {
      await importStorage(storageData);
    }
  }

  Future<void> importRecipe(Map<String, dynamic> recipeData) async {
    for (final recipe in recipeData.entries) {
      final steps = recipe.value["steps"] as List<dynamic>;
      for (final step in steps) {
        final ingredients = step["ingredients"] as List<dynamic>;
        for (final ingredient in ingredients) {
          if (ingredient["id"] == null) {
            ingredient["id"] = randomAlphaNumeric(16);
          }
        }
      }
    }

    for (final data in recipeData.values) {
      await recipeModifier.add(RecipeData.fromJson(data));
    }
  }

  Future<void> importShopping(Map<String, dynamic> shoppingData) async {
    for (final shopping in shoppingData.entries) {
      final ingredient = shopping.value["ingredient"];
      if (ingredient["id"] == null) {
        ingredient["id"] = randomAlphaNumeric(16);
      }
    }

    for (final data in shoppingData.values) {
      await shoppingModifier.updateItem(ShoppingData.fromJson(data));
    }
  }

  Future<void> importStorage(Map<String, dynamic> storageData) async {
    for (final entry in storageData.entries) {
      if (entry.value["id"] == null) {
        entry.value["id"] = randomAlphaNumeric(16);
      }
    }

    for (final data in storageData.values) {
      await storageModifier.updateItem(IngredientData.fromJson(data));
    }
  }

  Future<void> importGrocery(Map<String, dynamic> groceryData) async {
    for (final data in groceryData.values) {
      await groceryModifier.add(GroceryData.fromJson(data));
    }
  }
}
