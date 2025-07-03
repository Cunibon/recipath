import 'package:flutter/material.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/main_screen/create_recipe_screen/ingredient_item.dart';

class IngredientView extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final listCopy = List<IngredientData>.from(ingredients);

    final List<Widget> items = [];
    for (int i = 0; i < ingredients.length; i++) {
      final ingredient = ingredients[i];
      items.add(
        IngredientItem(
          key: Key(ingredient.id),
          index: i,
          data: ingredient,
          onChanged: (newIngredient) {
            listCopy.removeAt(i);
            listCopy.insert(i, newIngredient);
            onChanged(listCopy);
          },
        ),
      );
    }

    return ReorderableListView(
      scrollController: controller,
      children: items,
      onReorder: (int oldIndex, int newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = listCopy.removeAt(oldIndex);
        listCopy.insert(newIndex, item);
        onChanged(listCopy);
      },
    );
  }
}
