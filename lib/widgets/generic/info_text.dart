import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        spacing: 8,
        crossAxisAlignment: .start,
        children: [
          Icon(Icons.info),
          Flexible(child: Text(text, style: TextTheme.of(context).bodyLarge)),
        ],
      ),
    );
  }
}
