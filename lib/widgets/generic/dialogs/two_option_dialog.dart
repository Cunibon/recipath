import 'package:flutter/material.dart';

class TwoOptionDialog extends StatelessWidget {
  const TwoOptionDialog({
    super.key,
    this.title,
    required this.content,
    required this.agree,
    required this.disagree,
  });

  final String? title;
  final Widget content;

  final String agree;
  final String disagree;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title == null ? null : Text(title!),
      content: content,
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(disagree),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(agree),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}
