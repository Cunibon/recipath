import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/recipe_tag/recipe_tag_repo_drift.dart';
import 'package:recipath/repos/sync_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_recipe_tag_repo_notifier.g.dart';

@Riverpod(keepAlive: true)
SyncRepo<RecipeTagData> fullRecipeTagRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return RecipeTagRepoDrift(db, incluedDeleted: true);
}
