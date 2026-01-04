import 'package:go_router/go_router.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/create_recipe_screen.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/recipe_item_history_screen.dart';
import 'package:recipath/widgets/screens/recipe_screen/introduction_screen/introduction_screen.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/recipe_overview_screen.dart';

class RecipeRoutes {
  static GoRoute recipeOverview = GoRoute(
    path: "recipeOverview/:recipeId",
    builder: (context, state) =>
        RecipeOverviewScreen(recipeId: state.pathParameters["recipeId"]!),
    routes: [createRecipe, recipeHistory],
  );

  static GoRoute recipeHistory = GoRoute(
    path: "recipeHistory",
    builder: (context, state) =>
        RecipeItemHistoryScreen(recipeId: state.pathParameters["recipeId"]!),
  );

  static GoRoute createRecipe = GoRoute(
    path: "createRecipe",
    builder: (context, state) =>
        CreateRecipeScreen(recipeId: state.uri.queryParameters[idParameter]),
    routes: [GroceryRoutes.createGrocery, GroceryRoutes.scanGrocery],
  );

  static GoRoute introductionScreen = GoRoute(
    path: "introductionScreen",
    builder: (context, state) => IntroductionScreen(),
  );
}
