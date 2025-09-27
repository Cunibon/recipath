import 'package:recipath/application/tag_modifier/tag_modifier.dart';
import 'package:recipath/repos/tag/tag_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_modifier_notifier.g.dart';

@riverpod
TagModifier tagModifierNotifier(Ref ref) {
  final repo = ref.watch(tagRepoProvider);
  return TagModifier(repo);
}
