import 'package:flutter/material.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/tag/change_tag_dialog.dart';
import 'package:recipath/widgets/tag/change_tags_button.dart';
import 'package:recipath/widgets/tag/tag.dart';

class TagList extends StatelessWidget {
  const TagList({
    required this.selectedTags,
    this.allTags,
    this.onTagTapped,
    this.onEdited,
    super.key,
  });

  final Set<TagData> selectedTags;
  final Set<TagData>? allTags;
  final void Function(TagData tagData)? onTagTapped;

  final void Function(Set<TagData> newTags)? onEdited;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        ...selectedTags.map(
          (e) => GestureDetector(
            onTap: () => onTagTapped?.call(e),
            child: Tag(text: e.name, color: e.color),
          ),
        ),
        if (onEdited != null)
          ChangeTagsButton(
            onTap: () async {
              final result = await showDialog<Set<TagData>>(
                context: context,
                builder: (context) => ChangeTagDialog(
                  allTags: allTags,
                  selected: selectedTags.map((e) => e.id),
                ),
              );

              if (result != null) {
                onEdited!(result);
              }
            },
          ),
      ],
    );
  }
}
