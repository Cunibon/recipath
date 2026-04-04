import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_screen_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_routes.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_tabs.dart';

class TagScreen extends ConsumerWidget {
  const TagScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tagScreenProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState:
            state.value?.values
                    .expand((e) => e.values)
                    .any((e) => e.uploaded == false) ==
                true
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goRelative(TagRoutes.createTag.path),
        child: Icon(Icons.add),
      ),
      body: CachedAsyncValueWrapper(
        asyncState: state,
        builder: (data) => TagTabs(typedTags: data),
      ),
    );
  }
}
