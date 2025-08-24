import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/storage_data/storage_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/storage_screen/providers/storage_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'compact_ingredient_view_notifier.g.dart';

@riverpod
Future<CompactIngredientViewState> compactIngredientViewNotifier(
  Ref ref,
) async => CompactIngredientViewState(
  groceryMap: await ref.watch(groceryNotifierProvider.future),
  storage: await ref.watch(storageNotifierProvider.future),
);

class CompactIngredientViewState {
  CompactIngredientViewState({required this.groceryMap, required this.storage});

  final Map<String, GroceryData> groceryMap;
  final Map<String, StorageData> storage;
}
