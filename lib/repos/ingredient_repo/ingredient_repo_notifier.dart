import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/ingredient_repo/ingredient_repo_drift.dart';
import 'package:recipath/repos/repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ingredient_repo_notifier.g.dart';

@riverpod
Repo<IngredientData> ingredientRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return IngredientRepoDrift(db);
}
