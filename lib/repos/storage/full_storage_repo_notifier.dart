import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/storage/storage_repo_drift.dart';
import 'package:recipath/repos/sync_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_storage_repo_notifier.g.dart';

@riverpod
SyncRepo<StorageData> fullStorageRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return StorageRepoDrift(db, incluedDeleted: true);
}
