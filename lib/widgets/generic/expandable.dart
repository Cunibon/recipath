import 'package:flutter/material.dart';

class Expandable extends StatefulWidget {
  const Expandable({
    required this.titleBuilder,
    required this.contentBuilder,
    super.key,
  });

  final Widget Function(bool expanded) titleBuilder;
  final Widget Function(bool expanded) contentBuilder;

  @override
  State<Expandable> createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {
  late bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => expanded = !expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: widget.titleBuilder(expanded),
          ),
        ),
        widget.contentBuilder(expanded),
      ],
    );
  }
}
