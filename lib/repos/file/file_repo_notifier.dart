import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/repos/file/file_repo_drift.dart';
import 'package:recipe_list/repos/sync_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_repo_notifier.g.dart';

@riverpod
SyncRepo<FileTableData> fileRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return FileRepoDrift(db);
}
