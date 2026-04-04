import 'package:recipath/data/grocery_tag_data/grocery_tag_data.dart';
import 'package:recipath/repos/grocery_tag/grocery_tag_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_tags_notifier.g.dart';

@riverpod
Stream<Map<String, GroceryTagData>> groceryTagsNotifier(Ref ref) =>
    ref.watch(groceryTagRepoProvider).stream();
