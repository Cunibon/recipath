import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/filtering/filter_button.dart';
import 'package:recipath/widgets/filtering/filter_types.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/compact_recipe_item.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_screen_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_routes.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/storage_mode_provider.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';

class RecipeSearchView extends ConsumerWidget {
  const RecipeSearchView({required this.data, super.key});

  final RecipeScreenState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    return SearchableList(
      name: localization.recipe,
      trailing: FilterButton(
        filterType: FilterTypes.recipe,
        quickFilters: [
          QuickFilters.running,
          if (ref.watch(storageModeProvider)) QuickFilters.cookable,
        ],
        allTags: ref.watch(tagProvider).value?.values.toSet() ?? {},
      ),
      items: data.recipe,
      toSearchable: (item) => item.recipeData.toReadable(
        groceries: data.grocery,
        unitLocalized: unitLocalized,
        doubleNumberFormat: doubleNumberFormat,
      ),
      toWidget: (item) => Dismissible(
        key: Key(item.recipeData.id),
        child: CompactRecipeItem(compactRecipeData: item),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            ref
                .read(shoppingPlanningProvider.notifier)
                .addRecipe(item.recipeData);
          } else {
            ref
                .read(shoppingPlanningProvider.notifier)
                .removeRecipe(item.recipeData);
          }

          return false;
        },
      ),
      sort: (a, b) => a.recipeData.title.compareTo(b.recipeData.title),
      emptyState: EmptyState(
        hint: localization.createRecipeHint,
        onTap: () => context.goRelative(RecipeRoutes.createRecipe.path),
      ),
    );
  }
}
