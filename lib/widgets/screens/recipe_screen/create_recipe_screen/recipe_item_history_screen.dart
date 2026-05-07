import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/screens/history_screen/history_screen_content.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/providers/recipe_item_history_screen_notifier.dart';

class RecipeItemHistoryScreen extends ConsumerWidget {
  const RecipeItemHistoryScreen({required this.recipeId, super.key});
  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    final asyncData = ref.watch(recipeItemHistoryScreenProvider(recipeId));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.cookingHistory,
          style: TextTheme.of(context).titleLarge,
        ),
      ),
      body: CachedAsyncValueWrapper(
        asyncState: asyncData,
        builder: (data) {
          if (data.groupedHistoryData.isEmpty) {
            return EmptyState(
              hint: AppLocalizations.of(context)!.cookRecipeForDataHint,
            );
          }

          return HistoryScreenContent(data: data);
        },
      ),
    );
  }
}
