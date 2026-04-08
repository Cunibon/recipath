import 'package:recipath/repos/shopping/shopping_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shopping_not_uploaded_notifier.g.dart';

@riverpod
Stream<bool> shoppingNotUploadedNotifier(Ref ref) =>
    ref.watch(shoppingRepoProvider).hasNotUploaded();
