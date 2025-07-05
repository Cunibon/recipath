import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchableList<T> extends StatefulWidget {
  const SearchableList({
    required this.type,
    required this.items,
    required this.toSearchable,
    required this.toWidget,
    this.sort,
    this.bottomPadding,
    super.key,
  });

  final String type;
  final List<T> items;
  final String Function(T item) toSearchable;
  final Widget Function(T item) toWidget;
  final int Function(T a, T b)? sort;

  final double? bottomPadding;

  @override
  State<SearchableList<T>> createState() => _SearchableListState();
}

class _SearchableListState<T> extends State<SearchableList<T>> {
  late List<({T item, String search})> searchable;
  late String search = "";

  @override
  void initState() {
    super.initState();
    searchable = createSearchable(widget.items);
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
    late List<T> items;

    if (search == "") {
      items = searchable.map((e) => e.item).toList();
    } else {
      final filtered = searchable.where(
        (e) => e.search.toLowerCase().contains(search.toLowerCase()),
      );
      items = filtered.map((e) => e.item).toList();
    }

    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Search for ${widget.type}"),
          onChanged: (value) => setState(() => search = value),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => widget.toWidget(items[index]),
            padding: widget.bottomPadding != null
                ? EdgeInsets.only(bottom: widget.bottomPadding!)
                : null,
          ),
        ),
      ],
    );
  }
}
