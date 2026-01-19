import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/tag/tag.dart';

class TagImportItem extends ConsumerWidget {
  const TagImportItem({
    required this.original,
    required this.current,
    required this.onTap,
    required this.clear,
    required this.delete,
    super.key,
  });

  final TagData original;
  final TagData? current;

  final void Function() onTap;
  final void Function() clear;
  final void Function() delete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSchema = ColorScheme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              spacing: 8,
              children: [
                GestureDetector(onTap: delete, child: Icon(Icons.delete)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Tag(text: original.name, color: original.color),
                      Text(original.description),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_forward),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Card(
                color: current == null ? colorSchema.primaryContainer : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Tag(
                              text: (current ?? original).name,
                              color: (current ?? original).color,
                            ),
                            Text((current ?? original).description),
                          ],
                        ),
                      ),
                      if (current != null)
                        GestureDetector(onTap: clear, child: Icon(Icons.clear)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
