import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/screens/recipe_screen/export/cancel_export.dart';
import 'package:recipath/widgets/screens/recipe_screen/export/finish_export.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/export_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_screen_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_routes.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_search_view.dart';
import 'package:recipath/widgets/screens/recipe_screen/shopping_planning/cancel_shopping_planning.dart';
import 'package:recipath/widgets/screens/recipe_screen/shopping_planning/finish_shopping_planning.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenState = ref.watch(recipeScreenProvider);
    final shoppingPlan = ref.watch(shoppingPlanningProvider);
    final export = ref.watch(exportProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState: screenState.value?.synced == false
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      actions: [
        if (shoppingPlan == null && export == null) ...[
          IconButton(
            onPressed: () => ref.read(exportProvider.notifier).start(),
            icon: Icon(Icons.share),
          ),
          IconButton(
            onPressed: () =>
                ref.read(shoppingPlanningProvider.notifier).start(),
            icon: Icon(Icons.shopping_cart),
          ),
        ] else if (shoppingPlan != null) ...[
          CancelShoppingPlanning(),
          SizedBox(width: 10),
          FinishShoppingPlanning(),
        ] else if (export != null) ...[
          CancelExport(),
          SizedBox(width: 10),
          FinishExport(),
        ],
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goRelative(RecipeRoutes.createRecipe.path),
        child: Icon(Icons.add),
      ),
      body: CachedAsyncValueWrapper(
        asyncState: screenState,
        builder: (data) => RecipeSearchView(data: data),
      ),
    );
  }
}
