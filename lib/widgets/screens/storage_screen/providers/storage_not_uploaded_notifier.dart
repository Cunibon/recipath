import 'package:recipath/repos/storage/storage_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_not_uploaded_notifier.g.dart';

@riverpod
Stream<bool> storageNotUploadedNotifier(Ref ref) =>
    ref.watch(storageRepoProvider).hasNotUploaded();
