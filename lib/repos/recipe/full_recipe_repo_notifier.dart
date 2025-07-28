import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/repos/recipe/recipe_repo_drift.dart';
import 'package:recipe_list/repos/repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_recipe_repo_notifier.g.dart';

@riverpod
Repo<RecipeData> fullRecipeRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return RecipeRepoDrift(db, incluedArchived: true);
}
