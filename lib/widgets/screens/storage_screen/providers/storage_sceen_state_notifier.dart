import 'package:random_string/random_string.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/filtered_grocery_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/tags_per_grocery_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_sceen_state_notifier.g.dart';

@riverpod
Future<StorageScreenState> storageScreenStateNotifier(Ref ref) async {
  final quickFilters = ref.watch(quickFilterProvider(TagTypeEnum.grocery));
  final cluster = quickFilters[QuickFilters.cluster] ?? false;

  final inStorage = await ref.watch(storageProvider.future);
  final groceries = await ref.watch(filteredGroceryProvider.future);

  StorageData getStorageData(GroceryData grocery) =>
      inStorage[grocery.id] ??
      StorageData(
        id: randomAlphaNumeric(16),
        ingredient: IngredientData(
          id: randomAlphaNumeric(16),
          amount: 0,
          unit: grocery.unit,
          groceryId: grocery.id,
        ),
      );

  final List<StorageData> storageData = [];
  final Map<String, List<StorageData>> clusteredData = {};

  if (cluster) {
    final tagLookup = await ref.watch(tagsPerGroceryProvider.future);

    for (final grocery in groceries.values) {
      final tags = tagLookup[grocery.id] ?? {};

      if (tags.isEmpty) {
        storageData.add(getStorageData(grocery));
      } else {
        for (final tag in tags) {
          final clusteredStorage = clusteredData.putIfAbsent(tag.id, () => []);
          clusteredStorage.add(getStorageData(grocery));
        }
      }
    }
  } else {
    storageData.addAll(groceries.values.map(getStorageData));
  }

  return StorageScreenState(
    inStorage: inStorage,
    storageData: storageData,
    clusteredData: clusteredData,
    groceries: await ref.watch(groceryProvider.future),
    tags: await ref.watch(tagProvider.future),
  );
}

class StorageScreenState {
  StorageScreenState({
    required this.inStorage,
    required this.clusteredData,
    required this.storageData,
    required this.groceries,
    required this.tags,
  });

  final Map<String, StorageData> inStorage;
  final Map<String, List<StorageData>> clusteredData;
  final List<StorageData> storageData;
  final Map<String, GroceryData> groceries;
  final Map<String, TagData> tags;
}
