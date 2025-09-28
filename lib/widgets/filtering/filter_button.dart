import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/filtering/change_filter_dialog.dart';
import 'package:recipath/widgets/filtering/filter_types.dart';
import 'package:recipath/widgets/filtering/quick_filter_data.dart';
import 'package:recipath/widgets/filtering/tag_filter_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';

class FilterButton extends ConsumerWidget {
  const FilterButton({
    required this.filterType,
    this.allTags = const {},
    this.quickFilters = const [],
    super.key,
  });
  final FilterTypes filterType;
  final Set<TagData> allTags;
  final List<QuickFilters> quickFilters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quickFilterState = ref.watch(quickFilterProvider);
    final tagFilterState = ref.watch(tagFilterProvider(filterType));

    final filterActive =
        quickFilterState.values.any((element) => element) ||
        tagFilterState.isNotEmpty;

    return GestureDetector(
      onTap: () async {
        final result = await showDialog<ChangeFilterDialogState>(
          context: context,
          builder: (context) => ChangeFilterDialog(
            onClear: () {
              ref.read(quickFilterProvider.notifier).clear();
              ref.read(tagFilterProvider(filterType).notifier).clear();
              context.pop();
            },
            quickFilters: quickFilters
                .map(
                  (e) => QuickFilterData(
                    quickFilter: e,
                    active: quickFilterState[e] ?? false,
                  ),
                )
                .toList(),
            selectedTags: tagFilterState.toSet(),
            allTags: allTags,
          ),
        );

        if (result != null) {
          final quickFilerNotifier = ref.read(quickFilterProvider.notifier);
          for (final quickFilter in result.quickFilters) {
            quickFilerNotifier.setFilter(
              filter: quickFilter.quickFilter,
              value: quickFilter.active,
            );
          }

          final tagFilerNotifier = ref.read(
            tagFilterProvider(filterType).notifier,
          );
          tagFilerNotifier.setFilters(filters: result.selectedTags.toList());
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Icon(
          Icons.filter_alt,
          color: filterActive ? Colors.amber : null,
          size: 28,
        ),
      ),
    );
  }
}
