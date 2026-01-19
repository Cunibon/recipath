import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/select_tag_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/providers/tag_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/tag_import_item.dart';

class TagImport extends ConsumerWidget {
  const TagImport({required this.filePath, super.key});

  final String filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagScreenState = ref.watch(tagImportScreenProvider(filePath)).value!;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 78),
      child: Column(
        children: [
          for (final entry in tagScreenState.mappedTags.entries)
            TagImportItem(
              original: tagScreenState.tagLookup[entry.key]!,
              current: entry.value,
              onTap: () async {
                final result = await showDialog<TagData>(
                  context: context,
                  builder: (context) => SelectTagDialog(),
                );

                if (result != null) {
                  ref
                      .read(tagImportScreenProvider(filePath).notifier)
                      .selectTag(entry.key, result);
                }
              },
              clear: () => ref
                  .read(tagImportScreenProvider(filePath).notifier)
                  .selectTag(entry.key, null),
              delete: () => ref
                  .read(tagImportScreenProvider(filePath).notifier)
                  .delete(entry.key),
            ),
        ],
      ),
    );
  }
}
