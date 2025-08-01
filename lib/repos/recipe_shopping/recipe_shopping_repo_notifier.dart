import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/repos/recipe_shopping/recipe_shopping_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_shopping_repo_notifier.g.dart';

@riverpod
RecipeShoppingRepoDrift recipeShoppingRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return RecipeShoppingRepoDrift(db);
}
