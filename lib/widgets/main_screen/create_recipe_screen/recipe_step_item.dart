import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/ingredients_data.dart';
import 'package:recipe_list/data/recipe_step_data.dart';

class RecipeStepItem extends StatelessWidget {
  const RecipeStepItem({
    required this.index,
    required this.data,
    required this.onChanged,
    super.key,
  });

  final int index;
  final RecipeStepData data;
  final void Function(RecipeStepData newStep) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(labelText: "Description"),
              initialValue: data.description,
              onChanged: (value) =>
                  onChanged(data.copyWith(description: value)),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final groceryId = await showDialog<String?>(
                  context: context,
                  builder: builder,
                );

                if (groceryId != null) {
                  onChanged(
                    data.copyWith(
                      ingredients: List.from(data.ingredients)
                        ..add(
                          IngredientsData(
                            id: randomAlphaNumeric(16),
                            amount: 0,
                            groceryId: groceryId,
                          ),
                        ),
                    ),
                  );
                }
              },
              icon: Icon(Icons.add),
              label: Text("Add step"),
            ),
          ],
        ),
        ReorderableDragStartListener(
          index: index,
          child: Icon(Icons.drag_handle),
        ),
      ],
    );
  }
}
