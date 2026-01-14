import 'package:go_router/go_router.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/screens/import_screen/grocery_import_screen.dart';
import 'package:recipath/widgets/screens/import_screen/recipe_import_screen.dart';
import 'package:recipath/widgets/screens/import_screen/tag_import_screen.dart';

abstract class ImportRoutes {
  static GoRoute recipeImport = GoRoute(
    path: "recipeImport",
    builder: (context, state) =>
        RecipeImportScreen(filePath: state.extra as String),
    redirect: (context, state) =>
        state.extra is String ? null : RootRoutes.recipeRoute.path,
    routes: [ImportRoutes.groceryImport],
  );

  static GoRoute groceryImport = GoRoute(
    path: "groceryImport",
    builder: (context, state) =>
        GroceryImportScreen(filePath: state.extra as String),
    routes: [ImportRoutes.tagImport],
  );

  static GoRoute tagImport = GoRoute(
    path: "tagImport",
    builder: (context, state) =>
        TagImportScreen(filePath: state.extra as String),
  );
}
