import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/application/recipe_shopping_modifier/recipe_shopping_modifier_notifier.dart';
import 'package:recipath/application/shopping_modifier/shopping_modifier_notifier.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/dialogs/clear_confirmation_dialog.dart';
import 'package:recipath/widgets/generic/dialogs/finish_shopping_planning.dart';
import 'package:recipath/widgets/generic/notifier_future_builder.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/compact_recipe_item.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_routes.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatNotifierProvider);

    final asyncRecipe = ref.watch(recipeNotifierProvider);
    final asyncGrocery = ref.watch(groceryNotifierProvider);
    final shoppingPlan = ref.watch(shoppingPlanningNotifierProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            asyncRecipe.value?.values.any((e) => e.uploaded == false) == true
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
              final clear = await showDialog<bool>(
                context: context,
                builder: (context) => ClearConfirmationDialog(),
              );

              if (clear == true) {
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

              if (shoppingPlan == null || shoppingPlan.isEmpty) return;

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
                    entry.key.getIngredients(asyncGrocery.value!),
                  );
                  await recipeShopping.addRecipe(entry.key);
                }
              }

              await shoppingModifier.addItems(
                ingredientData,
                asyncGrocery.value!,
              );

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(localization.addedItemsToShopping)),
                );
              }

              ref.read(shoppingPlanningNotifierProvider.notifier).clear();
            },
            icon: Icon(Icons.done),
          ),
        ],
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          "${RootRoutes.recipeRoute.path}/${RecipeRoutes.createRecipe.path}",
        ),
        child: Icon(Icons.add),
      ),
      body: NotifierFutureBuilder(
        futures: [asyncRecipe, asyncGrocery],
        childBuilder: () => SearchableList(
          type: localization.recipe,
          items: asyncRecipe.value!.values.toList(),
          toSearchable: (item) => item.toReadable(
            groceries: asyncGrocery.value!,
            unitLocalized: unitLocalized,
            doubleNumberFormat: doubleNumberFormat,
          ),
          toWidget: (item) => Dismissible(
            key: Key(item.id),
            child: CompactRecipeItem(data: item),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                ref
                    .read(shoppingPlanningNotifierProvider.notifier)
                    .addRecipe(item);
              } else {
                ref
                    .read(shoppingPlanningNotifierProvider.notifier)
                    .removeRecipe(item);
              }

              return false;
            },
          ),
          sort: (a, b) => a.title.compareTo(b.title),
        ),
      ),
    );
  }
}
