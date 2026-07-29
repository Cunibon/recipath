import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/widgets/screens/import_screen/data/tag_import_screen_state.dart';
import 'package:recipath/widgets/screens/import_screen/providers/grocery_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_data_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_import_screen_notifier.g.dart';

@riverpod
class TagImportScreenNotifier extends _$TagImportScreenNotifier {
  @override
  Future<TagImportScreenState> build(String path, TagTypeEnum tagType) async {
    final importData = await ref.watch(importDataProvider(path).future);

    final localTagNameLookup = (await ref.watch(
      tagProvider.future,
    )).map((key, value) => MapEntry(value.name.trim().toLowerCase(), value));

    late Set<TagData> tags;

    switch (tagType) {
      case .recipe:
        final recipeImportState = await ref.watch(
          recipeImportScreenProvider(path).future,
        );
        tags = recipeImportState.selectedRecipes
            .expand((element) => importData.tagsPerRecipe[element.id]!)
            .toSet();
        break;
      case .grocery:
        tags = {};

        final groceryImportState = await ref.watch(
          groceryImportScreenProvider(path).future,
        );
        for (final entry in groceryImportState.entries) {
          if (entry.value == null) {
            final groceryTags = importData.tagsPerGrocery[entry.key];
            if (groceryTags != null) {
              tags.addAll(groceryTags);
            }
          }
        }
        break;
    }

    final tagLookup = <String, TagData>{};
    final mappedTags = <String, TagData?>{};

    for (final tag in tags) {
      tagLookup[tag.id] = tag;

      final nameHit = localTagNameLookup[tag.name.trim().toLowerCase()];

      if (nameHit?.tagType == tag.tagType) {
        mappedTags[tag.id] = nameHit;
      } else {
        mappedTags[tag.id] = null;
      }
    }

    return TagImportScreenState(tagLookup: tagLookup, mappedTags: mappedTags);
  }

  void selectTag(String origin, TagData? tagData) {
    final currentState = state.value!;
    final currentMapped = Map<String, TagData?>.from(currentState.mappedTags);

    state = AsyncValue.data(
      currentState.copyWith(mappedTags: currentMapped..[origin] = tagData),
    );
  }

  void delete(String origin) {
    final currentState = state.value!;
    final currentMapped = Map<String, TagData?>.from(currentState.mappedTags);

    state = AsyncValue.data(
      currentState.copyWith(mappedTags: currentMapped..remove(origin)),
    );
  }

  void refresh() => ref.invalidateSelf();
}
