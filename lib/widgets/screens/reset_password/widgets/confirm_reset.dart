import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';

class ConfirmReset extends StatelessWidget {
  const ConfirmReset({required this.onConfirm, super.key});

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: .min,
      spacing: 8,
      children: [
        Text(
          localization.reallyResetPassword,
          style: TextTheme.of(context).bodyMedium,
        ),
        Row(
          mainAxisAlignment: .end,
          children: [
            TextButton(
              onPressed: () => context.go(RootRoutes.recipeRoute.path),
              child: Text(localization.actionCancel),
            ),
            ElevatedButton(onPressed: onConfirm, child: child),
          ],
        ),
      ],
    );
  }
}
