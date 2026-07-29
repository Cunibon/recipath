import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_screen_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'export_notifier.g.dart';

@riverpod
class ExportNotifier extends _$ExportNotifier {
  @override
  List<String>? build() => null;

  Future<void> start() async => state = (await ref.read(
    recipeScreenProvider.future,
  )).recipe.map((e) => e.recipeData.id).toList();

  void toggleRecipe(RecipeData data) {
    final stateCopy = List<String>.from(state ?? []);

    if (stateCopy.contains(data.id)) {
      stateCopy.remove(data.id);
    } else {
      stateCopy.add(data.id);
    }

    state = stateCopy;
  }

  void clear() {
    state = null;
  }
}
