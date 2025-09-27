import 'package:flutter/material.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/screens/tag_screen/tag/change_tag_dialog.dart';
import 'package:recipath/widgets/screens/tag_screen/tag/change_tags_button.dart';
import 'package:recipath/widgets/screens/tag_screen/tag/tag.dart';

class TagList extends StatelessWidget {
  const TagList({
    required this.tags,
    this.onTagTapped,
    this.onEdited,
    super.key,
  });

  final Set<TagData> tags;
  final void Function(TagData tagData)? onTagTapped;

  final void Function(Set<TagData> newTags)? onEdited;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      children: [
        ...tags.map(
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
                builder: (context) =>
                    ChangeTagDialog(selected: tags.map((e) => e.id)),
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
