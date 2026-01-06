import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/common.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/screens/history_screen/history_recipe_item.dart';
import 'package:recipath/widgets/screens/recipe_screen/create_recipe_screen/providers/recipe_item_history_screen_notifier.dart';

class RecipeItemHistoryScreen extends ConsumerWidget {
  const RecipeItemHistoryScreen({required this.recipeId, super.key});
  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final dateTheme = TextTheme.of(context).titleLarge;

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
          final entries = data.entries.toList();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dateFormat.format(entry.key), style: dateTheme),
                    Divider(),
                    for (final item in entry.value)
                      HistoryRecipeItem(data: item),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
