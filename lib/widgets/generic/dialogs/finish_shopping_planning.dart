import 'package:flutter/material.dart';
import 'package:recipe_list/widgets/generic/dialogs/two_option_dialog.dart';

class FinishShoppingPlanning extends StatelessWidget {
  const FinishShoppingPlanning({super.key});

  @override
  Widget build(BuildContext context) {
    return TwoOptionDialog(
      title: "Finish shopping planning",
      content:
          "Do you want to finish your shopping planning and your items to your shopping list",
      agree: 'Yes',
      disagree: 'No',
    );
  }
}
