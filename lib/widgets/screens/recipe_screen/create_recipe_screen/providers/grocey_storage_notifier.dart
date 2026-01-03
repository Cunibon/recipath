import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocey_storage_notifier.g.dart';

@riverpod
Future<GroceryStorageState> groceryStorageNotifier(Ref ref) async =>
    GroceryStorageState(
      groceryMap: await ref.watch(groceryProvider.future),
      storage: await ref.watch(storageProvider.future),
    );

class GroceryStorageState {
  GroceryStorageState({required this.groceryMap, required this.storage});

  final Map<String, GroceryData> groceryMap;
  final Map<String, StorageData> storage;
}
