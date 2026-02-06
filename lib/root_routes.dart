import 'package:go_router/go_router.dart';
import 'package:recipath/widgets/screens/dashboard_screen/dashboard_screen.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_screen.dart';
import 'package:recipath/widgets/screens/history_screen/recipe_history_screen/recipe_history_screen.dart';
import 'package:recipath/widgets/screens/history_screen/recipe_shopping_screen/recipe_shopping_screen.dart';
import 'package:recipath/widgets/screens/import_screen/import_routes.dart';
import 'package:recipath/widgets/screens/import_screen/import_screen.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_routes.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_screen.dart';
import 'package:recipath/widgets/screens/settings_screen/settings_screen.dart';
import 'package:recipath/widgets/screens/shopping_screen/shopping_screen.dart';
import 'package:recipath/widgets/screens/storage_screen/storage_screen.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_routes.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_screen.dart';

abstract class RootRoutes {
  static GoRoute recipeRoute = GoRoute(
    path: "/recipes",
    builder: (context, state) => RecipeScreen(),
    routes: [RecipeRoutes.createRecipe, RecipeRoutes.recipeOverview],
  );

  static GoRoute shoppingRoute = GoRoute(
    path: "/shopping",
    builder: (context, state) => ShoppingScreen(),
    routes: [GroceryRoutes.createGrocery, GroceryRoutes.scanGrocery],
  );

  static GoRoute storageRoute = GoRoute(
    path: "/storage",
    builder: (context, state) => StorageScreen(),
    routes: [GroceryRoutes.createGrocery, GroceryRoutes.scanGrocery],
  );

  static GoRoute groceriesRoute = GoRoute(
    path: "/groceries",
    builder: (context, state) => GroceryScreen(),
    routes: [GroceryRoutes.createGrocery],
  );

  static GoRoute tagRoute = GoRoute(
    path: "/tag",
    builder: (context, state) => TagScreen(),
    routes: [TagRoutes.createTag],
  );

  static GoRoute dashboardRoute = GoRoute(
    path: "/dashboard",
    builder: (context, state) => DashboardScreen(),
  );

  static GoRoute recipeHistoryRoute = GoRoute(
    path: "/recipeHistory",
    builder: (context, state) => RecipeHistoryScreen(),
  );

  static GoRoute recipeShoppingRoute = GoRoute(
    path: "/recipeShopping",
    builder: (context, state) => RecipeShoppingScreen(),
  );

  static GoRoute settingsRoute = GoRoute(
    path: "/settings",
    builder: (context, state) => SettingsScreen(),
  );

  static GoRoute importRoute = GoRoute(
    path: "/import",
    builder: (context, state) => ImportScreen(),
    routes: [ImportRoutes.recipeImport],
  );
}
