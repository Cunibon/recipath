import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/providers/double_number_format_provider.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

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

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  void updateSelected(GroceryData item, NumberFormat doubleNumberFormat) {
    if (!widget.allowSelectedRemoval && widget.selected.contains(item.id)) {
      return;
    }

    amountController.text = doubleNumberFormat.format(item.normalAmount);
    setState(() => selected = item);
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(context);

    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final groceries = ref.watch(groceryProvider).value!;
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
                        name: localization.groceries,
                        items: groceryList,
                        listViewPadding: EdgeInsets.only(bottom: 33),
                        sort: (a, b) => a.name.toLowerCase().compareTo(
                          b.name.toLowerCase(),
                        ),
                        toSearchable: (item) => item.name,
                        toWidget: (item) => GestureDetector(
                          onTap: () => updateSelected(item, doubleNumberFormat),
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
                                          ? (_) => updateSelected(
                                              item,
                                              doubleNumberFormat,
                                            )
                                          : null,
                                    ),
                                    Expanded(child: Text(item.name)),
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
                          onPressed: () async {
                            final newGrocery = await context.push<GroceryData>(
                              "./${GroceryRoutes.createGrocery.path}",
                            );
                            if (newGrocery != null) {
                              updateSelected(newGrocery, doubleNumberFormat);
                            }
                          },
                          icon: Icon(Icons.add),
                          label: Text(localization.addNew),
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
                            decoration: InputDecoration(
                              labelText: localization.amount,
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) =>
                                value == null ||
                                    value.isEmpty ||
                                    doubleNumberFormat.tryParse(value) == 0
                                ? localization.addAmount
                                : null,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${unitLocalized[selected!.unit]} ${selected!.name}",
                            style: TextTheme.of(context).bodyLarge,
                          ),
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
                      label: Text(localization.done),
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
