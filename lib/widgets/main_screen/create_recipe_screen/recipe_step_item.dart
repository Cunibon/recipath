import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/data/recipe_step_data.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';

class RecipeStepItem extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            TextFormField(
              maxLines: null,
              decoration: InputDecoration(labelText: "Description"),
              initialValue: data.description,
              validator: (value) =>
                  value == null || value.isEmpty ? "Add decription" : null,
              onChanged: (value) =>
                  onChanged(data.copyWith(description: value)),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final groceries = ref
                    .read(groceryNotifierProvider)
                    .values
                    .toList();
                final groceryId = await showDialog<String?>(
                  context: context,
                  builder: (context) => SearchableList(
                    type: "Groceries",
                    items: groceries,
                    toSearchable: (item) => item.toReadable(),
                    toRepresentation: (item) => GestureDetector(
                      onTap: () => context.pop(item.id),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.toReadable()),
                          ),
                        ),
                      ),
                    ),
                  ),
                );

                if (groceryId != null) {
                  onChanged(
                    data.copyWith(
                      ingredients: List.from(data.ingredients)
                        ..add(
                          IngredientData(
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
              label: Text("Add grocery"),
            ),
          ],
        ),
        ReorderableDragStartListener(
          index: index,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.drag_handle),
          ),
        ),
      ],
    );
  }
}
