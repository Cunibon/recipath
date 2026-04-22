import 'package:recipath/application/gorcery_tag_modifier/grocery_tag_modifier.dart';
import 'package:recipath/repos/grocery_tag/grocery_tag_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_tag_modifier_notifier.g.dart';

@riverpod
GroceryTagModifier groceryTagModifierNotifier(Ref ref) {
  final repo = ref.watch(groceryTagRepoProvider);
  return GroceryTagModifier(repo);
}
