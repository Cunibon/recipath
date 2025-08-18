import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/shopping/shopping_repo_drift.dart';
import 'package:recipath/repos/sync_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_shopping_repo_notifier.g.dart';

@riverpod
SyncRepo<ShoppingData> fullShoppingRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return ShoppingRepoDrift(db, incluedDeleted: true);
}
