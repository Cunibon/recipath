import 'package:flutter/material.dart';
import 'package:recipe_list/data/grocery_data.dart';

class GroceryItem extends StatelessWidget {
  const GroceryItem({required this.data, super.key});
  final GroceryData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(data.name, style: Theme.of(context).textTheme.titleMedium),
            Text("${data.normalAmount} ${data.unit.name}"),
          ],
        ),
      ),
    );
  }
}
