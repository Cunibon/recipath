import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/recipe_shopping/recipe_shopping_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_shopping_repo_notifier.g.dart';

@riverpod
RecipeShoppingRepoDrift recipeShoppingRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return RecipeShoppingRepoDrift(db);
}
