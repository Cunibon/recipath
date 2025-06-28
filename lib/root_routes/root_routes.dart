import 'package:go_router/go_router.dart';
import 'package:recipe_list/widgets/main_screen/main_routes.dart';
import 'package:recipe_list/widgets/main_screen/main_screen.dart';

class RootRoutes {
  static GoRoute mainRoute = GoRoute(
    path: "/main",
    builder: (context, state) => MainScreen(),
    routes: [MainRoutes.createRecipe],
  );
}
