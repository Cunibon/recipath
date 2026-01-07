import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';

part 'import_screen_state.freezed.dart';

@freezed
abstract class ImportScreenState with _$ImportScreenState {
  const factory ImportScreenState({
    required String path,
    required List<RecipeData> originalRecipe,
    required Map<String, GroceryData> originalGrocery,
    required List<RecipeData> importRecipe,
  }) = _ImportScreenState;
}
