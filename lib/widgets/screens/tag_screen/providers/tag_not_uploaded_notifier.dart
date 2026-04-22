import 'package:recipath/repos/tag/tag_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_not_uploaded_notifier.g.dart';

@riverpod
Stream<bool> tagNotUploadedNotifier(Ref ref) =>
    ref.watch(tagRepoProvider).hasNotUploaded();
