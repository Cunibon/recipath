import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_tags_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tags_per_grocery_provider.g.dart';

@riverpod
Future<Map<String, Set<TagData>>> tagsPerGroceryNotifier(Ref ref) async {
  final tags = await ref.watch(tagProvider.future);
  final groceryTags = await ref.watch(groceryTagsProvider.future);

  final Map<String, Set<TagData>> tagLookup = {};
  for (final groceryTag in groceryTags.values) {
    final tagSet = tagLookup.putIfAbsent(groceryTag.groceryId, () => {});
    final tag = tags[groceryTag.tagId];
    if (tag != null) {
      tagSet.add(tags[groceryTag.tagId]!);
    }
  }
  return tagLookup;
}
