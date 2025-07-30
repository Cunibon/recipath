import 'package:flutter/material.dart';
import 'package:recipe_list/common.dart';

class Tag extends StatelessWidget {
  const Tag({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: getRandomColorBasedOnString(text),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
