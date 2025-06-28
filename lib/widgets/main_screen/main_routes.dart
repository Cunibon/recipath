import 'package:go_router/go_router.dart';
import 'package:recipe_list/widgets/create_recipe_screen/create_recipe_screen.dart';

class MainRoutes {
  static GoRoute createRecipe = GoRoute(
    path: "createRecipe",
    builder: (context, state) => CreateRecipeScreen(),
  );
}
