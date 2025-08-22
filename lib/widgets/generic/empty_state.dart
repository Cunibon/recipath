import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({this.iconSize = 50, this.hint, super.key});

  final double iconSize;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.block, size: iconSize),
        Text(
          AppLocalizations.of(context)!.nothingToSee,
          style: theme.textTheme.bodyLarge,
        ),
        if (hint != null)
          Flexible(
            child: Text(
              "($hint)",
              style: TextStyle(color: theme.colorScheme.primary),
            ),
          ),
      ],
    );
  }
}
