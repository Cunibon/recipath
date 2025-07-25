import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/application/grocery_modifier/grocery_modifier.dart';
import 'package:recipe_list/repos/grocery/grocery_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_modifier_notifier.g.dart';

@riverpod
GroceryModifier groceryModifierNotifier(Ref ref) {
  final repo = ref.watch(groceryRepoNotifierProvider);
  return GroceryModifier(repo);
}
