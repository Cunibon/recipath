import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/abstract/repo.dart';
import 'package:recipath/repos/recipe/drift/recipe_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_step_repo_notifier.g.dart';

@riverpod
Repo recipeStepRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return RecipeRepoDrift(db);
}
