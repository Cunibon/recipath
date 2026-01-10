import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/export_notifier.dart';

class ShareRecipeButton extends ConsumerWidget {
  const ShareRecipeButton({required this.recipe, super.key});

  final RecipeData recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final notifier = ref.read(exportProvider.notifier);

        notifier.clear();
        notifier.toggleRecipe(recipe);
        await notifier.export();
        notifier.clear();
      },
      icon: Icon(Icons.share),
    );
  }
}
