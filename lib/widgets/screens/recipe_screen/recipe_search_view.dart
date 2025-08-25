import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/compact_recipe_item.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_screen_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';

class RecipeSearchView extends ConsumerStatefulWidget {
  const RecipeSearchView({required this.data, super.key});

  final RecipeScreenState data;

  @override
  ConsumerState<RecipeSearchView> createState() => _RecipeSearchViewState();
}

class _RecipeSearchViewState extends ConsumerState<RecipeSearchView> {
  bool onlyShowRunning = false;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatNotifierProvider);

    final recipes =
        (onlyShowRunning
                ? widget.data.timers.map((e) => widget.data.recipe[e]!).nonNulls
                : widget.data.recipe.values)
            .toList();

    return SearchableList(
      name: localization.recipe,
      trailing: widget.data.timers.isEmpty
          ? null
          : GestureDetector(
              onTap: () => setState(() => onlyShowRunning = !onlyShowRunning),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Icon(
                  Icons.timer,
                  color: onlyShowRunning ? Colors.amber : null,
                  size: 28,
                ),
              ),
            ),
      items: recipes,
      toSearchable: (item) => item.toReadable(
        groceries: widget.data.grocery,
        unitLocalized: unitLocalized,
        doubleNumberFormat: doubleNumberFormat,
      ),
      toWidget: (item) => Dismissible(
        key: Key(item.id),
        child: CompactRecipeItem(
          data: item,
          timerRunning: widget.data.timers.contains(item.id),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            ref.read(shoppingPlanningNotifierProvider.notifier).addRecipe(item);
          } else {
            ref
                .read(shoppingPlanningNotifierProvider.notifier)
                .removeRecipe(item);
          }

          return false;
        },
      ),
      sort: (a, b) => a.title.compareTo(b.title),
    );
  }
}
