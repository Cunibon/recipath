import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier.dart';
import 'package:recipath/repos/shopping/shopping_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_modifier_notifier.g.dart';

@riverpod
ShoppingModifier shoppingModifierNotifier(Ref ref) {
  final repo = ref.watch(shoppingRepoNotifierProvider);
  return ShoppingModifier(repo);
}
