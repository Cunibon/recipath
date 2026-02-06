import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/abstract/local_repo.dart';
import 'package:recipath/repos/shopping/shopping_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_shopping_repo_notifier.g.dart';

@Riverpod(keepAlive: true)
LocalRepo<ShoppingData> fullShoppingRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return ShoppingRepoDrift(db, incluedDeleted: true);
}
