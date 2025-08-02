import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/data/ingredient_data.dart';
import 'package:recipe_list/repos/storage/storage_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_notifier.g.dart';

@riverpod
Stream<Map<String, IngredientData>> storageNotifier(Ref ref) =>
    ref.watch(storageRepoNotifierProvider).stream();
