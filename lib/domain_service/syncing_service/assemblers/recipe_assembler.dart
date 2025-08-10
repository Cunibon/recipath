import 'package:recipe_list/data/ingredient_data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipe_list/domain_service/syncing_service/assemblers/abstract/supabase_write_assembler.dart';
import 'package:recipe_list/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipe_list/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class RecipeAssembler extends SupabaseWriteAssembler<RecipeData> {
  RecipeAssembler({required super.repo});

  @override
  String get tableName => SupabaseTables.recipe;

  @override
  Future<void> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  ) async {
    final ingredientLookup = assemblyContext[SupabaseTables.ingredient]!;

    final recipeStepIngredientData =
        syncContext[SupabaseTables.recipeStepIngredient]!;

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

    final recipeStepData = syncContext[SupabaseTables.recipeStep]!;

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

    final itemAssemblyContext = assemblyContext.putIfAbsent(
      tableName,
      () => {},
    );
    final recipeData = syncContext[tableName]!;

    for (final rawRecipe in recipeData) {
      final steps = recipeStepLookup[rawRecipe["id"]] ?? [];
      steps.sort((a, b) => a.index.compareTo(b.index));

      final recipe = RecipeData.fromSupabase(
        rawRecipe,
        steps.map((e) => e.step).toList(),
      );

      itemAssemblyContext[recipe.id] = recipe;

      await repo.add(recipe);
    }
  }
}
