import 'package:localstorage/localstorage.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tutorial_notifier.g.dart';

@riverpod
class TutorialNotifier extends _$TutorialNotifier {
  static const tutorialKey = "tutorialKey";

  @override
  List<String> build() =>
      localStorage.get<List<dynamic>>(tutorialKey)?.cast<String>() ??
      <String>[];

  void set(String pageName) {
    localStorage.set(tutorialKey, state..add(pageName));

    ref.invalidateSelf();
  }
}
