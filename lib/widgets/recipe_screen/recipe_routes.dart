import 'package:go_router/go_router.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/widgets/grocery_screen/grocery_routes.dart';
import 'package:recipe_list/widgets/recipe_screen/create_recipe_screen/create_recipe_screen.dart';
import 'package:recipe_list/widgets/recipe_screen/recipe_overview_screen/recipe_overview_screen.dart';

class MainRoutes {
  static GoRoute createRecipe = GoRoute(
    path: "createRecipe",
    builder: (context, state) =>
        CreateRecipeScreen(recipeId: state.uri.queryParameters[idParameter]),
    routes: [GroceryRoutes.createGrocery],
  );

  static GoRoute recipeOverview = GoRoute(
    path: "recipeOverview/:recipeId",
    builder: (context, state) =>
        RecipeScreen(recipeId: state.pathParameters["recipeId"]!),
    routes: [createRecipe],
  );
}
