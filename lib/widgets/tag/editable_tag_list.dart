import 'package:flutter/material.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/tag/change_tags_button.dart';
import 'package:recipath/widgets/tag/tag_list.dart';

class EditableTagList extends StatelessWidget {
  const EditableTagList({
    required this.currentTags,
    required this.tagType,
    required this.onEdited,
    this.onTagTapped,
    super.key,
  });

  final Set<TagData> currentTags;
  final TagTypeEnum tagType;

  final void Function(Set<TagData> newTags) onEdited;
  final void Function(TagData tagData)? onTagTapped;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return TagList(
      currentTags: currentTags,
      onTagTapped: onTagTapped,
      trailing: ChangeTagsButton(
        currentTags: currentTags,
        tagType: tagType,
        onEdited: onEdited,
        content: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add), Text(localization.changeTags)],
          ),
        ),
      ),
    );
  }
}
