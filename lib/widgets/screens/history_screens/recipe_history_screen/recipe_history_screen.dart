import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/navigation/default_navigation_title.dart';
import 'package:recipe_list/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/screens/history_screens/recipe_history_screen/history_recipe_item.dart';
import 'package:recipe_list/widgets/screens/history_screens/recipe_history_screen/providers/recipe_history_screen_notifier.dart';

class RecipeHistoryScreen extends ConsumerWidget {
  const RecipeHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(recipeHistoryScreenNotifierProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            asyncData.value?.any((e) => e.statistics.uploaded == false) == true
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      body: asyncData.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => HistoryRecipeItem(data: data[index]),
        ),
        error: (error, stackTrace) =>
            Center(child: const Text('Oops, something unexpected happened')),
        loading: () => Center(child: const CircularProgressIndicator()),
      ),
    );
  }
}
