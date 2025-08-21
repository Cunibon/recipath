import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/sync_interfaces.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class RecipeSyncRepo extends DataSyncRepo<RecipeData>
    implements PrepareUploadInterface {
  RecipeSyncRepo({required super.supabaseClient, required super.repo});

  @override
  String get tableName => SupabaseTables.recipe;

  @override
  Future<int> prepareUpload(SyncContext context) async {
    final ingredientsSupabase = context.putIfAbsent(
      SupabaseTables.ingredient,
      () => [],
    );
    final recipeStepIngredientSupabase = context.putIfAbsent(
      SupabaseTables.recipeStepIngredient,
      () => [],
    );
    final recipeStepsSupabase = context.putIfAbsent(
      SupabaseTables.recipeStep,
      () => [],
    );
    final recipeSupabase = context.putIfAbsent(tableName, () => []);

    final recipeData = await repo.getNotUploaded();

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

    return recipeData.length;
  }
}
