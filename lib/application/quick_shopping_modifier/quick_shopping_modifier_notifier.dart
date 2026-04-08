import 'package:recipath/application/quick_shopping_modifier/quick_shopping_modifier.dart';
import 'package:recipath/repos/quick_shopping/quick_shopping_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quick_shopping_modifier_notifier.g.dart';

@riverpod
QuickShoppingModifier quickShoppingModifierNotifier(Ref ref) {
  final repo = ref.watch(quickShoppingRepoProvider);
  return QuickShoppingModifier(repo);
}
