import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/application/grocery_modifier/grocery_modifier_notifier.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/helper/ref_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/repos/recipe/recipe_repo_notifier.dart';
import 'package:recipath/repos/shopping/shopping_repo_notifier.dart';
import 'package:recipath/repos/storage/storage_repo_notifier.dart';
import 'package:recipath/widgets/filtering/filter_type_enum.dart';
import 'package:recipath/widgets/generic/dialogs/delete_confirmation_dialog.dart';
import 'package:recipath/widgets/generic/information_dialog.dart';
import 'package:recipath/widgets/generic/unsaved_changes_scope.dart';
import 'package:recipath/widgets/providers/double_number_format_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/create_grocery_screen/grocery_form.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/filtered_grocery_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

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
        ref
            .read(filteredGroceryProvider(FilterTypeEnum.grocery))
            .value?[widget.groceryId ?? ""] ??
        GroceryData(
          id: randomAlphaNumeric(16),
          name: "",
          normalAmount: 0,
          unit: UnitEnum.g,
          conversionAmount: 0,
          conversionUnit: UnitEnum.ml,
        );
    updateForm(initialData);
  }

  void updateForm(GroceryData newData) {
    data = newData;

    final doubleNumberFormat = ref.read(doubleNumberFormatProvider);

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
    final localization = AppLocalizations.of(context)!;

    return UnsavedChangesScope(
      canPop: data == initialData,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            localization.createGrocery,
            style: TextTheme.of(context).titleLarge,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final scannedData = await context.push<GroceryData>(
                  "./${GroceryRoutes.scanGrocery.path}",
                );

                if (scannedData != null) {
                  final openFoodData = scannedData.copyWith(id: data.id);
                  updateForm(openFoodData);
                  setState(() {
                    data = openFoodData;
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
              onPressed: () async {
                if (formKey.currentState?.validate() == true) {
                  await ref.read(groceryModifierProvider).add(data);
                  if (context.mounted) {
                    context.pop(data);
                  }
                }
              },
              icon: Icon(Icons.save),
              label: Text(localization.save),
            ),
            if (widget.groceryId != null)
              ElevatedButton.icon(
                onPressed: () => ref.run((tsx) async {
                  final groceries = await tsx.get(groceryProvider.future);

                  final recipes = await tsx.get(recipeRepoProvider).get();
                  final recipesUsing = recipes.values.where(
                    (e) => e
                        .getIngredients(groceries)
                        .any((e) => e.groceryId == data.id),
                  );

                  final shoppingItems = await tsx
                      .get(shoppingRepoProvider)
                      .get();
                  final shoppingUsing = shoppingItems.values.where(
                    (e) => e.ingredient.groceryId == data.id,
                  );

                  final storageItems = await tsx.get(storageRepoProvider).get();
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
                          message: localization.cantDeleteGroceryMessage(
                            recipesUsing.length,
                            shoppingUsing.length,
                            storageUsing.length,
                          ),
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
                      tsx.get(groceryModifierProvider).archive(data);
                      context.pop();
                    }
                  }
                }),
                icon: Icon(Icons.delete),
                label: Text(localization.delete),
              ),
          ],
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GroceryForm(
              updateData: (newData) => setState(() => data = newData),
              data: data,
              nameController: nameController,
              amountController: amountController,
              conversionController: conversionController,
              kcalController: kcalController,
              fatController: fatController,
              carbsController: carbsController,
              proteinController: proteinController,
              fiberController: fiberController,
            ),
          ),
        ),
      ),
    );
  }
}
