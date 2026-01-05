import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/filtering/filter_types.dart';
import 'package:recipath/widgets/filtering/tag_filter_notifier.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/compact_ingredient_view.dart';
import 'package:recipath/widgets/screens/recipe_screen/data/compact_recipe_item_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/local_image.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:recipath/widgets/tag/tag_list.dart';

class CompactRecipeItemContent extends ConsumerWidget {
  const CompactRecipeItemContent({super.key, required this.compactRecipeData});

  final CompactRecipeItemData compactRecipeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingPlan = ref.watch(shoppingPlanningProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (compactRecipeData.recipeData.imageName != null)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: SizedBox(
              width: 100,
              child: LocalImage(
                fileName: compactRecipeData.recipeData.imageName!,
              ),
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
                              child: HighlightableText(
                                compactRecipeData.recipeData.title.trim(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            compactRecipeData.averageTime == null
                                ? SizedBox.shrink()
                                : Text(
                                    " (Ø ${compactRecipeData.averageTime!.inMinutes.toString()}min)",
                                  ),
                            if (compactRecipeData.timerData != null)
                              Icon(Icons.timer, color: Colors.amber, size: 20),
                          ],
                        ),
                        if (compactRecipeData.recipeData.servings != null)
                          Text(
                            "${AppLocalizations.of(context)!.servings}: ${compactRecipeData.timerData?.servings ?? compactRecipeData.recipeData.servings}",
                          ),
                      ],
                    ),
                  ),
                  if (shoppingPlan != null) ...[
                    Text(
                      (shoppingPlan[compactRecipeData.recipeData] ?? 0)
                          .toString(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.shopping_cart),
                  ],
                ],
              ),
              CachedAsyncValueWrapper(
                asyncState: ref.watch(storageProvider),
                builder: (storageProvider) {
                  return CompactIngredientView(
                    ingredients: compactRecipeData.recipeData.getIngredients(
                      compactRecipeData.groceryMap,
                    ),
                    groceryMap: compactRecipeData.groceryMap,
                    storageData: storageProvider,
                  );
                },
              ),
              if (compactRecipeData.tags.isNotEmpty) ...[
                Divider(),
                TagList(
                  selectedTags: compactRecipeData.tags,
                  onTagTapped: (tagData) => ref
                      .read(tagFilterProvider(FilterTypes.recipe).notifier)
                      .toggleFilter(filter: tagData),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
