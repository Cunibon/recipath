import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/filtered_grocery_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/tags_per_grocery_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/shopping_groceries_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_sceen_state_notifier.g.dart';

@riverpod
Future<StorageScreenState> storageScreenStateNotifier(Ref ref) async {
  final quickFilters = ref.watch(quickFilterProvider(TagTypeEnum.grocery));
  final cluster = quickFilters[QuickFilters.cluster] ?? false;
  final shopping = quickFilters[QuickFilters.shopping] ?? false;

  final inStorage = await ref.watch(storageProvider.future);
  final groceries = await ref.watch(filteredGroceryProvider.future);
  final shoppingData = await ref.watch(shoppingGroceriesProvider.future);

  final Map<String?, List<StorageData>> clusteredData = {};

  if (cluster) {
    final tagLookup = await ref.watch(tagsPerGroceryProvider.future);

    for (final grocery in groceries.values) {
      if (shopping && !shoppingData.contains(grocery.id)) {
        continue;
      }

      final tags = tagLookup[grocery.id] ?? {};

      if (tags.isEmpty) {
        final clusteredStorage = clusteredData.putIfAbsent(null, () => []);
        clusteredStorage.add(
          inStorage[grocery.id] ?? StorageData.fromGrocery(grocery),
        );
      } else {
        for (final tag in tags) {
          final clusteredStorage = clusteredData.putIfAbsent(tag.id, () => []);
          clusteredStorage.add(
            inStorage[grocery.id] ?? StorageData.fromGrocery(grocery),
          );
        }
      }
    }
  } else {
    final clusteredStorage = clusteredData.putIfAbsent(null, () => []);

    for (final grocery in groceries.values) {
      if (shopping && !shoppingData.contains(grocery.id)) {
        continue;
      }
      clusteredStorage.add(
        inStorage[grocery.id] ?? StorageData.fromGrocery(grocery),
      );
    }
  }

  return StorageScreenState(
    inStorage: inStorage,
    clusteredData: clusteredData,
    groceries: await ref.watch(groceryProvider.future),
    tags: await ref.watch(tagProvider.future),
  );
}

class StorageScreenState {
  StorageScreenState({
    required this.inStorage,
    required this.clusteredData,
    required this.groceries,
    required this.tags,
  });

  final IMap<String, StorageData> inStorage;
  final Map<String?, List<StorageData>> clusteredData;
  final IMap<String, GroceryData> groceries;
  final IMap<String, TagData> tags;
}
