import 'package:flutter/material.dart';

class PopConfirmationDialog extends StatelessWidget {
  const PopConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you want to leave this page?'),
      content: const Text('All unsaved changes will be lost!'),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Nevermind'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Leave'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}
