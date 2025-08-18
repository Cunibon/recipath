import 'package:random_string/random_string.dart';
import 'package:recipath/application/grocery_modifier/grocery_modifier.dart';
import 'package:recipath/application/recipe_modifier/recipe_modifier.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier.dart';
import 'package:recipath/application/storage_modifier/storage_modifier.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';

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
    final groceryData = data[groceryDataKey];
    final groceryLookup = await importGrocery(groceryData);

    final recipeData = data[recipeDataKey];
    await importRecipe(recipeData, groceryLookup);

    final shoppingData = data[shoppingDataKey];
    await importShopping(shoppingData, groceryLookup);

    final storageData = data[storageDataKey];
    await importStorage(storageData, groceryLookup);
  }

  Future<Map<String, String>> importGrocery(
    Map<String, dynamic> groceryData,
  ) async {
    final lookup = <String, String>{};

    for (final data in groceryData.values) {
      data["uploaded"] = false;
      final parsed = GroceryData.fromJson(data);
      final copy = parsed.copyWith(id: randomAlphaNumeric(16));
      lookup[parsed.id] = copy.id;
      await groceryModifier.add(copy);
    }

    return lookup;
  }

  Future<void> importRecipe(
    Map<String, dynamic> recipeData,
    Map<String, String> groceryLookup,
  ) async {
    for (final data in recipeData.values) {
      data["uploaded"] = false;
      await recipeModifier.add(
        RecipeData.fromJson(data).copyWithNewId(groceryLookup: groceryLookup),
      );
    }
  }

  Future<void> importShopping(
    Map<String, dynamic> shoppingData,
    Map<String, String> groceryLookup,
  ) async {
    for (final data in shoppingData.values) {
      data["uploaded"] = false;
      await shoppingModifier.updateItem(
        ShoppingData.fromJson(data).copyWithNewId(groceryLookup: groceryLookup),
      );
    }
  }

  Future<void> importStorage(
    Map<String, dynamic> storageData,
    Map<String, String> groceryLookup,
  ) async {
    for (final data in storageData.values) {
      data["uploaded"] = false;
      await storageModifier.updateItem(
        StorageData.fromJson(data).copyWithNewId(groceryLookup: groceryLookup),
      );
    }
  }
}
