import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/typed_tag_notifier.dart';
import 'package:recipath/widgets/tag/change_tag_dialog.dart';
import 'package:recipath/widgets/tag/change_tags_button.dart';
import 'package:recipath/widgets/tag/tag.dart';

class TagList extends ConsumerWidget {
  const TagList({
    required this.currentTags,
    required this.tagType,
    this.onTagTapped,
    this.onEdited,
    super.key,
  });

  final Set<TagData> currentTags;
  final TagTypeEnum tagType;
  final void Function(TagData tagData)? onTagTapped;

  final void Function(Set<TagData> newTags)? onEdited;

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
        if (onEdited != null)
          CachedAsyncValueWrapper(
            asyncState: ref.watch(typedTagProvider),
            builder: (data) => ChangeTagsButton(
              onTap: () async {
                final result = await showDialog<Set<TagData>>(
                  context: context,
                  builder: (context) => Consumer(
                    builder: (context, ref, _) => ChangeTagDialog(
                      allTags: data[tagType]!.values.toSet(),
                      selected: currentTags.map((e) => e.id),
                    ),
                  ),
                );

                if (result != null) {
                  onEdited!(result);
                }
              },
            ),
          ),
      ],
    );
  }
}
