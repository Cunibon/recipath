import 'package:flutter/material.dart';
import 'package:recipath/common.dart';
import 'package:recipath/widgets/screens/history_screen/data/history_screen_data.dart';
import 'package:recipath/widgets/screens/history_screen/history_recipe_item.dart';

class HistoryScreenContent extends StatelessWidget {
  const HistoryScreenContent({required this.data, super.key});

  final HistoryScreenData data;

  @override
  Widget build(BuildContext context) {
    final dateTheme = TextTheme.of(context).titleLarge;

    final entries = data.groupedHistoryData.entries.toList();

    return CustomScrollView(
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
                      Text(dateFormat.format(cluster.key), style: dateTheme),
                      Divider(),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => HistoryRecipeItem(
                    data: cluster.value[index],
                    groceryMap: data.groceryMap,
                  ),
                  childCount: cluster.value.length,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
