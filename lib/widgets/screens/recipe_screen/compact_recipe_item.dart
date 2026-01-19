import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/filtering/filter_types.dart';
import 'package:recipath/widgets/filtering/tag_filter_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/compact_recipe_item_content.dart';
import 'package:recipath/widgets/screens/recipe_screen/data/compact_recipe_item_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/export_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';

class CompactRecipeItem extends ConsumerWidget {
  const CompactRecipeItem({required this.compactRecipeData, super.key});
  final CompactRecipeItemData compactRecipeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingPlan = ref.watch(shoppingPlanningProvider);
    final export = ref.watch(exportProvider);

    Widget? trailing;

    if (shoppingPlan != null) {
      trailing = Row(
        children: [
          Text(
            (shoppingPlan[compactRecipeData.recipeData] ?? 0).toString(),
            style: TextTheme.of(
              context,
            ).bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          Icon(Icons.shopping_cart),
        ],
      );
    } else if (export != null) {
      trailing = Icon(
        export.contains(compactRecipeData.recipeData.id)
            ? Icons.check_box
            : Icons.check_box_outline_blank,
      );
    }

    return GestureDetector(
      onTap: () {
        if (shoppingPlan != null) {
          ref
              .read(shoppingPlanningProvider.notifier)
              .addRecipe(compactRecipeData.recipeData);
        } else if (export != null) {
          ref
              .read(exportProvider.notifier)
              .toggleRecipe(compactRecipeData.recipeData);
        } else {
          context.go(
            '${RootRoutes.recipeRoute.path}/recipeOverview/${compactRecipeData.recipeData.id}',
          );
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CompactRecipeItemContent(
            compactRecipeData: compactRecipeData,
            trailingTitle: trailing,
            onTagTapped: (tagData) => ref
                .read(tagFilterProvider(FilterTypes.recipe).notifier)
                .toggleFilter(filter: tagData),
          ),
        ),
      ),
    );
  }
}
