import 'package:recipath/application/grocery_modifier/grocery_modifier.dart';
import 'package:recipath/repos/grocery/grocery_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_modifier_notifier.g.dart';

@riverpod
GroceryModifier groceryModifierNotifier(Ref ref) {
  final repo = ref.watch(groceryRepoProvider);
  return GroceryModifier(repo);
}
