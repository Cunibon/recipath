import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/widgets/generic/searchable_list.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/providers/grocery_notifier.dart';

class AddGroceriesDialog extends ConsumerStatefulWidget {
  const AddGroceriesDialog({
    this.initialSearch,
    this.selected = const [],
    this.allowSelectedRemoval = true,
    super.key,
  });

  final String? initialSearch;

  final Iterable<String> selected;
  final bool allowSelectedRemoval;

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

  void updateSelected(GroceryData item) {
    if (!widget.allowSelectedRemoval && widget.selected.contains(item.id)) {
      return;
    }

    setState(
      () => selected.contains(item.id)
          ? selected.remove(item.id)
          : selected.add(item.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final groceries = ref.watch(groceryNotifierProvider).value!;
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
                type: localization.groceries,
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
                              onChanged:
                                  widget.allowSelectedRemoval ||
                                      !widget.selected.contains(item.id)
                                  ? (_) => updateSelected(item)
                                  : null,
                            ),
                            Text(item.name),
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
                      onPressed: () =>
                          context.go("./${GroceryRoutes.createGrocery.path}"),
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
