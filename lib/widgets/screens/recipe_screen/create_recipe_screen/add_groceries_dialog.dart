import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/generic/searchable_list.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class AddGroceriesDialog extends ConsumerStatefulWidget {
  const AddGroceriesDialog({
    this.initialSearch,
    this.selected = const [],
    super.key,
  });

  final String? initialSearch;

  final Iterable<String> selected;

  @override
  ConsumerState<AddGroceriesDialog> createState() => _AddGroceriesDialogState();
}

class _AddGroceriesDialogState extends ConsumerState<AddGroceriesDialog> {
  final Set<String> selected = {};

  @override
  void initState() {
    super.initState();
    selected.addAll(widget.selected);
  }

  void updateSelected(GroceryData item) => setState(
    () => selected.contains(item.id)
        ? selected.remove(item.id)
        : selected.add(item.id),
  );

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final groceries = ref.watch(groceryProvider).value!;
    final groceryList = groceries.values.toList();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 500),
          child: Stack(
            children: [
              SearchableList(
                initialSearch: widget.initialSearch,
                name: localization.groceries,
                trailing: selected.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          selected.length.toString(),
                          style: TextTheme.of(context).titleLarge,
                        ),
                      )
                    : null,
                items: groceryList,
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
                            Text(item.name),
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
                      onPressed: () async {
                        final newGrocery = await context.push<GroceryData>(
                          "./${GroceryRoutes.createGrocery.path}",
                        );
                        if (newGrocery != null) {
                          updateSelected(newGrocery);
                        }
                      },
                      icon: Icon(Icons.add),
                      label: Text(localization.addNew),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => context.pop(
                        selected.map((e) => groceries[e]!).toSet(),
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
