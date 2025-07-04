import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/widgets/generic/delete_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/unsaved_changes_scope.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';

class CreateGroceryScreen extends ConsumerStatefulWidget {
  const CreateGroceryScreen({this.groceryId, super.key});

  final String? groceryId;

  @override
  ConsumerState<CreateGroceryScreen> createState() => _CreateGroceryScreen();
}

class _CreateGroceryScreen extends ConsumerState<CreateGroceryScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final amountController = TextEditingController();
  late GroceryData initialData;
  late GroceryData data;

  @override
  void initState() {
    super.initState();
    initialData =
        ref.read(groceryNotifierProvider)[widget.groceryId] ??
        GroceryData(
          id: randomAlphaNumeric(16),
          name: "",
          normalAmount: 0,
          unit: UnitEnum.g,
        );
    data = initialData;

    amountController.text = doubleNumberFormat.format(data.normalAmount);
  }

  @override
  Widget build(BuildContext context) {
    return UnsavedChangesScope(
      canPop: data == initialData,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create grocery",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                if (formKey.currentState?.validate() == true) {
                  ref.read(groceryNotifierProvider.notifier).addGrocery(data);
                  context.pop();
                }
              },
              icon: Icon(Icons.save),
              label: Text("Save"),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) => DeleteConfirmationDialog(),
                );

                if (result) {
                  ref
                      .read(groceryNotifierProvider.notifier)
                      .deleteGrocery(data);
                }
              },
              icon: Icon(Icons.delete),
              label: Text("Delete"),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    initialValue: data.name,
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (value) =>
                        value == null || value.isEmpty ? "Add name" : null,
                    onChanged: (value) =>
                        setState(() => data = data.copyWith(name: value)),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: TextFormField(
                          controller: amountController,
                          decoration: InputDecoration(
                            labelText: "Normal amount",
                          ),
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? "Add normal amount"
                              : null,
                          onChanged: (value) {
                            final parsed = double.tryParse(value);
                            if (parsed != null) {
                              setState(
                                () =>
                                    data = data.copyWith(normalAmount: parsed),
                              );
                            }
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(labelText: "Unit"),
                          value: data.unit,
                          validator: (value) =>
                              value == null ? "Add unit" : null,
                          items: UnitEnum.values
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              final newAmount = UnitConversion.convert(
                                data.normalAmount,
                                data.unit,
                                value,
                              );
                              amountController.text = doubleNumberFormat.format(
                                newAmount,
                              );
                              setState(
                                () => data = data.copyWith(
                                  unit: value,
                                  normalAmount: newAmount,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
