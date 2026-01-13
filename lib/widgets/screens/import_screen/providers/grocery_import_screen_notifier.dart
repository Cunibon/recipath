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

    final localGroceryNameLookup = (await ref.watch(
      groceryProvider.future,
    )).map((key, value) => MapEntry(value.name.trim().toLowerCase(), value));

    final groceryIds = recipeImportState.selectedRecipes
        .expand((element) => element.getIngredients(importData.groceries))
        .map((e) => e.groceryId)
        .toSet();
    final groceries = <String, GroceryData?>{};

    for (final groceryId in groceryIds) {
      if (importData.groceries.containsKey(groceryId)) {
        final importGrocery = importData.groceries[groceryId]!;
        groceries[groceryId] =
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
