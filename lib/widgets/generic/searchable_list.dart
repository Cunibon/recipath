import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/generic/highlight_search/highlight_scope.dart';

class SearchableList<T> extends StatefulWidget {
  const SearchableList({
    this.initialSearch,
    this.searchController,
    required this.name,
    required this.items,
    required this.toSearchable,
    required this.toWidget,
    this.sort,
    this.trailing,
    this.emptyState,
    this.listViewPadding = const EdgeInsets.only(bottom: 78),
    super.key,
  }) : assert(initialSearch == null || searchController == null);

  final String? initialSearch;
  final TextEditingController? searchController;

  final String name;
  final List<T> items;
  final String Function(T item) toSearchable;
  final Widget Function(T item) toWidget;
  final int Function(T a, T b)? sort;

  final Widget? trailing;
  final Widget? emptyState;
  final EdgeInsets listViewPadding;

  @override
  State<SearchableList<T>> createState() => _SearchableListState();
}

class _SearchableListState<T> extends State<SearchableList<T>> {
  late List<({T item, String search})> searchable;
  late String search = "";
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();

    if (widget.initialSearch != null) {
      search = widget.initialSearch!;
      controller = TextEditingController(text: widget.initialSearch);
    } else if (widget.searchController != null) {
      controller = widget.searchController!;
    }

    searchable = createSearchable(widget.items);
  }

  @override
  void dispose() {
    if (widget.searchController == null) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SearchableList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(widget.items, oldWidget.items)) {
      setState(() {
        searchable = createSearchable(widget.items);
      });
    }
  }

  List<({T item, String search})> createSearchable(List<T> items) {
    return items
        .map<({T item, String search})>(
          (e) => (item: e, search: widget.toSearchable(e)),
        )
        .toList()
      ..sort((a, b) => widget.sort?.call(a.item, b.item) ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    late List<T> items;

    if (search == "") {
      items = searchable.map((e) => e.item).toList();
    } else {
      final filtered = searchable.where(
        (e) => e.search.toLowerCase().contains(search.toLowerCase()),
      );
      items = filtered.map((e) => e.item).toList();
    }

    late Widget child;

    if (items.isEmpty) {
      if (widget.items.isEmpty) {
        child = widget.emptyState ?? SizedBox.shrink();
      } else {
        child = EmptyState(hint: localization.changeSearchForResults);
      }
    } else {
      child = ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => widget.toWidget(items[index]),
        padding: widget.listViewPadding,
      );
    }

    return HighlightScope(
      highlightTerm: search,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(
                      context,
                    )!.searchFor(widget.name),
                  ),
                  onChanged: (value) => setState(() => search = value),
                ),
              ),
              ?widget.trailing,
            ],
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
