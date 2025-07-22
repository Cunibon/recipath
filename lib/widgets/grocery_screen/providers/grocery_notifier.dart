import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/repos/grocery/grocery_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_notifier.g.dart';

@riverpod
class GroceryNotifier extends _$GroceryNotifier {
  @override
  Stream<Map<String, GroceryData>> build() {
    final repo = ref.watch(groceryRepoNotifierProvider);
    return repo.stream();
  }

  Future<void> add(GroceryData newData) async {
    final repo = ref.read(groceryRepoNotifierProvider);
    await repo.add(newData);
  }

  Future<void> delete(GroceryData toDelete) async {
    final repo = ref.read(groceryRepoNotifierProvider);
    await repo.delete(toDelete.id);
  }
}
