import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_sceen_state_notifier.g.dart';

@riverpod
Future<StorageScreenState> storageScreenStateNotifier(Ref ref) async {
  final inStorage = await ref.watch(storageNotifierProvider.future);
  final groceries = await ref.watch(groceryNotifierProvider.future);

  final storageData = groceries.values
      .map(
        (e) =>
            inStorage[e.id] ??
            StorageData(
              id: randomAlphaNumeric(16),
              ingredient: IngredientData(
                id: randomAlphaNumeric(16),
                amount: 0,
                unit: e.unit,
                groceryId: e.id,
              ),
            ),
      )
      .toList();

  return StorageScreenState(
    inStorage: inStorage,
    storageData: storageData,
    groceries: await ref.watch(groceryNotifierProvider.future),
  );
}

class StorageScreenState {
  StorageScreenState({
    required this.inStorage,
    required this.storageData,
    required this.groceries,
  });

  final Map<String, StorageData> inStorage;
  final List<StorageData> storageData;
  final Map<String, GroceryData> groceries;
}
