import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_not_uploaded_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/typed_tag_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_routes.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_tabs.dart';

class TagScreen extends ConsumerStatefulWidget {
  const TagScreen({super.key});

  @override
  ConsumerState<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends ConsumerState<TagScreen>
    with TickerProviderStateMixin {
  late final TabController tabController = TabController(
    length: TagTypeEnum.values.length,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(typedTagProvider);

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(
        title: title,
        syncState: ref.watch(tagNotUploadedProvider).value ?? false
            ? SyncState.unsynced
            : SyncState.synced,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goRelative(
          TagRoutes.createTag.path,
          extra: TagTypeEnum.values[tabController.index],
        ),
        child: Icon(Icons.add),
      ),
      body: CachedAsyncValueWrapper(
        asyncState: state,
        builder: (data) =>
            TagTabs(typedTags: data, tabController: tabController),
      ),
    );
  }
}
