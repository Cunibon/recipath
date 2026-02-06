import 'package:recipath/data/recipe_shopping_data/recipe_shopping_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/abstract/local_repo.dart';
import 'package:recipath/repos/recipe_shopping/recipe_shopping_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_shopping_repo_notifier.g.dart';

@Riverpod(keepAlive: true)
LocalRepo<RecipeShoppingData> recipeShoppingRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return RecipeShoppingRepoDrift(db);
}
