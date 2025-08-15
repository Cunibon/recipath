import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/navigation/default_navigation_title.dart';
import 'package:recipe_list/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/screens/history_screens/recipe_shopping_screen/providers/recipe_shopping_screen_notifier.dart';
import 'package:recipe_list/widgets/screens/history_screens/recipe_shopping_screen/recipe_shopping_item.dart';

class RecipeShoppingScreen extends ConsumerWidget {
  const RecipeShoppingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(recipeShoppingScreenNotifierProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            asyncData.value?.any((e) => e.shoppingData.uploaded == false) ==
                true
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      body: asyncData.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) =>
              RecipeShoppingItem(data: data[index]),
        ),
        error: (error, stackTrace) =>
            Center(child: const Text('Oops, something unexpected happened')),
        loading: () => Center(child: const CircularProgressIndicator()),
      ),
    );
  }
}
