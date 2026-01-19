import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/tag_data/tag_data.dart';

part 'import_data.freezed.dart';

@freezed
abstract class ImportData with _$ImportData {
  const factory ImportData({
    required List<RecipeData> recipes,
    required Map<String, GroceryData> groceries,
    required Map<String, Set<TagData>> tagsPerRecipe,
  }) = _ImportData;
}
