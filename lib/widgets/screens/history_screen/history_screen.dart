import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/screens/history_screen/data/history_screen_data.dart';
import 'package:recipath/widgets/screens/history_screen/history_screen_content.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({
    required this.asyncData,
    required this.emptyHint,
    super.key,
  });

  final AsyncValue<HistoryScreenData> asyncData;
  final String emptyHint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(title: title),
      body: CachedAsyncValueWrapper(
        asyncState: asyncData,
        builder: (data) {
          if (data.groupedHistoryData.isEmpty) {
            return EmptyState(
              hint: emptyHint,
              onTap: () => context.go(RootRoutes.recipeRoute.path),
            );
          }

          return HistoryScreenContent(data: data);
        },
      ),
    );
  }
}
