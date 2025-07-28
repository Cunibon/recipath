import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/recipe_history_scren/history_recipe_item.dart';
import 'package:recipe_list/widgets/recipe_history_scren/providers/recipe_history_screen_notifier.dart';

class RecipeHistoryScreen extends ConsumerWidget {
  const RecipeHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(recipeHistoryScreenNotifierProvider);

    return NavigationDrawerScaffold(
      body: asyncValue.when(
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
