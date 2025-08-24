import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_sceen_state_notifier.g.dart';

@riverpod
Future<StorageScreenState> storageScreenStateNotifier(Ref ref) async =>
    StorageScreenState(
      storage: await ref.watch(storageNotifierProvider.future),
      groceries: await ref.watch(groceryNotifierProvider.future),
    );

class StorageScreenState {
  StorageScreenState({required this.storage, required this.groceries});

  final Map<String, StorageData> storage;
  final Map<String, GroceryData> groceries;
}
