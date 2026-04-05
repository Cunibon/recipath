import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/typed_tag_notifier.dart';
import 'package:recipath/widgets/tag/change_tag_dialog.dart';

class ChangeTagsButton extends ConsumerWidget {
  const ChangeTagsButton({
    required this.currentTags,
    required this.tagType,
    required this.onEdited,
    required this.content,
    super.key,
  });

  final Set<TagData> currentTags;
  final TagTypeEnum tagType;

  final void Function(Set<TagData> newTags) onEdited;

  final Widget content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CachedAsyncValueWrapper(
      asyncState: ref.watch(typedTagProvider),
      builder: (data) => InkWell(
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
            onEdited(result);
          }
        },
        borderRadius: BorderRadius.circular(25),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
              width: 2,
            ),
          ),
          child: content,
        ),
      ),
    );
  }
}
