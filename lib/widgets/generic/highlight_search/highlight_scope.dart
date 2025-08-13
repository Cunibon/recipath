import 'package:flutter/cupertino.dart';

class HighlightScope extends InheritedWidget {
  final String highlightTerm;

  const HighlightScope({
    super.key,
    required this.highlightTerm,
    required super.child,
  });

  static HighlightScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HighlightScope>();
  }

  @override
  bool updateShouldNotify(HighlightScope oldWidget) =>
      highlightTerm != oldWidget.highlightTerm;
}
