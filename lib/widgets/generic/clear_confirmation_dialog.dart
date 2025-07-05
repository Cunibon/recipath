import 'package:flutter/material.dart';
import 'package:recipe_list/widgets/generic/two_option_dialog.dart';

class ClearConfirmationDialog extends StatelessWidget {
  const ClearConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TwoOptionDialog(
      title: "Clear all items?",
      content:
          "Do you really want clear all items?\nThere is no way to get them back.",
      agree: 'Yes',
      disagree: 'No',
    );
  }
}
