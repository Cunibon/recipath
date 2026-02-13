import 'package:recipath/data/file_data/file_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/abstract/local_repo.dart';
import 'package:recipath/repos/file/file_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_repo_notifier.g.dart';

@Riverpod(keepAlive: true)
LocalRepo<FileData> fileRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return FileRepoDrift(db);
}
