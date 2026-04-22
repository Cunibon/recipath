import 'package:recipath/repos/grocery/grocery_repo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grocery_not_uploaded_notifier.g.dart';

@riverpod
Stream<bool> groceryNotUploadedNotifier(Ref ref) =>
    ref.watch(groceryRepoProvider).hasNotUploaded();
