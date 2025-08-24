import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/shopping_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_screen_state_notifier.g.dart';

@riverpod
Future<ShoppingScreenState> shoppingScreenStateNotifier(Ref ref) async =>
    ShoppingScreenState(
      shoppingData: await ref.watch(shoppingNotifierProvider.future),
      groceryMap: await ref.watch(groceryNotifierProvider.future),
      storage: await ref.watch(storageNotifierProvider.future),
    );

class ShoppingScreenState {
  ShoppingScreenState({
    required this.shoppingData,
    required this.groceryMap,
    required this.storage,
  });

  final Map<String, ShoppingData> shoppingData;
  final Map<String, GroceryData> groceryMap;
  final Map<String, StorageData> storage;
}
