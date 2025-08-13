import 'package:go_router/go_router.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/create_recipe_screen/create_recipe_screen.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/recipe_overview_screen/recipe_overview_screen.dart';

class MainRoutes {
  static GoRoute recipeOverview = GoRoute(
    path: "recipeOverview/:recipeId",
    builder: (context, state) =>
        RecipeScreen(recipeId: state.pathParameters["recipeId"]!),
    routes: [createRecipe],
  );

  static GoRoute createRecipe = GoRoute(
    path: "createRecipe",
    builder: (context, state) =>
        CreateRecipeScreen(recipeId: state.uri.queryParameters[idParameter]),
    routes: [GroceryRoutes.createGrocery],
  );
}
