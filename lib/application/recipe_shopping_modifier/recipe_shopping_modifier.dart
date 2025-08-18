import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/recipe_shopping_data/recipe_shopping_data.dart';
import 'package:recipath/repos/repo.dart';

class RecipeShoppingModifier {
  RecipeShoppingModifier(this.repo);
  final Repo<RecipeShoppingData> repo;

  Future<void> addRecipe(RecipeData newData) async {
    final recipeShoppingData = RecipeShoppingData.fromRecipe(newData);
    await repo.add(recipeShoppingData);
  }
}
