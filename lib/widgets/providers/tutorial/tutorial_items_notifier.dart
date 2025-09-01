import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/providers/tutorial/tutorial_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tutorial_items_notifier.g.dart';

@Riverpod(keepAlive: true)
TutorialItems tutorialItemsNotifier(Ref ref, String identifier) =>
    TutorialItems(
      finish: () => ref.read(tutorialNotifierProvider.notifier).set(identifier),
      destroy: () => ref.invalidateSelf(),
    );

class TutorialItems {
  TutorialItems({required this.finish, required this.destroy});

  final void Function() finish;
  final void Function() destroy;

  final List<GlobalKey> _items = [];

  void add(GlobalKey key) {
    _items.add(key);
  }

  void remove(GlobalKey key) {
    _items.remove(key);
    if (_items.isEmpty) {
      destroy();
    }
  }

  List<GlobalKey> ingest() {
    finish();
    destroy();
    return _items;
  }
}
