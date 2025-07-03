import 'package:flutter/material.dart';

class SearchDialog<T> extends StatefulWidget {
  const SearchDialog({
    required this.type,
    required this.items,
    required this.toSearchable,
    required this.toRepresentation,
    super.key,
  });

  final String type;
  final List<T> items;
  final String Function(T item) toSearchable;
  final Widget Function(T item) toRepresentation;

  @override
  State<SearchDialog<T>> createState() => _SearchDialogState();
}

class _SearchDialogState<T> extends State<SearchDialog<T>> {
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
          ..sort((a, b) => a.search.compareTo(b.search));
  }

  @override
  Widget build(BuildContext context) {
    late Iterable<Widget> itemWidgets;

    if (search == "") {
      itemWidgets = searchable.map((e) => widget.toRepresentation(e.item));
    } else {
      final filtered = searchable.where((e) => e.search.contains(search));
      itemWidgets = filtered.map((e) => widget.toRepresentation(e.item));
    }

    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Search for ${widget.type}"),
          onChanged: (value) => setState(() => search = value),
        ),
        ...itemWidgets,
      ],
    );
  }
}
