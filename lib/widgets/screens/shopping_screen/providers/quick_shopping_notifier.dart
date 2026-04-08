import 'package:recipath/data/quick_shopping_data/quick_shopping_data.dart';
import 'package:recipath/repos/quick_shopping/quick_shopping_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quick_shopping_notifier.g.dart';

@riverpod
Stream<Map<String, QuickShoppingData>> quickShoppingNotifier(Ref ref) =>
    ref.watch(quickShoppingRepoProvider).stream();
