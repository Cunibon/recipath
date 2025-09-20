import 'package:recipath/application/file_modifier.dart/file_modifier.dart';
import 'package:recipath/repos/file/file_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_modifier_notifier.g.dart';

@riverpod
FileModifier fileModifierNotifier(Ref ref) {
  final repo = ref.watch(fileRepoProvider);
  return FileModifier(repo);
}
