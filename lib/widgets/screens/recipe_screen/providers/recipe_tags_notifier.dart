import 'package:recipath/data/recipe_tag_data/recipe_tag_data.dart';
import 'package:recipath/repos/recipe_tag/recipe_tag_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_tags_notifier.g.dart';

@riverpod
Stream<Map<String, RecipeTagData>> recipeTagsNotifier(Ref ref) =>
    ref.watch(recipeTagRepoProvider).stream();
