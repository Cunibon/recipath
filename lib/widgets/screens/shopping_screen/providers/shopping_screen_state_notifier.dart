import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/tags_per_grocery_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/filtered_shopping_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_screen_state_notifier.g.dart';

@riverpod
Future<ShoppingScreenState> shoppingScreenStateNotifier(Ref ref) async {
  final quickFilters = ref.watch(quickFilterProvider(TagTypeEnum.grocery));

  final fullShoppingData = await ref.watch(filteredShoppingProvider.future);

  final cluster = quickFilters[QuickFilters.cluster] ?? false;

  final Map<String, ShoppingData> shoppingData = {};
  final Map<String, Map<String, ShoppingData>> clusteredData = {};

  if (cluster) {
    final tagLookup = await ref.watch(tagsPerGroceryProvider.future);

    for (final shoppingItem in fullShoppingData.values) {
      if (shoppingItem.done) {
        shoppingData[shoppingItem.id] = shoppingItem;
      } else {
        final tags = tagLookup[shoppingItem.ingredient.groceryId] ?? {};

        if (tags.isEmpty) {
          shoppingData[shoppingItem.id] = shoppingItem;
        } else {
          for (final tag in tags) {
            final shoppingLookup = clusteredData.putIfAbsent(tag.id, () => {});
            shoppingLookup[shoppingItem.id] = shoppingItem;
          }
        }
      }
    }
  } else {
    shoppingData.addAll(fullShoppingData);
  }

  return ShoppingScreenState(
    clusteredData: clusteredData,
    shoppingData: shoppingData,
    groceryMap: await ref.watch(groceryProvider.future),
    storage: await ref.watch(storageProvider.future),
    tags: await ref.watch(tagProvider.future),
  );
}

class ShoppingScreenState {
  ShoppingScreenState({
    required this.clusteredData,
    required this.shoppingData,
    required this.groceryMap,
    required this.storage,
    required this.tags,
  });

  final Map<String, Map<String, ShoppingData>> clusteredData;
  final Map<String, ShoppingData> shoppingData;
  final Map<String, GroceryData> groceryMap;
  final Map<String, StorageData> storage;
  final Map<String, TagData> tags;
}
