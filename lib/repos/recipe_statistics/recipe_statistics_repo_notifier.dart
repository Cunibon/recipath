import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/recipe_statistics/drift/recipe_statistics_repo_drift.dart';
import 'package:recipath/repos/recipe_statistics/recipe_statistics_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_statistics_repo_notifier.g.dart';

@riverpod
RecipeStatisticsRepo recipeStatisticsRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return RecipeStatisticsRepoDrift(db);
}
