import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/repos/recipe/recipe_repo_notifier.dart';
import 'package:recipath/widgets/filtering/tag_filter_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_recipe_notifier.g.dart';

@riverpod
Stream<Map<String, RecipeData>> filteredRecipeNotifier(Ref ref) => ref
    .watch(recipeRepoProvider)
    .streamFiltered(ref.watch(tagFilterProvider(TagTypeEnum.recipe)));
