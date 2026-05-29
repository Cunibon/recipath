import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/shopping_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_groceries_notifier.g.dart';

@riverpod
Future<ISet<String>> shoppingGroceriesNotifier(Ref ref) async {
  final shoppingData = await ref.watch(shoppingProvider.future);

  return ISet(shoppingData.values.map((e) => e.ingredient.groceryId));
}
