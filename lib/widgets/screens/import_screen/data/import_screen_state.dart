import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';

part 'import_screen_state.freezed.dart';

@freezed
abstract class ImportScreenState with _$ImportScreenState {
  const factory ImportScreenState({
    required String path,
    required List<RecipeData> selectedRecipes,
  }) = _ImportScreenState;
}
