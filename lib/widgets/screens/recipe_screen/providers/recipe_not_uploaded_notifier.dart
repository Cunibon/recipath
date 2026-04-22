import 'package:recipath/repos/recipe/recipe_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_not_uploaded_notifier.g.dart';

@riverpod
Stream<bool> recipeNotUploadedNotifier(Ref ref) =>
    ref.watch(recipeRepoProvider).hasNotUploaded();
