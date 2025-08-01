import 'package:flutter/material.dart';
import 'package:recipe_list/widgets/generic/dialogs/two_option_dialog.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TwoOptionDialog(
      content: "Do you really want to delete?",
      agree: 'Yes',
      disagree: 'No',
    );
  }
}
