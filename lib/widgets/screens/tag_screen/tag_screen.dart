import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_item.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_routes.dart';

class TagScreen extends ConsumerWidget {
  const TagScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    final state = ref.watch(tagProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState: state.value?.values.any((e) => e.uploaded == false) == true
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(
          "${RootRoutes.tagRoute.path}/${TagRoutes.createTag.path}",
        ),
        child: Icon(Icons.add),
      ),
      body: CachedAsyncValueWrapper(
        asyncState: state,
        builder: (data) => SearchableList(
          name: localization.items,
          items: data.values.toList(),
          toSearchable: (item) => "${item.name} ${item.description}",
          toWidget: (item) => TagItem(data: item),
          sort: (a, b) => a.name.compareTo(b.name),
        ),
      ),
    );
  }
}
