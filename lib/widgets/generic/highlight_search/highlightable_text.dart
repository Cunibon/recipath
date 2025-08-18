import 'package:flutter/material.dart';
import 'package:recipath/widgets/generic/highlight_search/highlight_scope.dart';

class HighlightableText extends StatelessWidget {
  const HighlightableText(this.text, {this.style, super.key});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final highlight = HighlightScope.of(context)?.highlightTerm ?? '';
    if (highlight.isEmpty) return Text(text, style: style);

    final regex = RegExp(RegExp.escape(highlight), caseSensitive: false);
    final matches = regex.allMatches(text);

    if (matches.isEmpty) return Text(text, style: style);

    final highlightColor = Theme.of(
      context,
    ).colorScheme.surfaceContainerHighest;

    final spans = <TextSpan>[];
    int currentIndex = 0;

    for (final match in matches) {
      if (match.start > currentIndex) {
        spans.add(TextSpan(text: text.substring(currentIndex, match.start)));
      }

      spans.add(
        TextSpan(
          text: match.group(0),
          style: TextStyle(backgroundColor: highlightColor),
        ),
      );

      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      spans.add(TextSpan(text: text.substring(currentIndex)));
    }

    return Text.rich(TextSpan(children: spans), style: style);
  }
}
