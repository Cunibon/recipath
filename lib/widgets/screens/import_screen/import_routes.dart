import 'package:go_router/go_router.dart';
import 'package:recipath/widgets/screens/import_screen/grocery_import_screen.dart';

abstract class ImportRoutes {
  static GoRoute groceryImport = GoRoute(
    path: "groceryImport",
    builder: (context, state) => GroceryImportScreen(
      filePath: Uri.decodeComponent(state.pathParameters["filePath"] as String),
    ),
  );
}
