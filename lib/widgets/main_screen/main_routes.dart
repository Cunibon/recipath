import 'package:go_router/go_router.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/widgets/main_screen/create_recipe_screen/create_recipe_screen.dart';
import 'package:recipe_list/widgets/main_screen/recipe_screen/recipe_screen.dart';

class MainRoutes {
  static GoRoute createRecipe = GoRoute(
    path: "createRecipe",
    builder: (context, state) =>
        CreateRecipeScreen(recipeId: state.uri.queryParameters[idParameter]),
  );

  static GoRoute recipe = GoRoute(
    path: "recipe/:recipeId",
    builder: (context, state) =>
        RecipeScreen(recipeId: state.pathParameters["recipeId"]!),
  );
}
