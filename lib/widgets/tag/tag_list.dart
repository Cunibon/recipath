import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/tag/tag.dart';

class TagList extends ConsumerWidget {
  const TagList({
    required this.currentTags,
    this.onTagTapped,
    this.trailing,
    super.key,
  });

  final Set<TagData> currentTags;
  final void Function(TagData tagData)? onTagTapped;

  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortedTags = currentTags.toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        ...sortedTags.map(
          (e) => GestureDetector(
            onTap: () => onTagTapped?.call(e),
            child: Tag(text: e.name, color: e.color),
          ),
        ),
        ?trailing,
      ],
    );
  }
}
