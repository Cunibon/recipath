import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/application/grocery_modifier/grocery_modifier_notifier.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/widgets/generic/delete_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/information_dialog.dart';
import 'package:recipe_list/widgets/generic/unsaved_changes_scope.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipe_list/widgets/recipe_screen/providers/recipe_notifier.dart';
import 'package:recipe_list/widgets/shopping_screen/providers/shopping_notifier.dart';

class CreateGroceryScreen extends ConsumerStatefulWidget {
  const CreateGroceryScreen({this.groceryId, super.key});

  final String? groceryId;

  @override
  ConsumerState<CreateGroceryScreen> createState() => _CreateGroceryScreen();
}

class _CreateGroceryScreen extends ConsumerState<CreateGroceryScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final amountController = TextEditingController();
  final conversionController = TextEditingController();
  late GroceryData initialData;
  late GroceryData data;

  @override
  void initState() {
    super.initState();
    initialData =
        ref.read(groceryNotifierProvider).value![widget.groceryId] ??
        GroceryData(
          id: randomAlphaNumeric(16),
          name: "",
          normalAmount: 0,
          unit: UnitEnum.g,
          conversionAmount: 0,
          conversionUnit: UnitEnum.ml,
        );
    data = initialData;

    amountController.text = doubleNumberFormat.format(data.normalAmount);
    conversionController.text = doubleNumberFormat.format(
      data.conversionAmount,
    );
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
                  ref.read(groceryModifierNotifierProvider).add(data);
                  context.pop();
                }
              },
              icon: Icon(Icons.save),
              label: Text("Save"),
            ),
            if (widget.groceryId != null)
              ElevatedButton.icon(
                onPressed: () async {
                  final groceries = ref.read(groceryNotifierProvider).value!;

                  final recipes = ref
                      .read(recipeNotifierProvider)
                      .value!
                      .values;
                  final recipesUsing = recipes.where(
                    (e) => e
                        .getIngredients(groceries)
                        .any((e) => e.groceryId == data.id),
                  );

                  final shoppingItems = ref
                      .read(shoppingNotifierProvider)
                      .value!
                      .values;
                  final shoppingUsing = shoppingItems.where(
                    (e) => e.ingredient.groceryId == data.id,
                  );

                  if (recipesUsing.isNotEmpty || shoppingUsing.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => InformationDialog(
                        message:
                            "There are ${recipesUsing.length} recipes and ${shoppingUsing.length} shopping items using this ingredient.\nIt cannot be deleted.",
                      ),
                    );
                    return;
                  }

                  final result = await showDialog(
                    context: context,
                    builder: (context) => DeleteConfirmationDialog(),
                  );

                  if (context.mounted && result) {
                    ref.read(groceryModifierNotifierProvider).delete(data);
                    context.pop();
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
                        flex: 3,
                        child: TextFormField(
                          controller: amountController,
                          decoration: InputDecoration(
                            labelText: "Normal amount",
                          ),
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validator: (value) =>
                              value == null ||
                                  value.isEmpty ||
                                  doubleNumberFormat.tryParse(value) == 0
                              ? "Add normal amount"
                              : null,
                          onChanged: (value) {
                            final parsed = doubleNumberFormat
                                .tryParse(value)
                                ?.toDouble();
                            if (parsed != null) {
                              double conversion =
                                  data.conversionAmount /
                                  data.normalAmount *
                                  parsed;

                              if (conversion.isNaN || conversion.isInfinite) {
                                conversion = data.conversionAmount;
                              }

                              if (conversion == 0) {
                                conversion = parsed;
                              }

                              conversionController.text = doubleNumberFormat
                                  .format(conversion);

                              setState(
                                () => data = data.copyWith(
                                  normalAmount: parsed,
                                  conversionAmount: conversion,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 65,
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

                              final unitType = UnitConversion.unitType(value);
                              late UnitEnum conversion;

                              switch (unitType) {
                                case UnitType.volume:
                                  conversion = UnitEnum.g;
                                  break;
                                case UnitType.weight:
                                  conversion = UnitEnum.ml;
                                  break;
                                default:
                                  conversion = value;
                              }

                              setState(
                                () => data = data.copyWith(
                                  unit: value,
                                  normalAmount: newAmount,
                                  conversionUnit: conversion,
                                  conversionAmount: newAmount,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      if (UnitConversion.unitType(data.unit) !=
                          UnitType.misc) ...[
                        SizedBox(width: 8),
                        Text(
                          "=",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          flex: 3,
                          child: TextFormField(
                            controller: conversionController,
                            decoration: InputDecoration(
                              labelText: "Conversion amount",
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) => value == null || value.isEmpty
                                ? "Add conversion"
                                : null,
                            onChanged: (value) {
                              final parsed = doubleNumberFormat.tryParse(value);
                              if (parsed != null) {
                                setState(
                                  () => data = data.copyWith(
                                    conversionAmount: parsed.toDouble(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: 65,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(labelText: "Unit"),
                            value: data.conversionUnit,
                            validator: (value) =>
                                value == null ? "Add unit" : null,
                            items:
                                (UnitConversion.unitType(data.unit) ==
                                            UnitType.volume
                                        ? UnitConversion.weightToGram.keys
                                        : UnitConversion.volumeToMl.keys)
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
                                  data.conversionAmount,
                                  data.conversionUnit,
                                  value,
                                );
                                conversionController.text = doubleNumberFormat
                                    .format(newAmount);
                                setState(
                                  () => data = data.copyWith(
                                    conversionUnit: value,
                                    conversionAmount: newAmount,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
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
