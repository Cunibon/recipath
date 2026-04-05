import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/application/gorcery_tag_modifier/grocery_tag_modifier_notifier.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/grocery_tag_data/grocery_tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/filtering/tag_filter_notifier.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/providers/double_number_format_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/data/grocery_item_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_routes.dart';
import 'package:recipath/widgets/tag/compact_editable_tag_list.dart';

class GroceryItem extends ConsumerWidget {
  const GroceryItem({required this.data, super.key});
  final GroceryItemData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doubleNumberFormat = ref.watch(doubleNumberFormatProvider);

    final localization = AppLocalizations.of(context)!;
    final unitLocalized = localizeUnits(localization);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .start,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    HighlightableText(
                      data.groceryData.name,
                      style: TextTheme.of(context).titleMedium,
                    ),
                    HighlightableText(
                      "${doubleNumberFormat.format(data.groceryData.normalAmount)}${unitLocalized[data.groceryData.unit]}",
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => context.goRelative(
                    GroceryRoutes.createGrocery.path,
                    queryParameters: {idParameter: data.groceryData.id},
                  ),
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            Divider(),
            CompactEditableTagList(
              currentTags: data.tags,
              onTagTapped: (tagData) => ref
                  .read(tagFilterProvider(TagTypeEnum.grocery).notifier)
                  .toggleFilter(filter: tagData),
              tagType: TagTypeEnum.grocery,
              onEdited: (newTags) async {
                final added = newTags.difference(data.tags);
                final removed = data.tags.difference(newTags);

                final modifier = ref.read(groceryTagModifierProvider);
                for (final addedTag in added) {
                  modifier.add(
                    GroceryTagData(
                      groceryId: data.groceryData.id,
                      tagId: addedTag.id,
                    ),
                  );
                }
                for (final removedTag in removed) {
                  modifier.delete(
                    GroceryTagData(
                      groceryId: data.groceryData.id,
                      tagId: removedTag.id,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
