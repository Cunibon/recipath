import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/repos/recipe/drift/recipe_repo_notifier.dart';
import 'package:recipath/widgets/filtering/filter_types.dart';
import 'package:recipath/widgets/filtering/tag_filter_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_recipe_notifier.g.dart';

@riverpod
Stream<Map<String, RecipeData>> filteredRecipeNotifier(Ref ref) => ref
    .watch(recipeRepoProvider)
    .streamFiltered(ref.watch(tagFilterProvider(FilterTypes.recipe)));
