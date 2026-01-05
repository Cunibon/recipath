import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/screens/recipe_screen/compact_recipe_item_content.dart';
import 'package:recipath/widgets/screens/recipe_screen/data/compact_recipe_item_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';

class CompactRecipeItem extends ConsumerWidget {
  const CompactRecipeItem({required this.compactRecipeData, super.key});
  final CompactRecipeItemData compactRecipeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingPlan = ref.watch(shoppingPlanningProvider);

    return GestureDetector(
      onTap: () {
        if (shoppingPlan == null) {
          context.go(
            '${RootRoutes.recipeRoute.path}/recipeOverview/${compactRecipeData.recipeData.id}',
          );
        } else {
          ref
              .read(shoppingPlanningProvider.notifier)
              .addRecipe(compactRecipeData.recipeData);
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CompactRecipeItemContent(compactRecipeData: compactRecipeData),
        ),
      ),
    );
  }
}
