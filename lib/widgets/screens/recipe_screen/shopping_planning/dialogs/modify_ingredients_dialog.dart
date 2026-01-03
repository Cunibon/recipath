import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/recipe_screen/shopping_planning/modify_ingredients_view.dart';

class ModifyIngredientsDialog extends ConsumerStatefulWidget {
  const ModifyIngredientsDialog({required this.ingredientDataList, super.key});

  final List<IngredientData> ingredientDataList;

  @override
  ConsumerState<ModifyIngredientsDialog> createState() =>
      _ModifyIngredientsDialogState();
}

class _ModifyIngredientsDialogState
    extends ConsumerState<ModifyIngredientsDialog> {
  late List<IngredientData> ingredientDataList;

  @override
  void initState() {
    super.initState();

    ingredientDataList = widget.ingredientDataList;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(localization.changeIngredients),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.maxFinite,
        child: ModifyIngredientsView(
          ingredientDataList: ingredientDataList,
          onChange: (newIngredientDataList) => setState(() {
            ingredientDataList = newIngredientDataList;
          }),
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(localization.actionCancel),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(localization.actionContinue),
          onPressed: () {
            Navigator.pop(context, ingredientDataList);
          },
        ),
      ],
    );
  }
}
