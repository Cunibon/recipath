import 'package:go_router/go_router.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/widgets/grocery_screen/create_grocery_screen/create_grocery_screen.dart';

class GroceryRoutes {
  static GoRoute createGrocery = GoRoute(
    path: "createGrocery",
    builder: (context, state) =>
        CreateGroceryScreen(groceryId: state.uri.queryParameters[idParameter]),
  );
}
