import 'package:flutter/material.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/expandable.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/compact_ingredient_view.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/recipe_ingredient_item.dart';

class RecipeIngredientView extends StatefulWidget {
  const RecipeIngredientView({
    required this.ingredients,
    required this.onChanged,
    this.controller,
    super.key,
  });

  final List<IngredientData> ingredients;
  final void Function(List<IngredientData> newIngredients) onChanged;

  final ScrollController? controller;

  @override
  State<RecipeIngredientView> createState() => _RecipeIngredientViewState();
}

class _RecipeIngredientViewState extends State<RecipeIngredientView> {
  late bool expanded = true;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final localizedUnits = localizeUnits(context);

    final listCopy = List<IngredientData>.from(widget.ingredients);

    final List<Widget> items = [];
    for (int i = 0; i < widget.ingredients.length; i++) {
      final ingredient = widget.ingredients[i];
      items.add(
        RecipeIngredientItem(
          key: Key(ingredient.id),
          index: i,
          data: ingredient,
          localizedUnits: localizedUnits,
          onChanged: (newIngredient) {
            listCopy.removeAt(i);
            listCopy.insert(i, newIngredient);
            widget.onChanged(listCopy);
          },
          remove: () => widget.onChanged(listCopy..remove(ingredient)),
        ),
      );
    }

    return Expandable(
      titleBuilder: (expanded) => Row(
        children: [
          Text(
            expanded ? localization.collapse : localization.expand,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Icon(
            expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      contentBuilder: (expanded) => expanded
          ? ReorderableListView(
              scrollController: widget.controller,
              shrinkWrap: true,
              children: items,
              onReorder: (int oldIndex, int newIndex) {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = listCopy.removeAt(oldIndex);
                listCopy.insert(newIndex, item);
                widget.onChanged(listCopy);
              },
            )
          : CompactIngredientView(ingredients: widget.ingredients),
    );
  }
}
