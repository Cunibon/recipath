import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/screens/history_screen/history_screen.dart';
import 'package:recipath/widgets/screens/history_screen/recipe_history_screen/providers/recipe_history_screen_notifier.dart';

class RecipeHistoryScreen extends ConsumerWidget {
  const RecipeHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(recipeHistoryScreenProvider);

    return HistoryScreen(asyncData: asyncData);
  }
}
