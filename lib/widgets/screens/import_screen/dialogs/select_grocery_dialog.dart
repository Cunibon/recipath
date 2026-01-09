import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class SelectGroceryDialog extends ConsumerStatefulWidget {
  const SelectGroceryDialog({this.initialSearch, super.key});

  final String? initialSearch;

  @override
  ConsumerState<SelectGroceryDialog> createState() =>
      _SelectGroceryDialogState();
}

class _SelectGroceryDialogState extends ConsumerState<SelectGroceryDialog> {
  GroceryData? selected;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 500),
          child: CachedAsyncValueWrapper(
            asyncState: ref.watch(groceryProvider),
            builder: (data) {
              final groceryList = data.values.toList();
              return Stack(
                children: [
                  SearchableList(
                    initialSearch: widget.initialSearch,
                    name: localization.groceries,
                    items: groceryList,
                    listViewPadding: EdgeInsets.only(bottom: 33),
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
                                Expanded(child: Text(item.name)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    emptyState: EmptyState(),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.pop(selected);
                      },
                      icon: Icon(Icons.check),
                      label: Text(localization.select),
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
