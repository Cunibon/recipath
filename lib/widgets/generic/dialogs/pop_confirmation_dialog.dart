import 'package:flutter/material.dart';
import 'package:recipe_list/widgets/generic/dialogs/two_option_dialog.dart';

class PopConfirmationDialog extends StatelessWidget {
  const PopConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TwoOptionDialog(
      title: "Are you want to leave this page?",
      content: "All unsaved changes will be lost!",
      agree: "Leave",
      disagree: 'Nevermind',
    );
  }
}
