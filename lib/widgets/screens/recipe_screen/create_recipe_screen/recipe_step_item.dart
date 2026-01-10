import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/recipe_step_data/recipe_step_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/add_groceries_dialog.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/recipe_ingredient_view.dart';

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
    final localization = AppLocalizations.of(context)!;

    return Card(
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
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        maxLines: null,
                        minLines: 2,
                        decoration: InputDecoration(
                          labelText: localization.objectDescription(
                            "${localization.step} ${index + 1}",
                          ),
                        ),
                        initialValue: data.description,
                        validator: (value) => value == null || value.isEmpty
                            ? localization.addDescription
                            : null,
                        onChanged: (value) =>
                            onChanged(data.copyWith(description: value)),
                      ),
                      if (data.ingredients.isNotEmpty)
                        RecipeIngredientView(
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
                                            id: randomAlphaNumeric(16),
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
                        label: Text(localization.changeIngredients),
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
