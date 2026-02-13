import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/drift/database_notifier.dart';
import 'package:recipath/repos/abstract/local_repo.dart';
import 'package:recipath/repos/tag/tag_repo_drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'full_tag_repo_notifier.g.dart';

@Riverpod(keepAlive: true)
LocalRepo<TagData> fullTagRepoNotifier(Ref ref) {
  final db = ref.watch(databaseProvider);
  return TagRepoDrift(db, incluedDeleted: true);
}
