import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/helper/date_time_extension.dart';
import 'package:recipath/repos/recipe/full_recipe_repo_notifier.dart';
import 'package:recipath/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:recipath/widgets/screens/history_screens/data/history_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_history_screen_notifier.g.dart';

@riverpod
Future<Map<DateTime, List<HistoryData>>> recipeHistoryScreenNotifier(
  Ref ref,
) async {
  final recipeMap = await ref.watch(fullRecipeRepoNotifierProvider).get();
  final recipeStatisticsList = await ref
      .watch(recipeStatisticsRepoNotifierProvider)
      .get();

  final groupedEntries = <DateTime, List<HistoryData>>{};

  for (final statistics in recipeStatisticsList.values) {
    final date = statistics.startDate;
    final currentList = groupedEntries.putIfAbsent(date.toDate(), () => []);

    currentList.add(
      HistoryData(
        date: statistics.startDate,
        recipeData: recipeMap[statistics.recipeId]!,
      ),
    );
  }
  return groupedEntries;
}
