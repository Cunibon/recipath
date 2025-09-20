import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/repos/storage/storage_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_notifier.g.dart';

@riverpod
Stream<Map<String, StorageData>> storageNotifier(Ref ref) =>
    ref.watch(storageRepoProvider).stream();
