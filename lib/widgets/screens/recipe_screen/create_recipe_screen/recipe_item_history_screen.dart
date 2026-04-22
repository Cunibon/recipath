import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/common.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
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

          if (entries.isEmpty) {
            return EmptyState(
              hint: AppLocalizations.of(context)!.cookRecipeForDataHint,
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomScrollView(
              slivers: [
                for (var cluster in entries)
                  SliverMainAxisGroup(
                    slivers: [
                      PinnedHeaderSliver(
                        child: ColoredBox(
                          color: ColorScheme.of(context).surface,
                          child: Column(
                            crossAxisAlignment: .start,
                            children: [
                              SizedBox(height: 8),
                              Text(
                                dateFormat.format(cluster.key),
                                style: dateTheme,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              HistoryRecipeItem(data: cluster.value[index]),
                          childCount: cluster.value.length,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
