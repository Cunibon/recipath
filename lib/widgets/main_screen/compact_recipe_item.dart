import 'package:flutter/material.dart';
import 'package:recipe_list/data/ingredients_data.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/widgets/main_screen/local_image.dart';

class CompactRecipeItem extends StatelessWidget {
  const CompactRecipeItem({required this.data, super.key});
  final RecipeData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (data.imageName != null) LocalImage(fileName: data.imageName!),
            Expanded(
              child: Column(
                children: [
                  Text(data.title),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: data
                        .getIngredients()
                        .map((e) => Text(e.toReadable()))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
