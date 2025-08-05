import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipe_list/data/shopping_data/shopping_data.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_service.dart';

extension UploadDataExtension on SyncingService {
  Future<int> upload() async {
    final groceryData = await groceryRepo.getNotUploaded();
    await supabaseClient
        .from(SupabaseTables.grocery)
        .upsert(groceryData.values.map((e) => e.toSupabase()).toList());

    final ingredientsSupabase = <Map<String, dynamic>>[];
    final recipeStepIngredientSupabase = <Map<String, dynamic>>[];
    final recipeStepsSupabase = <Map<String, dynamic>>[];
    final recipeSupabase = <Map<String, dynamic>>[];

    final recipeData = await recipeRepo.getNotUploaded();

    for (final recipe in recipeData.values) {
      recipeSupabase.add(recipe.toSupabase());
      for (int i = 0; i < recipe.steps.length; i++) {
        final step = recipe.steps[i];
        recipeStepsSupabase.add(step.toSupabase(recipe.id, i));
        for (int y = 0; y < step.ingredients.length; y++) {
          final ingredient = step.ingredients[y];
          recipeStepIngredientSupabase.add({
            "step_id": step.id,
            "ingredient_id": ingredient.id,
            "index": y,
          });

          ingredientsSupabase.add(ingredient.toSupabase());
        }
      }
    }

    await supabaseClient.from(SupabaseTables.recipe).upsert(recipeSupabase);
    await supabaseClient
        .from(SupabaseTables.recipeStep)
        .upsert(recipeStepsSupabase);

    final shoppingSupabase = <Map<String, dynamic>>[];

    final shoppingData = await shoppingRepo.getNotUploaded();
    for (final shopping in shoppingData.values) {
      shoppingSupabase.add(shopping.toSupabase());
      ingredientsSupabase.add(shopping.ingredient.toSupabase());
    }

    final storageSupabase = <Map<String, dynamic>>[];

    final storageData = await storageRepo.getNotUploaded();
    for (final storage in storageData.values) {
      storageSupabase.add({"ingredient_id": storage.id});
      ingredientsSupabase.add(storage.toSupabase());
    }

    await supabaseClient
        .from(SupabaseTables.ingredient)
        .upsert(ingredientsSupabase);

    await supabaseClient
        .from(SupabaseTables.recipeStepIngredient)
        .upsert(recipeStepIngredientSupabase);
    await supabaseClient.from(SupabaseTables.shopping).upsert(shoppingSupabase);
    await supabaseClient.from(SupabaseTables.storage).upsert(storageSupabase);

    return groceryData.length +
        ingredientsSupabase.length +
        recipeData.length +
        shoppingData.length +
        storageData.length;
  }
}
