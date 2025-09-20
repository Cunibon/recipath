import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/grocery/grocery_repo_drift.dart';
import 'package:recipath/repos/sync_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_grocery_repo_notifier.g.dart';

@riverpod
SyncRepo<GroceryData> fullGroceryRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return GroceryRepoDrift(db, incluedArchived: true);
}
