import 'package:flutter/material.dart';

class SearchableList<T> extends StatefulWidget {
  const SearchableList({
    required this.type,
    required this.items,
    required this.toSearchable,
    required this.toWidget,
    this.sort,
    super.key,
  });

  final String type;
  final List<T> items;
  final String Function(T item) toSearchable;
  final Widget Function(T item) toWidget;
  final int Function(T a, T b)? sort;

  @override
  State<SearchableList<T>> createState() => _SearchableListState();
}

class _SearchableListState<T> extends State<SearchableList<T>> {
  late List<({T item, String search})> searchable;
  late String search = "";

  @override
  void initState() {
    super.initState();
    searchable =
        widget.items
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
      final filtered = searchable.where((e) => e.search.contains(search));
      items = filtered.map((e) => e.item).toList();
    }

    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Search for ${widget.type}"),
          onChanged: (value) => setState(() => search = value),
        ),
        Divider(),
        ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => widget.toWidget(items[index]),
        ),
      ],
    );
  }
}
