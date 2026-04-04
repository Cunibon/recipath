import 'package:flutter/material.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_item.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_routes.dart';

class TagTabs extends StatefulWidget {
  const TagTabs({required this.typedTags, super.key});

  final Map<TagTypeEnum, Map<String, TagData>> typedTags;

  @override
  State<TagTabs> createState() => _TagTabsState();
}

class _TagTabsState extends State<TagTabs> {
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final enumLocalization = localizeTagType(localization);

    return DefaultTabController(
      length: TagTypeEnum.values.length,
      child: Column(
        children: [
          TabBar(
            tabs: [
              for (final tagType in TagTypeEnum.values)
                Tab(text: enumLocalization[tagType]),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                for (final tagType in TagTypeEnum.values)
                  SearchableList(
                    name: localization.items,
                    items: widget.typedTags[tagType]!.values.toList(),
                    toSearchable: (item) => "${item.name} ${item.description}",
                    toWidget: (item) => TagItem(data: item),
                    sort: (a, b) => a.name.compareTo(b.name),
                    emptyState: EmptyState(
                      hint: localization.createTagHint,
                      onTap: () => context.goRelative(TagRoutes.createTag.path),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
