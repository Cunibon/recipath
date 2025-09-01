import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/application/recipe_shopping_modifier/recipe_shopping_modifier_notifier.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/tutorial_item.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/tutorial/tutorial_items_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/dialogs/cancel_shopping_planning.dart';
import 'package:recipath/widgets/screens/recipe_screen/dialogs/finish_shopping_planning.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_screen_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_routes.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_search_view.dart';
import 'package:showcaseview/showcaseview.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key});

  static const screenIdentifier = "recipe";

  void moveToCreateRecipe(BuildContext context) => context.go(
    "${RootRoutes.recipeRoute.path}/${RecipeRoutes.createRecipe.path}",
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    final screenState = ref.watch(recipeScreenNotifierProvider);
    final shoppingPlan = ref.watch(shoppingPlanningNotifierProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final items = ref
          .read(tutorialItemsNotifierProvider(screenIdentifier))
          .ingest();
      if (items.isNotEmpty) {
        ShowCaseWidget.of(context).startShowCase(items);
      }
    });

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState: screenState.value?.synced == false
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      actions: [
        if (shoppingPlan == null)
          IconButton(
            onPressed: () =>
                ref.read(shoppingPlanningNotifierProvider.notifier).start(),
            icon: Icon(Icons.shopping_cart),
          )
        else ...[
          IconButton(
            onPressed: () async {
              final cancel = await showDialog<bool>(
                context: context,
                builder: (context) => CancelShoppingPlanning(),
              );

              if (cancel == true) {
                ref.read(shoppingPlanningNotifierProvider.notifier).clear();
              }
            },
            icon: Icon(Icons.clear),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () async {
              final finish = await showDialog<bool>(
                context: context,
                builder: (context) => FinishShoppingPlanning(),
              );

              if (finish != true) return;

              final shoppingPlan = ref.read(shoppingPlanningNotifierProvider);

              if (shoppingPlan != null && shoppingPlan.isNotEmpty) {
                final shoppingModifier = ref.read(
                  shoppingModifierNotifierProvider,
                );
                final recipeShopping = ref.read(
                  recipeShoppingModifierNotifierProvider,
                );

                List<IngredientData> ingredientData = [];

                for (final entry in shoppingPlan.entries) {
                  for (int i = 0; i < entry.value; i++) {
                    ingredientData.addAll(
                      entry.key.getIngredients(screenState.value!.grocery),
                    );
                    await recipeShopping.addRecipe(entry.key);
                  }
                }

                await shoppingModifier.addItems(
                  ingredientData,
                  screenState.value!.grocery,
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(localization.addedItemsToShopping)),
                  );
                }
              }

              ref.read(shoppingPlanningNotifierProvider.notifier).clear();
            },
            icon: Icon(Icons.done),
          ),
        ],
      ],
      floatingActionButton: TutorialItem(
        identifier: screenIdentifier,
        description: localization.guideAddNewRecipe,
        onTargetClick: () => moveToCreateRecipe(context),
        child: FloatingActionButton(
          onPressed: () => moveToCreateRecipe(context),
          child: Icon(Icons.add),
        ),
      ),
      body: CachedAsyncValueWrapper(
        asyncState: screenState,
        builder: (data) => RecipeSearchView(data: data),
      ),
    );
  }
}
