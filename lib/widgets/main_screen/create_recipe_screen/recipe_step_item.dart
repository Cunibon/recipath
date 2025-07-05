import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_step_data.dart';
import 'package:recipe_list/widgets/main_screen/create_recipe_screen/add_groceries_dialog.dart';
import 'package:recipe_list/widgets/main_screen/create_recipe_screen/ingredient_view.dart';

class RecipeStepItem extends ConsumerWidget {
  const RecipeStepItem({
    required this.index,
    required this.data,
    required this.onChanged,
    required this.delete,
    this.controller,
    super.key,
  });

  final int index;
  final RecipeStepData data;
  final void Function(RecipeStepData newStep) onChanged;
  final void Function() delete;

  final ScrollController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: delete,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.close),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: "Step ${index + 1} description",
                        ),
                        initialValue: data.description,
                        validator: (value) => value == null || value.isEmpty
                            ? "Add decription"
                            : null,
                        onChanged: (value) =>
                            onChanged(data.copyWith(description: value)),
                      ),
                      if (data.ingredients.isNotEmpty)
                        IngredientView(
                          controller: controller,
                          ingredients: data.ingredients,
                          onChanged: (newIngredients) => onChanged(
                            data.copyWith(ingredients: newIngredients),
                          ),
                        ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final groceries = await showDialog<Set<GroceryData>>(
                            context: context,
                            builder: (context) => AddGroceriesDialog(
                              selected: data.ingredients.map(
                                (e) => e.groceryId,
                              ),
                            ),
                          );

                          if (groceries != null) {
                            final existing = {
                              for (final ingredient in data.ingredients)
                                ingredient.groceryId: ingredient,
                            };

                            onChanged(
                              data.copyWith(
                                ingredients: groceries
                                    .map(
                                      (grocery) =>
                                          existing[grocery.id] ??
                                          IngredientData(
                                            amount: grocery.normalAmount,
                                            unit: grocery.unit,
                                            groceryId: grocery.id,
                                          ),
                                    )
                                    .toList(),
                              ),
                            );
                          }
                        },
                        icon: Icon(Icons.add),
                        label: Text("Change ingredients"),
                      ),
                    ],
                  ),
                ),
                ReorderableDragStartListener(
                  index: index,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.drag_handle),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
