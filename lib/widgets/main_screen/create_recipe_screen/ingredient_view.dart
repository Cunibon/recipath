import 'package:flutter/material.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/main_screen/create_recipe_screen/compact_ingredient_view.dart';
import 'package:recipe_list/widgets/main_screen/create_recipe_screen/ingredient_item.dart';

class IngredientView extends StatefulWidget {
  const IngredientView({
    required this.ingredients,
    required this.onChanged,
    this.controller,
    super.key,
  });

  final List<IngredientData> ingredients;
  final void Function(List<IngredientData> newIngredients) onChanged;

  final ScrollController? controller;

  @override
  State<IngredientView> createState() => _IngredientViewState();
}

class _IngredientViewState extends State<IngredientView> {
  late bool expanded = true;

  @override
  Widget build(BuildContext context) {
    final listCopy = List<IngredientData>.from(widget.ingredients);

    final List<Widget> items = [];
    for (int i = 0; i < widget.ingredients.length; i++) {
      final ingredient = widget.ingredients[i];
      items.add(
        IngredientItem(
          key: Key(ingredient.id),
          index: i,
          data: ingredient,
          onChanged: (newIngredient) {
            listCopy.removeAt(i);
            listCopy.insert(i, newIngredient);
            widget.onChanged(listCopy);
          },
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: GestureDetector(
            onTap: () => setState(() => expanded = !expanded),
            child: Row(
              children: [
                Text(
                  expanded ? "Collapse" : "Expand",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Icon(
                  expanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
        if (expanded)
          ReorderableListView(
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
        else
          CompactIngredientView(ingredients: widget.ingredients),
      ],
    );
  }
}
