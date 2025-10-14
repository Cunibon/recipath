import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/recipe/drift/recipe_repo_drift.dart';
import 'package:recipath/repos/recipe/recipe_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_recipe_repo_notifier.g.dart';

@Riverpod(keepAlive: true)
RecipeRepo fullRecipeRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return RecipeRepoDrift(db, incluedArchived: true);
}
