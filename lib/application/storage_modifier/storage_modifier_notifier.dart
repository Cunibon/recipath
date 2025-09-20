import 'package:recipath/application/storage_modifier/storage_modifier.dart';
import 'package:recipath/repos/storage/storage_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_modifier_notifier.g.dart';

@riverpod
StorageModifier storageModifierNotifier(Ref ref) {
  final repo = ref.watch(storageRepoProvider);
  return StorageModifier(repo);
}
