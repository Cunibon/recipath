import 'package:go_router/go_router.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/create_grocery_screen/create_grocery_screen.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/create_grocery_screen/scanner_screen/scanner_screen.dart';

class GroceryRoutes {
  static GoRoute createGrocery = GoRoute(
    path: "createGrocery",
    builder: (context, state) =>
        CreateGroceryScreen(groceryId: state.uri.queryParameters[idParameter]),
    routes: [scanGrocery],
  );

  static GoRoute scanGrocery = GoRoute(
    path: "scanner",
    builder: (context, state) => ScannerScreen(),
  );
}
