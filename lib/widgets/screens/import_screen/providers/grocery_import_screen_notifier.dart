import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_data_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_import_screen_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_import_screen_notifier.g.dart';

@riverpod
class GroceryImportScreenNotifier extends _$GroceryImportScreenNotifier {
  @override
  Future<Map<String, GroceryData?>> build(String path) async {
    final recipeImportState = await ref.watch(
      recipeImportScreenProvider(path).future,
    );
    final importData = await ref.watch(importDataProvider(path).future);

    final localGroceries = await ref.watch(groceryProvider.future);

    final localGrocerybarcodeLookup = <String, GroceryData>{};
    final localGroceryNameLookup = <String, GroceryData>{};

    for (final grocery in localGroceries.values) {
      if (grocery.barcode != null) {
        localGrocerybarcodeLookup[grocery.barcode!] = grocery;
      }

      localGroceryNameLookup[grocery.name.trim().toLowerCase()] = grocery;
    }

    final groceryIds = recipeImportState.selectedRecipes
        .expand((element) => element.getIngredients(importData.groceries))
        .map((e) => e.groceryId)
        .toSet();
    final groceries = <String, GroceryData?>{};

    for (final groceryId in groceryIds) {
      if (importData.groceries.containsKey(groceryId)) {
        final importGrocery = importData.groceries[groceryId]!;
        groceries[groceryId] =
            localGrocerybarcodeLookup[importGrocery.barcode] ??
            localGroceryNameLookup[importGrocery.name.trim().toLowerCase()];
      }
    }

    return groceries;
  }

  void selectGrocery(String origin, GroceryData? groceryData) {
    final currentState = state.value!;
    final currentLookup = Map<String, GroceryData?>.from(currentState);

    state = AsyncValue.data(currentLookup..[origin] = groceryData);
  }
}
