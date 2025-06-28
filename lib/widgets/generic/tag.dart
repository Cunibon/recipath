import 'package:flutter/material.dart';
import 'package:recipe_list/common.dart';

class Tag extends StatelessWidget {
  const Tag({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(color: getRandomColorBasedOnString(text), child: Text(text));
  }
}
