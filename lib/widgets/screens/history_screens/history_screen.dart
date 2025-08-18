import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/common.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/screens/history_screens/data/history_data.dart';
import 'package:recipath/widgets/screens/history_screens/history_recipe_item.dart';

class HistoryScreen<T> extends ConsumerWidget {
  const HistoryScreen({required this.asyncData, super.key});

  final AsyncValue<Map<DateTime, List<HistoryData>>> asyncData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTheme = Theme.of(context).textTheme.titleLarge;

    return NavigationDrawerScaffold(
      titleBuilder: (title) =>
          DefaultNavigationTitle(title: title, syncState: SyncState.synced),
      body: asyncData.when(
        data: (data) {
          final entries = data.entries.toList();

          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dateFormat.format(entry.key), style: dateTheme),
                  Divider(),
                  for (final item in entry.value) HistoryRecipeItem(data: item),
                ],
              );
            },
          );
        },
        error: (error, stackTrace) =>
            Center(child: const Text('Oops, something unexpected happened')),
        loading: () => Center(child: const CircularProgressIndicator()),
      ),
    );
  }
}
