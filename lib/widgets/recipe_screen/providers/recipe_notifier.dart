import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/recipe_data.dart';
import 'package:recipe_list/repos/recipe/recipe_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_notifier.g.dart';

@riverpod
Stream<Map<String, RecipeData>> recipeNotifier(Ref ref) =>
    ref.watch(recipeRepoNotifierProvider).stream();
