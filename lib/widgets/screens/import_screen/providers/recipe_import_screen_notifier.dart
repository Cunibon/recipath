import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/import_screen/data/import_screen_state.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_data_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_import_screen_notifier.g.dart';

@riverpod
class RecipeImportScreenNotifier extends _$RecipeImportScreenNotifier {
  @override
  Future<ImportScreenState> build(String path) async {
    final importData = await ref.watch(importDataProvider(path).future);

    return ImportScreenState(path: path, selectedRecipes: importData.recipes);
  }

  void toggleRecipe(RecipeData recipe) {
    final currentState = state.value!;
    final currentList = List<RecipeData>.from(currentState.selectedRecipes);

    state = AsyncValue.data(
      currentState.copyWith(
        selectedRecipes: currentList.contains(recipe)
            ? (currentList..remove(recipe))
            : (currentList..add(recipe)),
      ),
    );
  }
}
