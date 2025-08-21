import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/shopping_data/shopping_data.dart';
import 'package:recipath/repos/shopping/shopping_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_notifier.g.dart';

@riverpod
Stream<Map<String, ShoppingData>> shoppingNotifier(Ref ref) =>
    ref.watch(shoppingRepoNotifierProvider).stream();
