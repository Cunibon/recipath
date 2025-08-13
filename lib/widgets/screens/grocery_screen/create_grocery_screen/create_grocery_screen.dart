import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/application/grocery_modifier/grocery_modifier_notifier.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/data/gtin_data/gtin_data.dart';
import 'package:recipe_list/data/recipe_data/recipe_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/repos/recipe/recipe_repo_notifier.dart';
import 'package:recipe_list/repos/shopping/shopping_repo_notifier.dart';
import 'package:recipe_list/repos/storage/storage_repo_notifier.dart';
import 'package:recipe_list/widgets/generic/dialogs/delete_confirmation_dialog.dart';
import 'package:recipe_list/widgets/generic/information_dialog.dart';
import 'package:recipe_list/widgets/generic/unsaved_changes_scope.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/create_grocery_screen/grocery_form_fields.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class CreateGroceryScreen extends ConsumerStatefulWidget {
  const CreateGroceryScreen({this.groceryId, super.key});

  final String? groceryId;

  @override
  ConsumerState<CreateGroceryScreen> createState() => _CreateGroceryScreen();
}

class _CreateGroceryScreen extends ConsumerState<CreateGroceryScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final conversionController = TextEditingController();
  final kcalController = TextEditingController();
  final fatController = TextEditingController();
  final carbsController = TextEditingController();
  final proteinController = TextEditingController();
  final fiberController = TextEditingController();
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

    nameController.text = data.name;
    amountController.text = doubleNumberFormat.format(data.normalAmount);
    conversionController.text = doubleNumberFormat.format(
      data.conversionAmount,
    );
    kcalController.text = data.kcal == null
        ? ""
        : doubleNumberFormat.format(data.kcal);
    fatController.text = data.fat == null
        ? ""
        : doubleNumberFormat.format(data.fat);
    carbsController.text = data.carbs == null
        ? ""
        : doubleNumberFormat.format(data.carbs);
    proteinController.text = data.protein == null
        ? ""
        : doubleNumberFormat.format(data.protein);
    fiberController.text = data.fiber == null
        ? ""
        : doubleNumberFormat.format(data.fiber);
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
          actions: [
            IconButton(
              onPressed: () async {
                final gtin = await context.push<GTINData>(
                  "./${GroceryRoutes.scanGrocery.path}",
                );

                if (gtin != null) {
                  final unitType = UnitConversion.unitType(gtin.unit);
                  late UnitEnum conversion;

                  switch (unitType) {
                    case UnitType.volume:
                      conversion = UnitEnum.g;
                      break;
                    case UnitType.weight:
                      conversion = UnitEnum.ml;
                      break;
                    default:
                      conversion = gtin.unit;
                  }

                  final updateAmount =
                      data.conversionAmount == 0 ||
                      conversionController.text.isEmpty;

                  final newData = data.copyWith(
                    name: data.name.isEmpty ? gtin.name : data.name,
                    normalAmount: updateAmount
                        ? gtin.amount
                        : data.normalAmount,
                    unit: updateAmount ? gtin.unit : data.unit,
                    conversionAmount:
                        data.conversionAmount == 0 ||
                            conversionController.text.isEmpty
                        ? gtin.amount
                        : data.conversionAmount,
                    conversionUnit: updateAmount
                        ? conversion
                        : data.conversionUnit,
                    kcal: gtin.kcal,
                    fat: gtin.fat,
                    carbs: gtin.carbs,
                    protein: gtin.protein,
                    fiber: gtin.fiber,
                  );

                  nameController.text = newData.name;
                  amountController.text = doubleNumberFormat.format(
                    newData.normalAmount,
                  );
                  conversionController.text = doubleNumberFormat.format(
                    newData.conversionAmount,
                  );
                  if (newData.kcal != null) {
                    kcalController.text = doubleNumberFormat.format(
                      newData.kcal,
                    );
                  }
                  if (newData.fat != null) {
                    fatController.text = doubleNumberFormat.format(newData.fat);
                  }
                  if (newData.carbs != null) {
                    carbsController.text = doubleNumberFormat.format(
                      newData.carbs,
                    );
                  }
                  if (newData.protein != null) {
                    proteinController.text = doubleNumberFormat.format(
                      newData.protein,
                    );
                  }
                  if (newData.fiber != null) {
                    fiberController.text = doubleNumberFormat.format(
                      newData.fiber,
                    );
                  }
                  setState(() {
                    data = newData;
                  });
                }
              },
              icon: Icon(Icons.qr_code_2),
            ),
          ],
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

                  final recipes = await ref
                      .read(recipeRepoNotifierProvider)
                      .get();
                  final recipesUsing = recipes.values.where(
                    (e) => e
                        .getIngredients(groceries)
                        .any((e) => e.groceryId == data.id),
                  );

                  final shoppingItems = await ref
                      .read(shoppingRepoNotifierProvider)
                      .get();
                  final shoppingUsing = shoppingItems.values.where(
                    (e) => e.ingredient.groceryId == data.id,
                  );

                  final storageItems = await ref
                      .read(storageRepoNotifierProvider)
                      .get();
                  final storageUsing = storageItems.values.where(
                    (e) => e.ingredient.groceryId == data.id,
                  );

                  if (recipesUsing.isNotEmpty ||
                      shoppingUsing.isNotEmpty ||
                      storageUsing.isNotEmpty) {
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => InformationDialog(
                          message:
                              "There are ${recipesUsing.length} recipes, ${shoppingUsing.length} shopping items and ${storageUsing.length} storage items using this ingredient.\nIt cannot be deleted.",
                        ),
                      );
                    }
                    return;
                  }

                  if (context.mounted) {
                    final result = await showDialog(
                      context: context,
                      builder: (context) => DeleteConfirmationDialog(),
                    );

                    if (context.mounted && result) {
                      ref.read(groceryModifierNotifierProvider).archive(data);
                      context.pop();
                    }
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
              nameController: nameController,
              amountController: amountController,
              conversionController: conversionController,
              kcalController: kcalController,
              fatController: fatController,
              carbsController: carbsController,
              proteinController: proteinController,
              fiberController: fiberController,
              data: data,
            ),
          ),
        ),
      ),
    );
  }
}
