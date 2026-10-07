import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/repos/ingredient_repo/ingredient_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'used_grocery_ids_notifier.g.dart';

@riverpod
Stream<ISet<String>> usedGroceryIdsNotifier(Ref ref) =>
    ref.watch(ingredientRepoProvider).streamUsedGroceryIds();
