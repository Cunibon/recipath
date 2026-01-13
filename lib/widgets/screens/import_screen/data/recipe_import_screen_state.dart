import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';

part 'recipe_import_screen_state.freezed.dart';

@freezed
abstract class RecipeImportScreenState with _$RecipeImportScreenState {
  const factory RecipeImportScreenState({
    required String path,
    required List<RecipeData> selectedRecipes,
  }) = _RecipeImportScreenState;
}
