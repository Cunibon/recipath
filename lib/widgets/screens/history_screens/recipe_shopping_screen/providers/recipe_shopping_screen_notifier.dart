import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/helper/date_time_extension.dart';
import 'package:recipath/repos/recipe/full_recipe_repo_notifier.dart';
import 'package:recipath/repos/recipe_shopping/recipe_shopping_repo_notifier.dart';
import 'package:recipath/widgets/screens/history_screens/data/history_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_shopping_screen_notifier.g.dart';

@riverpod
Future<Map<DateTime, List<HistoryData>>> recipeShoppingScreenNotifier(
  Ref ref,
) async {
  final recipeMap = await ref.watch(fullRecipeRepoNotifierProvider).get();
  final recipeShoppingList = await ref
      .watch(recipeShoppingRepoNotifierProvider)
      .get();

  final groupedEntries = <DateTime, List<HistoryData>>{};

  for (final shopping in recipeShoppingList.values) {
    final date = shopping.date;
    final currentList = groupedEntries.putIfAbsent(date.toDate(), () => []);

    currentList.add(
      HistoryData(
        date: shopping.date,
        recipeData: recipeMap[shopping.recipeId]!,
      ),
    );
  }
  return groupedEntries;
}
