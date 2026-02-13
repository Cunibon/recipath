import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/abstract/local_repo.dart';
import 'package:recipath/repos/storage/storage_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_repo_notifier.g.dart';

@riverpod
LocalRepo<StorageData> storageRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return StorageRepoDrift(db);
}
