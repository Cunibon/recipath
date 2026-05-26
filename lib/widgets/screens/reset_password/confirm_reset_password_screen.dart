import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/screens/reset_password/widgets/confirm_reset.dart';
import 'package:recipath/widgets/screens/reset_password/widgets/reset_password.dart';
import 'package:recipath/widgets/screens/reset_password/widgets/verify_reset.dart';

enum ResetStage { confirm, verify, reset }

class ConfirmResetPasswordScreen extends ConsumerStatefulWidget {
  const ConfirmResetPasswordScreen({super.key});

  @override
  ConsumerState<ConfirmResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends ConsumerState<ConfirmResetPasswordScreen> {
  String? email;
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: switch (stage) {
            .confirm => ConfirmReset(
              onConfirm: (email) => setState(() {
                this.email = email;
                stage = .verify;
              }),
            ),
            .verify => VerifyReset(
              email: email!,
              onConfirm: () => setState(() => stage = .reset),
            ),
            .reset => ResetPassword(
              onConfirm: () => context.go(RootRoutes.recipeRoute.path),
            ),
          },
        ),
      ),
    );
  }
}
