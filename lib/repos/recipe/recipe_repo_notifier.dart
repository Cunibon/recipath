import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/recipe/recipe_repo_drift.dart';
import 'package:recipath/repos/repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_repo_notifier.g.dart';

@riverpod
Repo<RecipeData> recipeRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return RecipeRepoDrift(db);
}
