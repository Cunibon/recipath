import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/widgets/screens/grocery_screen/data/grocery_item_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/filtered_grocery_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/tags_per_grocery_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_screen_notifier.g.dart';

@riverpod
Future<GroceryScreenState> groceryScreenNotifier(Ref ref) async {
  final quickFilters = ref.watch(quickFilterProvider(TagTypeEnum.grocery));
  final cluster = quickFilters[QuickFilters.cluster] ?? false;

  final fullGroceryData = await ref.watch(filteredGroceryProvider.future);

  final List<GroceryItemData> groceryData = [];
  final Map<String, List<GroceryItemData>> clusteredData = {};

  final tagLookup = await ref.watch(tagsPerGroceryProvider.future);

  if (cluster) {
    for (final grocery in fullGroceryData.values) {
      final tags = tagLookup[grocery.id] ?? {};

      if (tags.isEmpty) {
        groceryData.add(
          GroceryItemData(
            groceryData: grocery,
            tags: tagLookup[grocery.id] ?? {},
          ),
        );
      } else {
        for (final tag in tags) {
          final clusteredStorage = clusteredData.putIfAbsent(tag.id, () => []);
          clusteredStorage.add(
            GroceryItemData(
              groceryData: grocery,
              tags: tagLookup[grocery.id] ?? {},
            ),
          );
        }
      }
    }
  } else {
    groceryData.addAll([
      for (final grocery in fullGroceryData.values)
        GroceryItemData(
          groceryData: grocery,
          tags: tagLookup[grocery.id] ?? {},
        ),
    ]);
  }

  return GroceryScreenState(
    clusteredData: clusteredData,
    groceries: groceryData,
    tags: await ref.watch(tagProvider.future),
  );
}

class GroceryScreenState {
  GroceryScreenState({
    required this.clusteredData,
    required this.groceries,
    required this.tags,
  });

  final List<GroceryItemData> groceries;
  final Map<String, List<GroceryItemData>> clusteredData;
  final Map<String, TagData> tags;
}
