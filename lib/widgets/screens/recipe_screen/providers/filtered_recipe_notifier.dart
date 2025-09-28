import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/repos/recipe/recipe_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_recipe_notifier.g.dart';

@riverpod
Stream<Map<String, RecipeData>> filteredRecipeNotifier(Ref ref) =>
    ref.watch(recipeRepoProvider).stream();
