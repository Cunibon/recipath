import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/data/tag_data/tag_type_enum.dart';
import 'package:recipath/repos/shopping/shopping_repo_notifier.dart';
import 'package:recipath/widgets/filtering/tag_filter_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_shopping_notifier.g.dart';

@riverpod
Stream<Map<String, ShoppingData>> filteredShoppingNotifier(Ref ref) => ref
    .watch(shoppingRepoProvider)
    .streamFiltered(ref.watch(tagFilterProvider(TagTypeEnum.grocery)));
