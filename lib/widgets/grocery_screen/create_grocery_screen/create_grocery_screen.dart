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
import 'package:recipe_list/widgets/grocery_screen/create_grocery_screen/grocery_form_fields.dart';
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
  final kcalController = TextEditingController();
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
    kcalController.text = data.kcal == null
        ? ""
        : doubleNumberFormat.format(data.kcal);
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
            child: GroceryFormFields(
              updateData: (newData) => setState(() => data = newData),
              amountController: amountController,
              conversionController: conversionController,
              kcalController: kcalController,
              data: data,
            ),
          ),
        ),
      ),
    );
  }
}
