import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/recipe/drift/recipe_repo_drift.dart';
import 'package:recipath/repos/sync_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_recipe_repo_notifier.g.dart';

@Riverpod(keepAlive: true)
SyncRepo<RecipeData> fullRecipeRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return RecipeRepoDrift(db, incluedArchived: true);
}
