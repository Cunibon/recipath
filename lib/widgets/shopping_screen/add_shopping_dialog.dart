import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';

class AddShoppingDialog extends ConsumerStatefulWidget {
  const AddShoppingDialog({super.key});

  @override
  ConsumerState<AddShoppingDialog> createState() => _AddShoppingDialogState();
}

class _AddShoppingDialogState extends ConsumerState<AddShoppingDialog> {
  GroceryData? selected;
  final amountController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void updateSelected(GroceryData item) {
    amountController.text = doubleNumberFormat.format(item.normalAmount);
    setState(() => selected = item);
  }

  @override
  Widget build(BuildContext context) {
    final groceries = ref.watch(groceryNotifierProvider);
    final groceryList = groceries.values.toList();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 500),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SearchableList(
                    type: "Groceries",
                    items: groceryList,
                    sort: (a, b) =>
                        a.name.toLowerCase().compareTo(b.name.toLowerCase()),
                    toSearchable: (item) => item.name,
                    toWidget: (item) => GestureDetector(
                      onTap: () => updateSelected(item),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: selected == item,
                                  onChanged: (_) => updateSelected(item),
                                ),
                                Text(item.name),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (selected != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            controller: amountController,
                            decoration: InputDecoration(labelText: "Amount"),
                            validator: (value) =>
                                value == null ||
                                    value.isEmpty ||
                                    double.tryParse(value) == 0
                                ? "Add amount"
                                : null,
                          ),
                        ),
                        Text(
                          "${selected!.unit.name} ${selected!.name}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          context.pop(
                            IngredientData(
                              amount: double.parse(amountController.text),
                              unit: selected!.unit,
                              groceryId: selected!.id,
                            ),
                          );
                        }
                      },
                      icon: Icon(Icons.done),
                      label: Text("Done"),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
