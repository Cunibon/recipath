import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_user.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_service_notifier.dart';
import 'package:recipath/widgets/providers/subscription/pro_notifier.dart';

class VerifyReset extends ConsumerStatefulWidget {
  const VerifyReset({required this.email, required this.onConfirm, super.key});

  final String email;
  final VoidCallback onConfirm;

  @override
  ConsumerState<VerifyReset> createState() => _VerifyResetState();
}

class _VerifyResetState extends ConsumerState<VerifyReset> {
  final optAuthMutation = Mutation<AuthUser?>();

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final mutationState = ref.watch(optAuthMutation);

    return Column(
      mainAxisSize: .min,
      spacing: 8,
      children: [
        Text(
          localization.resetMailSent,
          style: TextTheme.of(context).bodyMedium,
        ),
        TextField(
          controller: otpController,
          style: TextTheme.of(context).titleLarge,
          textAlign: .center,
        ),
        ElevatedButton(
          onPressed: () async {
            final user = await optAuthMutation.run(ref, (transaction) async {
              final authService = await transaction.get(
                authServiceProvider.future,
              );
              final user = await authService.verifyPasswordReset(
                email: widget.email,
                token: otpController.text.trim(),
              );

              if (user != null) {
                await transaction.get(proProvider.notifier).login(user.id);
                unawaited(transaction.get(syncingServiceProvider).reset());
              }

              return user;
            });

            if (user != null) {
              widget.onConfirm();
            }
          },
          child: mutationState is MutationPending
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                )
              : Text(localization.actionContinue),
        ),
      ],
    );
  }
}
