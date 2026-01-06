import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:recipath/widgets/tag/tag.dart';

class ChangeTagDialog extends ConsumerStatefulWidget {
  const ChangeTagDialog({this.allTags, this.selected = const [], super.key});

  final Set<TagData>? allTags;
  final Iterable<String> selected;

  @override
  ConsumerState<ChangeTagDialog> createState() => _ChangeTagDialogState();
}

class _ChangeTagDialogState extends ConsumerState<ChangeTagDialog> {
  late List<TagData> tagList;
  final Set<String> selected = {};

  @override
  void initState() {
    super.initState();
    tagList =
        widget.allTags?.toList() ??
        ref.read(tagProvider).value!.values.toList();
    selected.addAll(widget.selected);
  }

  void updateSelected(TagData item) => setState(
    () => selected.contains(item.id)
        ? selected.remove(item.id)
        : selected.add(item.id),
  );

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final tags = ref.watch(tagProvider).value!;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 500),
          child: Stack(
            children: [
              SearchableList(
                name: localization.tags,
                trailing: selected.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          selected.length.toString(),
                          style: TextTheme.of(context).titleLarge,
                        ),
                      )
                    : null,
                items: tagList,
                sort: (a, b) =>
                    a.name.toLowerCase().compareTo(b.name.toLowerCase()),
                toSearchable: (item) => item.name,
                toWidget: (item) => GestureDetector(
                  onTap: () => updateSelected(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Checkbox(
                              value: selected.contains(item.id),
                              onChanged: (_) => updateSelected(item),
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
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => context.pop(
                        selected.map((e) => tags[e]).nonNulls.toSet(),
                      ),
                      icon: Icon(Icons.done),
                      label: Text(localization.done),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
