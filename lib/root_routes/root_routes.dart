import 'package:go_router/go_router.dart';
import 'package:recipe_list/widgets/main_screen/main_routes.dart';
import 'package:recipe_list/widgets/main_screen/main_screen.dart';

class RootRoutes {
  static GoRoute mainRoute = GoRoute(
    path: "/main",
    builder: (context, state) => MainScreen(),
    routes: [MainRoutes.createRecipe],
  );
  static GoRoute groceriesRoute = GoRoute(
    path: "/groceries",
    builder: (context, state) => MainScreen(),
    routes: [],
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
