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
  State<SearchDialog> createState() => _SearchDialogState<T>();
}

class _SearchDialogState<T> extends State<SearchDialog> {
  late List<({T item, String search})> searchable;
  late String search = "";

  @override
  void initState() {
    super.initState();
    searchable = widget.items
        .map<({T item, String search})>(
          (e) => (item: e, search: widget.toSearchable(e)),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Search for ${widget.type}"),
          onChanged: (value) => setState(() => search = value),
        ),
      ],
    );
  }
}
