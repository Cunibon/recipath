import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/repos/grocery/grocery_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_notifier.g.dart';

@riverpod
Stream<IMap<String, GroceryData>> groceryNotifier(Ref ref) =>
    ref.watch(groceryRepoProvider).stream();
