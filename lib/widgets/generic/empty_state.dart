import 'package:flutter/material.dart';
import 'package:recipath/gen/assets.gen.dart';
import 'package:recipath/l10n/app_localizations.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({this.iconSize = 70, this.hint, this.onTap, super.key});

  final double iconSize;
  final String? hint;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.images.empty.image(
                width: iconSize,
                height: iconSize,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.none,
              ),
              Text(
                AppLocalizations.of(context)!.nothingToSee,
                style: theme.textTheme.bodyLarge,
              ),
              if (hint != null)
                Flexible(
                  child: Text(
                    hint!,
                    style: TextStyle(color: theme.colorScheme.primary),
                    textAlign: .center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
