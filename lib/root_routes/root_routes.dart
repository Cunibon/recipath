import 'package:go_router/go_router.dart';
import 'package:recipe_list/widgets/grocery_screen/grocery_routes.dart';
import 'package:recipe_list/widgets/grocery_screen/grocery_screen.dart';
import 'package:recipe_list/widgets/main_screen/main_routes.dart';
import 'package:recipe_list/widgets/main_screen/main_screen.dart';

class RootRoutes {
  static GoRoute mainRoute = GoRoute(
    path: "/recipes",
    builder: (context, state) => MainScreen(),
    routes: [MainRoutes.createRecipe, MainRoutes.recipe],
  );
  static GoRoute groceriesRoute = GoRoute(
    path: "/groceries",
    builder: (context, state) => GroceryScreen(),
    routes: [GroceryRoutes.createGrocery],
  );
  static GoRoute shoppingRoute = GoRoute(
    path: "/shopping",
    builder: (context, state) => MainScreen(),
    routes: [],
  );
  static GoRoute storageRoute = GoRoute(
    path: "/storage",
    builder: (context, state) => MainScreen(),
    routes: [],
  );
}
