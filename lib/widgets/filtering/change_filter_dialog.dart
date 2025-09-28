import 'package:flutter/material.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/filtering/quick_filter_button.dart';
import 'package:recipath/widgets/filtering/quick_filter_data.dart';
import 'package:recipath/widgets/tag/tag_list.dart';

class ChangeFilterDialog extends StatefulWidget {
  const ChangeFilterDialog({
    this.allTags = const {},
    this.selectedTags = const {},
    this.quickFilters = const [],
    required this.onClear,
    super.key,
  });
  final Set<TagData> allTags;
  final Set<TagData> selectedTags;
  final List<QuickFilterData> quickFilters;

  final void Function() onClear;

  @override
  State<ChangeFilterDialog> createState() => _ChangeFilterDialogState();
}

class _ChangeFilterDialogState extends State<ChangeFilterDialog> {
  late Set<TagData> selectedTags;
  late List<QuickFilterData> quickFilters;

  @override
  void initState() {
    super.initState();
    selectedTags = Set.from(widget.selectedTags);
    quickFilters = List.from(widget.quickFilters);
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(localization.filter),
          TextButton(
            onPressed: widget.onClear,
            child: Text(localization.clear),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (quickFilters.isNotEmpty) ...[
              Wrap(
                children: [
                  for (final filter in quickFilters)
                    QuickFilterButton(
                      filter: filter,
                      onTap: () => setState(() {
                        final index = quickFilters.indexOf(filter);
                        quickFilters.removeAt(index);
                        quickFilters.insert(
                          index,
                          QuickFilterData(
                            quickFilter: filter.quickFilter,
                            active: !filter.active,
                          ),
                        );
                      }),
                    ),
                ],
              ),
              Divider(),
            ],
            TagList(
              allTags: widget.allTags,
              selectedTags: selectedTags,
              onEdited: (newTags) => setState(() {
                selectedTags = newTags;
              }),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(localization.discard),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(localization.apply),
          onPressed: () {
            Navigator.pop(
              context,
              ChangeFilterDialogState(
                quickFilters: quickFilters,
                selectedTags: selectedTags,
              ),
            );
          },
        ),
      ],
    );
  }
}

class ChangeFilterDialogState {
  ChangeFilterDialogState({
    required this.quickFilters,
    required this.selectedTags,
  });
  final List<QuickFilterData> quickFilters;
  final Set<TagData> selectedTags;
}
