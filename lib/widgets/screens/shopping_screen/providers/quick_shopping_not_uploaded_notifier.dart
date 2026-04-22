import 'package:recipath/repos/quick_shopping/quick_shopping_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quick_shopping_not_uploaded_notifier.g.dart';

@riverpod
Stream<bool> quickShoppingNotUploadedNotifier(Ref ref) =>
    ref.watch(quickShoppingRepoProvider).hasNotUploaded();
