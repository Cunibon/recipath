import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:recipath/widgets/tag/tag.dart';

class SelectTagDialog extends ConsumerStatefulWidget {
  const SelectTagDialog({super.key});

  @override
  ConsumerState<SelectTagDialog> createState() => _SelectTagDialogState();
}

class _SelectTagDialogState extends ConsumerState<SelectTagDialog> {
  TagData? selected;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 500),
          child: CachedAsyncValueWrapper(
            asyncState: ref.watch(tagProvider),
            builder: (data) {
              final tagList = data.values.toList();
              return Stack(
                children: [
                  SearchableList(
                    name: localization.tags,
                    items: tagList,
                    sort: (a, b) =>
                        a.name.toLowerCase().compareTo(b.name.toLowerCase()),
                    toSearchable: (item) => item.name,
                    toWidget: (item) => GestureDetector(
                      onTap: () => setState(() => selected = item),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: selected == item,
                                  onChanged: (_) =>
                                      setState(() => selected = item),
                                ),
                                Tag(text: item.name, color: item.color),
                                VerticalDivider(),
                                Expanded(child: Text(item.description)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    listViewPadding: EdgeInsets.only(bottom: 100),
                    emptyState: EmptyState(),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            context.pop(selected);
                          },
                          icon: Icon(Icons.done),
                          label: Text(localization.done),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
