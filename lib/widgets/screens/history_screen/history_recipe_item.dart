import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/common.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/widgets/screens/history_screen/data/history_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/compact_recipe_item_content.dart';

class HistoryRecipeItem extends ConsumerWidget {
  const HistoryRecipeItem({
    required this.data,
    required this.groceryMap,
    super.key,
  });
  final HistoryData data;
  final Map<String, GroceryData> groceryMap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CompactRecipeItemContent(
          recipeData: data.recipeData,
          groceryMap: groceryMap,
          trailingTitle: Row(
            children: [
              Text(timeFormat.format(data.startDate)),
              if (data.endDate != null)
                Text(
                  " (${data.endDate!.difference(data.startDate).inMinutes}min)",
                ),
            ],
          ),
        ),
      ),
    );
  }
}
