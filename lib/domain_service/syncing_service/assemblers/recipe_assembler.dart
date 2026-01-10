import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/abstract/supabase_write_assembler.dart';
import 'package:recipath/domain_service/syncing_service/repos/assembly_result.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';

class RecipeAssembler extends SupabaseWriteAssembler<RecipeData> {
  RecipeAssembler({required super.repo});

  @override
  String get tableName => SupabaseTables.recipe;

  @override
  List<String> get foreignDataTables => [
    SupabaseTables.ingredient,
    SupabaseTables.recipeStepIngredient,
    SupabaseTables.recipeStep,
  ];

  @override
  Future<AssemblyResult> assemble(
    SyncContext syncContext,
    AssemblyContext assemblyContext,
  ) async {
    final assemblyResult = AssemblyResult();

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
      try {
        final steps = recipeStepLookup[rawRecipe["id"]] ?? [];
        steps.sort((a, b) => a.index.compareTo(b.index));

        final recipe = RecipeData.fromSupabase(
          rawRecipe,
          steps.map((e) => e.step).toList(),
        );

        await repo.add(recipe);
        itemAssemblyContext[recipe.id] = recipe;
      } catch (e, s) {
        assemblyResult.addError(
          id: rawRecipe["id"].toString(),
          error: e,
          stacktrace: s,
        );
      }
    }

    return assemblyResult;
  }
}
