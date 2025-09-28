import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';

class ChangeTagsButton extends StatelessWidget {
  const ChangeTagsButton({required this.onTap, super.key});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.add), Text(localization.changeTags)],
          ),
        ),
      ),
    );
  }
}
