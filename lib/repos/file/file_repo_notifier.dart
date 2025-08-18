import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/drift/database.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/file/file_repo_drift.dart';
import 'package:recipath/repos/sync_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_repo_notifier.g.dart';

@riverpod
SyncRepo<FileTableData> fileRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return FileRepoDrift(db);
}
