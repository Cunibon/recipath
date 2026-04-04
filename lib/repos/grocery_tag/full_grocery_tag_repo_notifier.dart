import 'package:recipath/data/grocery_tag_data/grocery_tag_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/abstract/local_repo.dart';
import 'package:recipath/repos/grocery_tag/grocery_tag_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_grocery_tag_repo_notifier.g.dart';

@Riverpod(keepAlive: true)
LocalRepo<GroceryTagData> fullGroceryTagRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return GroceryTagRepoDrift(db, incluedDeleted: true);
}
