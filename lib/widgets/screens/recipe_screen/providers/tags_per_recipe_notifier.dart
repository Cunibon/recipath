import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_tags_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tags_per_recipe_notifier.g.dart';

@riverpod
Future<IMap<String, Set<TagData>>> tagsPerRecipeNotifier(Ref ref) async {
  final tags = await ref.watch(tagProvider.future);
  final recipeTags = await ref.watch(recipeTagsProvider.future);

  final Map<String, Set<TagData>> tagLookup = {};
  for (final recipeTag in recipeTags.values) {
    final tagSet = tagLookup.putIfAbsent(recipeTag.recipeId, () => {});
    final tag = tags[recipeTag.tagId];
    if (tag != null) {
      tagSet.add(tags[recipeTag.tagId]!);
    }
  }
  return tagLookup.toIMap();
}
