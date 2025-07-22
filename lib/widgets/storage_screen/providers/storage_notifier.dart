import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/repos/storage/storage_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_notifier.g.dart';

@Riverpod(keepAlive: true)
class StorageNotifier extends _$StorageNotifier {
  @override
  Stream<Map<String, IngredientData>> build() {
    final repo = ref.watch(storageRepoNotifierProvider);
    return repo.stream();
  }

  Future<void> addItem(IngredientData newData) async {
    final value = state.value;

    if (value == null) return;

    final item =
        value[newData.groceryId] ??
        IngredientData(
          id: randomAlphaNumeric(16),
          amount: 0,
          unit: newData.unit,
          groceryId: newData.groceryId,
        );

    final aggregated = item.copyWith(amount: item.amount + newData.amount);

    final repo = ref.read(storageRepoNotifierProvider);
    repo.add(aggregated);
  }

  Future<void> subtractItem(IngredientData newData) async {
    final value = state.value;
    if (value == null) return;

    final item = value[newData.groceryId];
    if (item == null) return;

    final newItem = item.copyWith(amount: item.amount - newData.amount);

    if (newItem.amount <= 0) {
      await deleteItem(item);
    } else {
      await updateItem(item.copyWith(amount: item.amount - newData.amount));
    }
  }

  Future<void> updateItem(IngredientData updated) async {
    final repo = ref.read(storageRepoNotifierProvider);
    await repo.add(updated);
  }

  Future<void> deleteItem(IngredientData toDelete) async {
    final repo = ref.read(storageRepoNotifierProvider);
    await repo.delete(toDelete.id);
  }

  Future<void> clear() async {
    final repo = ref.read(storageRepoNotifierProvider);
    await repo.clear();
  }
}
