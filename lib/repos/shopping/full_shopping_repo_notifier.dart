import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/shopping_data/shopping_data.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/repos/repo.dart';
import 'package:recipe_list/repos/shopping/shopping_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_shopping_repo_notifier.g.dart';

@riverpod
Repo<ShoppingData> fullShoppingRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return ShoppingRepoDrift(db, incluedDeleted: true);
}
