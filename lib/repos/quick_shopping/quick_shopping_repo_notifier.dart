import 'package:recipath/data/quick_shopping_data/quick_shopping_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/abstract/local_repo.dart';
import 'package:recipath/repos/quick_shopping/quick_shopping_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quick_shopping_repo_notifier.g.dart';

@riverpod
LocalRepo<QuickShoppingData> quickShoppingRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return QuickShoppingRepoDrift(db);
}
