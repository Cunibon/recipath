import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipe_list/widgets/providers/supabase/supabase_user_notifier.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/create_recipe_screen/compact_ingredient_view.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/local_image.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/providers/average_recipe_time_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';
import 'package:recipe_list/widgets/screens/recipe_screen/providers/timer_notifier.dart';

class CompactRecipeItem extends ConsumerWidget {
  const CompactRecipeItem({required this.data, super.key});
  final RecipeData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryMap = ref.watch(groceryNotifierProvider).value!;
    final timer = ref.watch(timerNotifierProvider)[data.id];
    final shoppingPlan = ref.watch(shoppingPlanningNotifierProvider);

    return GestureDetector(
      onTap: () {
        if (shoppingPlan == null) {
          context.go(
            '${RootRoutes.recipeRoute.path}/recipeOverview/${data.id}',
          );
        } else {
          ref.read(shoppingPlanningNotifierProvider.notifier).addRecipe(data);
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data.imageName != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: SizedBox(
                    width: 100,
                    child: LocalImage(fileName: data.imageName!),
                  ),
                ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      data.title.trim(),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                  ),
                                  CachedAsyncValueWrapper(
                                    asyncState: ref.watch(
                                      averageRecipeTimeNotifierProvider(
                                        data.id,
                                      ),
                                    ),
                                    builder: (data) => data == null
                                        ? SizedBox.shrink()
                                        : Text(
                                            " (Ø ${data.inMinutes.toString()}min)",
                                          ),
                                    loadingBuilder: () => SizedBox.shrink(),
                                  ),
                                  if (timer != null)
                                    Icon(
                                      Icons.timer,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                ],
                              ),
                              if (data.servings != null)
                                Text("Servings: ${data.servings}"),
                            ],
                          ),
                        ),
                        if (shoppingPlan != null) ...[
                          Text(
                            (shoppingPlan[data] ?? 0).toString(),
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.shopping_cart),
                        ] else if (!data.uploaded &&
                            ref.watch(supabaseUserProvider) != null)
                          Icon(Icons.cloud_upload),
                      ],
                    ),
                    CompactIngredientView(
                      checkStorage: true,
                      ingredients: data.getIngredients(groceryMap),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
