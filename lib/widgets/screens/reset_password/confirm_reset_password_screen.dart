import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/screens/reset_password/widgets/confirm_reset.dart';

enum ResetStage { confirm, verify, reset }

class ConfirmResetPasswordScreen extends ConsumerStatefulWidget {
  const ConfirmResetPasswordScreen({super.key});

  @override
  ConsumerState<ConfirmResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends ConsumerState<ConfirmResetPasswordScreen> {
  ResetStage stage = .confirm;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.go(RootRoutes.recipeRoute.path),
        ),
        title: Text(
          localization.resetPassword,
          style: TextTheme.of(context).titleLarge,
        ),
      ),
      body: Center(
        child: switch (stage) {
          .confirm => ConfirmReset(
            onConfirm: () => setState(() => stage = .verify),
          ),
          .verify => ConfirmReset(
            onConfirm: () => setState(() => stage = .verify),
          ),
          .reset => ConfirmReset(
            onConfirm: () => setState(() => stage = .verify),
          ),
        },
      ),
    );
  }
}
