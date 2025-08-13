import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/storage_data/storage_data.dart';
import 'package:recipe_list/drift/database_notifier.dart';
import 'package:recipe_list/repos/repo.dart';
import 'package:recipe_list/repos/storage/storage_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_repo_notifier.g.dart';

@riverpod
Repo<StorageData> storageRepoNotifier(Ref ref) {
  final db = ref.watch(databaseNotifierProvider);
  return StorageRepoDrift(db);
}
