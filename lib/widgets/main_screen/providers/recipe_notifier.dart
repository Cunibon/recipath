import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/repos/recipe/recipe_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_notifier.g.dart';

@riverpod
class RecipeNotifier extends _$RecipeNotifier {
  @override
  Stream<Map<String, RecipeData>> build() {
    final repo = ref.watch(recipeRepoNotifierProvider);

    return repo.stream();
  }

  Future<void> add(RecipeData newData) async {
    final repo = ref.read(recipeRepoNotifierProvider);
    repo.add(newData);
  }

  Future<void> delete(String id) async {
    final repo = ref.read(recipeRepoNotifierProvider);
    repo.delete(id);
  }
}
