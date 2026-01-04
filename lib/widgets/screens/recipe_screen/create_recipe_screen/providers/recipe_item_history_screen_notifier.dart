import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/helper/date_time_extension.dart';
import 'package:recipath/repos/recipe/drift/full_recipe_repo_notifier.dart';
import 'package:recipath/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:recipath/widgets/screens/history_screen/data/history_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_item_history_screen_notifier.g.dart';

@riverpod
Future<Map<DateTime, List<HistoryData>>> recipeItemHistoryScreenNotifier(
  Ref ref,
  String id,
) async {
  final recipeMap = await ref.watch(fullRecipeRepoProvider).get();
  final recipeStatisticsList = await ref
      .watch(recipeStatisticsRepoProvider)
      .getForId(id);

  final groupedEntries = <DateTime, List<HistoryData>>{};

  for (final statistics in recipeStatisticsList.values) {
    final date = statistics.startDate;
    final currentList = groupedEntries.putIfAbsent(date.toDate(), () => []);

    currentList.add(
      HistoryData(
        date: statistics.startDate,
        recipeData: recipeMap[statistics.recipeId]!
            .adjustIngredientForPlannedServings(statistics.servings),
      ),
    );
  }
  return groupedEntries;
}
