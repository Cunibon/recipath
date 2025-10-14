import 'package:recipath/helper/date_time_extension.dart';
import 'package:recipath/repos/recipe/drift/full_recipe_repo_notifier.dart';
import 'package:recipath/repos/recipe_shopping/recipe_shopping_repo_notifier.dart';
import 'package:recipath/widgets/screens/history_screen/data/history_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_shopping_screen_notifier.g.dart';

@riverpod
Future<Map<DateTime, List<HistoryData>>> recipeShoppingScreenNotifier(
  Ref ref,
) async {
  final recipeMap = await ref.watch(fullRecipeRepoProvider).get();
  final recipeShoppingList = await ref.watch(recipeShoppingRepoProvider).get();

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
