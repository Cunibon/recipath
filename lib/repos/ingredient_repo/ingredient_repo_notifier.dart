import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/abstract/repo.dart';
import 'package:recipath/repos/ingredient_repo/ingredient_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ingredient_repo_notifier.g.dart';

@riverpod
Repo ingredientRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return IngredientRepoDrift(db);
}
