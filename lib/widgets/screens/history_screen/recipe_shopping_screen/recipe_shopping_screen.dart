import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/screens/history_screen/history_screen.dart';
import 'package:recipath/widgets/screens/history_screen/recipe_shopping_screen/providers/recipe_shopping_screen_notifier.dart';

class RecipeShoppingScreen extends ConsumerWidget {
  const RecipeShoppingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(recipeShoppingScreenProvider);

    return HistoryScreen(asyncData: asyncData);
  }
}
