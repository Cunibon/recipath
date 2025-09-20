import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/compact_recipe_item.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_screen_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';

class RecipeSearchView extends ConsumerWidget {
  const RecipeSearchView({required this.data, super.key});

  final RecipeScreenState data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);
    final quickFilters = ref.watch(quickFilterProvider);

    final onlyShowRunning = quickFilters[QuickFilters.running] ?? false;

    return SearchableList(
      name: localization.recipe,
      trailing: data.timerData.isEmpty
          ? null
          : GestureDetector(
              onTap: () => ref
                  .read(quickFilterProvider.notifier)
                  .setFilter(
                    filter: QuickFilters.running,
                    value: !onlyShowRunning,
                  ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Icon(
                  Icons.timer,
                  color: onlyShowRunning ? Colors.amber : null,
                  size: 28,
                ),
              ),
            ),
      items: data.recipe,
      toSearchable: (item) => item.toReadable(
        groceries: data.grocery,
        unitLocalized: unitLocalized,
        doubleNumberFormat: doubleNumberFormat,
      ),
      toWidget: (item) => Dismissible(
        key: Key(item.id),
        child: CompactRecipeItem(
          data: item,
          timerData: data.timerData[item.id],
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            ref.read(shoppingPlanningProvider.notifier).addRecipe(item);
          } else {
            ref.read(shoppingPlanningProvider.notifier).removeRecipe(item);
          }

          return false;
        },
      ),
      sort: (a, b) => a.title.compareTo(b.title),
    );
  }
}
