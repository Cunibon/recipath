import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipe_list/data/shopping_data/shopping_data.dart';
import 'package:recipe_list/data/storage_data/storage_data.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension DownloadDataExtension on SyncingService {
  Future<({DateTime? downloadTime, int downloadCount})> download() async {
    final initalSync = lastSync == DateTime.fromMicrosecondsSinceEpoch(0);

    final groceryData = await applyOrderAndFiltering(
      supabaseClient.from(SupabaseTables.grocery),
    );
    for (final grocery in groceryData) {
      await groceryRepo.add(GroceryData.fromSupabase(grocery));
    }

    final ingredientData = await applyOrderAndFiltering(
      supabaseClient.from(SupabaseTables.ingredient),
    );
    final ingredientLookup = <String, IngredientData>{};
    for (final rawIngredient in ingredientData) {
      final ingredient = IngredientData.fromSupabase(rawIngredient);
      ingredientLookup[ingredient.id] = ingredient;
    }

    final recipeStepIngredientData = await applyOrderAndFiltering(
      supabaseClient.from(SupabaseTables.recipeStepIngredient),
    );

    final recipeStepData = await applyOrderAndFiltering(
      supabaseClient.from(SupabaseTables.recipeStep),
    );

    final recipeData = await applyOrderAndFiltering(
      supabaseClient.from(SupabaseTables.recipe),
    );

    await reconstructRecipeData(
      ingredientLookup: ingredientLookup,
      recipeStepIngredientData: recipeStepIngredientData,
      recipeStepData: recipeStepData,
      recipeData: recipeData,
    );

    var shoppingDataQuery = supabaseClient
        .from(SupabaseTables.shopping)
        .select()
        .gt(SyncingService.updatedAtKey, lastSync.toIso8601String());

    if (initalSync) {
      shoppingDataQuery = shoppingDataQuery.eq("deleted", false);
    }

    final shoppingData = await shoppingDataQuery.order(
      SyncingService.updatedAtKey,
      ascending: true,
    );
    for (final rawShoppingData in shoppingData) {
      final shoppingData = ShoppingData.fromSupabase(
        rawShoppingData,
        ingredientLookup[rawShoppingData["ingredient_id"]]!,
      );

      if (shoppingData.deleted) {
        await shoppingRepo.delete(shoppingData.id);
      } else {
        await shoppingRepo.add(shoppingData);
      }
    }

    var storageDataQuery = supabaseClient
        .from(SupabaseTables.storage)
        .select()
        .gt(SyncingService.updatedAtKey, lastSync.toIso8601String());

    if (initalSync) {
      storageDataQuery = storageDataQuery.eq("deleted", false);
    }

    final storageData = await storageDataQuery.order(
      SyncingService.updatedAtKey,
      ascending: true,
    );
    for (final rawStorageData in storageData) {
      final storageData = StorageData.fromSupabase(
        rawStorageData,
        ingredientLookup[rawStorageData["ingredient_id"]]!,
      );

      if (storageData.deleted) {
        await storageRepo.delete(storageData.id);
      } else {
        await storageRepo.add(storageData);
      }
    }

    return (
      downloadTime: _findNewestDate(
        [
          groceryData.lastOrNull,
          ingredientData.lastOrNull,
          recipeStepIngredientData.lastOrNull,
          recipeStepData.lastOrNull,
          recipeData.lastOrNull,
          shoppingData.lastOrNull,
          storageData.lastOrNull,
        ].nonNulls,
      ),
      downloadCount:
          groceryData.length +
          ingredientData.length +
          recipeData.length +
          shoppingData.length +
          storageData.length,
    );
  }

  Future<void> reconstructRecipeData({
    required Map<String, IngredientData> ingredientLookup,
    required List<Map<String, dynamic>> recipeStepIngredientData,
    required List<Map<String, dynamic>> recipeStepData,
    required List<Map<String, dynamic>> recipeData,
  }) async {
    final Map<String, List<({IngredientData ingredient, int index})>>
    recipeIngredientsLookup = {};
    for (final recipeStepIngredient in recipeStepIngredientData) {
      final ingredientList = recipeIngredientsLookup.putIfAbsent(
        recipeStepIngredient["step_id"],
        () => [],
      );
      ingredientList.add((
        ingredient: ingredientLookup[recipeStepIngredient["ingredient_id"]]!,
        index: recipeStepIngredient["index"],
      ));
    }

    final Map<String, List<({RecipeStepData step, int index})>>
    recipeStepLookup = {};
    for (final rawRecipeStep in recipeStepData) {
      final ingredients = recipeIngredientsLookup[rawRecipeStep["id"]] ?? [];
      ingredients.sort((a, b) => a.index.compareTo(b.index));

      final recipeStep = RecipeStepData.fromSupabase(
        rawRecipeStep,
        ingredients.map((e) => e.ingredient).toList(),
      );
      final stepList = recipeStepLookup.putIfAbsent(
        rawRecipeStep["recipe_id"],
        () => [],
      );
      stepList.add((step: recipeStep, index: rawRecipeStep["index"]));
    }

    for (final rawRecipe in recipeData) {
      final steps = recipeStepLookup[rawRecipe["id"]] ?? [];
      steps.sort((a, b) => a.index.compareTo(b.index));

      final recipe = RecipeData.fromSupabase(
        rawRecipe,
        steps.map((e) => e.step).toList(),
      );

      await recipeRepo.add(recipe);
    }
  }

  PostgrestTransformBuilder<List<Map<String, dynamic>>> applyOrderAndFiltering(
    SupabaseQueryBuilder builder,
  ) {
    return builder
        .select()
        .gt(SyncingService.updatedAtKey, lastSync.toIso8601String())
        .order(SyncingService.updatedAtKey, ascending: true);
  }

  DateTime? _findNewestDate(Iterable<Map<String, dynamic>> entries) {
    final dates = entries
        .map((e) => DateTime.parse(e[SyncingService.updatedAtKey]))
        .toList();
    dates.sort((a, b) => a.compareTo(b));
    return dates.lastOrNull;
  }
}
