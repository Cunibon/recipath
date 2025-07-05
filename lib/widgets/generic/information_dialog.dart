import 'package:flutter/material.dart';

class InformationDialog extends StatelessWidget {
  const InformationDialog({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message, style: Theme.of(context).textTheme.bodyLarge),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Okay'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
