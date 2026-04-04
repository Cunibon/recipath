import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/repos/grocery/grocery_repo_notifier.dart';
import 'package:recipath/widgets/filtering/tag_filter_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_grocery_notifier.g.dart';

@riverpod
Stream<Map<String, GroceryData>> filteredGroceryNotifier(Ref ref) => ref
    .watch(groceryRepoProvider)
    .streamFiltered(ref.watch(tagFilterProvider(TagTypeEnum.grocery)));
