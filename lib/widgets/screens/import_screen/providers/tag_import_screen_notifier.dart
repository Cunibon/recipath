import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_data_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_import_screen_notifier.g.dart';

@riverpod
class TagImportScreenNotifier extends _$TagImportScreenNotifier {
  @override
  Future<Map<String, TagData?>> build(String path) async {
    final recipeImportState = await ref.watch(
      recipeImportScreenProvider(path).future,
    );
    final importData = await ref.watch(importDataProvider(path).future);

    final localTagNameLookup = (await ref.watch(
      tagProvider.future,
    )).map((key, value) => MapEntry(value.name.trim().toLowerCase(), value));

    final tags = recipeImportState.selectedRecipes
        .expand((element) => importData.tagsPerRecipe[element.id]!)
        .toSet();
    final tagLookup = <String, TagData?>{};

    for (final tag in tags) {
      tagLookup[tag.id] = localTagNameLookup[tag.name.trim().toLowerCase()];
    }

    return tagLookup;
  }

  void selectTag(String origin, TagData? tagData) {
    final currentState = state.value!;
    final currentLookup = Map<String, TagData?>.from(currentState);

    state = AsyncValue.data(currentLookup..[origin] = tagData);
  }
}
