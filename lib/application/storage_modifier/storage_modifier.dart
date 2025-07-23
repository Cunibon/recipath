import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/repos/repo.dart';

class StorageModifier {
  StorageModifier(this.repo);
  final Repo<IngredientData> repo;

  Future<void> addItem(IngredientData newData) async {
    final value = await repo.get();

    final item =
        value[newData.groceryId] ??
        IngredientData(
          id: randomAlphaNumeric(16),
          amount: 0,
          unit: newData.unit,
          groceryId: newData.groceryId,
        );

    final aggregated = item.copyWith(amount: item.amount + newData.amount);

    repo.add(aggregated);
  }

  Future<void> subtractItem(IngredientData newData) async {
    final value = await repo.get();

    final item = value[newData.groceryId];
    if (item == null) return;

    final newItem = item.copyWith(amount: item.amount - newData.amount);

    if (newItem.amount <= 0) {
      await deleteItem(item);
    } else {
      await updateItem(item.copyWith(amount: item.amount - newData.amount));
    }
  }

  Future<void> updateItem(IngredientData updated) => repo.add(updated);

  Future<void> deleteItem(IngredientData toDelete) => repo.delete(toDelete.id);

  Future<void> clear() => repo.clear();
}
