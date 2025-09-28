import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/average_recipe_time_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/tags_per_recipe_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'compact_recipe_item_notifier.g.dart';

@riverpod
Future<CompactRecipeItemState> compactRecipeItemNotifier(
  Ref ref,
  RecipeData recipe,
) async {
  final averageTime = await ref.watch(
    averageRecipeTimeProvider(recipe.id).future,
  );
  final groceries = await ref.watch(groceryProvider.future);
  final tags = await ref.watch(
    tagsPerRecipeProvider.selectAsync((data) => data[recipe.id] ?? {}),
  );

  return CompactRecipeItemState(
    averageTime: averageTime,
    groceryMap: groceries,
    tags: tags,
  );
}

class CompactRecipeItemState {
  CompactRecipeItemState({
    required this.averageTime,
    required this.groceryMap,
    required this.tags,
  });

  final Duration? averageTime;
  final Map<String, GroceryData> groceryMap;
  final Set<TagData> tags;
}
