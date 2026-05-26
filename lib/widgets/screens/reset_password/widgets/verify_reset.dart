import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/domain_service/syncing_service/syncing_service/syncing_service_notifier.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/providers/revenue_cat/revenue_customer_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerifyReset extends ConsumerStatefulWidget {
  const VerifyReset({required this.email, required this.onConfirm, super.key});

  final String email;
  final VoidCallback onConfirm;

  @override
  ConsumerState<VerifyReset> createState() => _VerifyResetState();
}

class _VerifyResetState extends ConsumerState<VerifyReset> {
  final optAuthMutation = Mutation<AuthResponse>();

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
            final response = await optAuthMutation.run(ref, (
              transaction,
            ) async {
              final response = await transaction
                  .get(supabaseClientProvider)
                  .auth
                  .verifyOTP(
                    email: widget.email,
                    token: otpController.text.trim(),
                    type: OtpType.recovery,
                  );

              if (response.session != null) {
                await transaction
                    .get(revenueCustomerProvider.notifier)
                    .login(response.user!.id);
                unawaited(transaction.get(syncingServiceProvider).reset());
              }

              return response;
            });

            if (response.session != null) {
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
