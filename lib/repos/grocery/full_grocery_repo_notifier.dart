import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/repos/grocery/grocery_repo_drift.dart';
import 'package:recipe_list/repos/repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_grocery_repo_notifier.g.dart';

@riverpod
Repo<GroceryData> fullGroceryRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return GroceryRepoDrift(db, incluedArchived: true);
}
