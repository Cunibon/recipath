import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/common.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/select_tag_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_tag_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/tag_import_item.dart';

class RecipeTagImport extends ConsumerWidget {
  const RecipeTagImport({required this.filePath, super.key});

  final String filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagScreenState = ref
        .watch(recipeTagImportScreenProvider(filePath))
        .value!;

    return SingleChildScrollView(
      padding: edgeInsetsWithBottomPadding(context: context),
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
                      .read(recipeTagImportScreenProvider(filePath).notifier)
                      .selectTag(entry.key, result);
                }
              },
              clear: () => ref
                  .read(recipeTagImportScreenProvider(filePath).notifier)
                  .selectTag(entry.key, null),
              delete: () => ref
                  .read(recipeTagImportScreenProvider(filePath).notifier)
                  .delete(entry.key),
            ),
        ],
      ),
    );
  }
}
