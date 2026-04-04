import 'package:recipath/widgets/screens/grocery_screen/data/grocery_item_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/filtered_grocery_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/tags_per_grocery_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_screen_notifier.g.dart';

@riverpod
Future<List<GroceryItemData>> groceryScreenNotifier(Ref ref) async {
  final groceryData = await ref.watch(filteredGroceryProvider.future);
  return [
    for (final grocery in groceryData.values)
      GroceryItemData(
        groceryData: grocery,
        tags: await ref.watch(
          tagsPerGroceryProvider.selectAsync((data) => data[grocery.id] ?? {}),
        ),
      ),
  ];
}
