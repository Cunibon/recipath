import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/widgets/filtering/tag_filter_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/tags_per_grocery_provider.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/quick_filter_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/data/shopping_item_data.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/filtered_shopping_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/quick_shopping_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_screen_state_notifier.g.dart';

@riverpod
Future<ShoppingScreenState> shoppingScreenStateNotifier(Ref ref) async {
  final quickFilters = ref.watch(quickFilterProvider(TagTypeEnum.grocery));
  final cluster = quickFilters[QuickFilters.cluster] ?? false;

  final tagFiltersActive = ref.watch(
    tagFilterProvider(TagTypeEnum.grocery).select((e) => e.isNotEmpty),
  );

  final shoppingData = await ref.watch(filteredShoppingProvider.future);
  final quickShoppingData = await ref.watch(quickShoppingProvider.future);

  final Map<String, List<BaseShoppingItemData>> clusteredData = {};

  final doneList = clusteredData.putIfAbsent(
    ShoppingTypeEnum.done.name,
    () => [],
  );

  if (cluster) {
    final tagLookup = await ref.watch(tagsPerGroceryProvider.future);

    for (final shoppingItem in shoppingData.values) {
      if (shoppingItem.done) {
        doneList.add(ShoppingItemData(data: shoppingItem));
      } else {
        final tags = tagLookup[shoppingItem.ingredient.groceryId] ?? {};

        if (tags.isEmpty) {
          final shoppingList = clusteredData.putIfAbsent(
            ShoppingTypeEnum.normal.name,
            () => [],
          );
          shoppingList.add(ShoppingItemData(data: shoppingItem));
        } else {
          for (final tag in tags) {
            final shoppingList = clusteredData.putIfAbsent(tag.id, () => []);
            shoppingList.add(ShoppingItemData(data: shoppingItem));
          }
        }
      }
    }
  } else {
    final shoppingList = clusteredData.putIfAbsent(
      ShoppingTypeEnum.normal.name,
      () => [],
    );
    for (final shoppingItem in shoppingData.values) {
      final data = ShoppingItemData(data: shoppingItem);
      if (shoppingItem.done) {
        doneList.add(data);
      } else {
        shoppingList.add(data);
      }
    }
  }

  if (quickShoppingData.isNotEmpty && !tagFiltersActive) {
    final quickShoppingList = clusteredData.putIfAbsent(
      ShoppingTypeEnum.quick.name,
      () => [],
    );

    for (final shoppingItem in quickShoppingData.values) {
      final data = QuickShoppingItemData(data: shoppingItem);
      if (shoppingItem.done) {
        doneList.add(data);
      } else {
        quickShoppingList.add(data);
      }
    }
  }

  return ShoppingScreenState(
    clusteredData: clusteredData,
    groceryMap: await ref.watch(groceryProvider.future),
    storage: await ref.watch(storageProvider.future),
    tags: await ref.watch(tagProvider.future),
    tagFiltersActive: tagFiltersActive,
  );
}

class ShoppingScreenState {
  ShoppingScreenState({
    required this.clusteredData,
    required this.groceryMap,
    required this.storage,
    required this.tags,
    required this.tagFiltersActive,
  });

  final Map<String, List<BaseShoppingItemData>> clusteredData;
  final Map<String, GroceryData> groceryMap;
  final Map<String, StorageData> storage;
  final Map<String, TagData> tags;
  final bool tagFiltersActive;
}
