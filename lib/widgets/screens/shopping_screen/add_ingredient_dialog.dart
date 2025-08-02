import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class AddIngredientDialog extends ConsumerStatefulWidget {
  const AddIngredientDialog({
    this.initialSearch,
    this.selected = const [],
    this.allowSelectedRemoval = true,
    super.key,
  });

  final String? initialSearch;

  final Iterable<String> selected;
  final bool allowSelectedRemoval;

  @override
  ConsumerState<AddIngredientDialog> createState() =>
      _AddIngredientDialogState();
}

class _AddIngredientDialogState extends ConsumerState<AddIngredientDialog> {
  GroceryData? selected;
  final amountController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void updateSelected(GroceryData item) {
    if (!widget.allowSelectedRemoval && widget.selected.contains(item.id)) {
      return;
    }

    amountController.text = doubleNumberFormat.format(item.normalAmount);
    setState(() => selected = item);
  }

  @override
  Widget build(BuildContext context) {
    final groceries = ref.watch(groceryNotifierProvider).value!;
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
                  child: Stack(
                    children: [
                      SearchableList(
                        initialSearch: widget.initialSearch,
                        type: "Groceries",
                        items: groceryList,
                        bottomPadding: 33,
                        sort: (a, b) => a.name.toLowerCase().compareTo(
                          b.name.toLowerCase(),
                        ),
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
                                      value:
                                          selected == item ||
                                          widget.selected.contains(item.id),
                                      onChanged:
                                          widget.allowSelectedRemoval ||
                                              !widget.selected.contains(item.id)
                                          ? (_) => updateSelected(item)
                                          : null,
                                    ),
                                    Text(item.name),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton.icon(
                          onPressed: () => context.go(
                            "./${GroceryRoutes.createGrocery.path}",
                          ),
                          icon: Icon(Icons.add),
                          label: Text("Add new"),
                        ),
                      ),
                    ],
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
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) =>
                                value == null ||
                                    value.isEmpty ||
                                    doubleNumberFormat.tryParse(value) == 0
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
                              id: randomAlphaNumeric(16),
                              amount: doubleNumberFormat
                                  .parse(amountController.text)
                                  .toDouble(),
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
