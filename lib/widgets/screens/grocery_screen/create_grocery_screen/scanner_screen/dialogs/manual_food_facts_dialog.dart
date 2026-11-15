import 'package:material_ui/material_ui.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/grocery_screen/create_grocery_screen/grocery_form.dart';

class ManualFoodFactsDialog extends StatefulWidget {
  const ManualFoodFactsDialog({super.key});

  @override
  State<ManualFoodFactsDialog> createState() => _ManualFoodFactsDialogState();
}

class _ManualFoodFactsDialogState extends State<ManualFoodFactsDialog> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final conversionController = TextEditingController();
  final kcalController = TextEditingController();
  final fatController = TextEditingController();
  final carbsController = TextEditingController();
  final proteinController = TextEditingController();
  final fiberController = TextEditingController();

  late GroceryData data = GroceryData(
    id: randomAlphaNumeric(16),
    name: "",
    normalAmount: 0,
    unit: UnitEnum.g,
    conversionAmount: 0,
    conversionUnit: UnitEnum.ml,
  );

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(localization.contributeToOpenFoodFacts),
      content: Form(
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
      actions: [
        TextButton(
          child: Text(localization.save),
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              Navigator.pop(context, data);
            }
          },
        ),
      ],
    );
  }
}
