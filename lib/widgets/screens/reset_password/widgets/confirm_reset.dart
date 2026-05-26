import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/common.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';

class ConfirmReset extends ConsumerStatefulWidget {
  const ConfirmReset({required this.onConfirm, super.key});

  final Function(String email) onConfirm;

  @override
  ConsumerState<ConfirmReset> createState() => _ConfirmResetState();
}

class _ConfirmResetState extends ConsumerState<ConfirmReset> {
  final emailController = TextEditingController();
  final sendEmailMutation = Mutation<void>();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final mutationState = ref.watch(sendEmailMutation);

    return Column(
      mainAxisSize: .min,
      spacing: 8,
      children: [
        Text(
          localization.reallyResetPassword,
          style: TextTheme.of(context).bodyMedium,
        ),
        TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.username],
          decoration: InputDecoration(hintText: localization.eMail),
          validator: (value) {
            if (value != null) {
              if (emailRegex.hasMatch(value)) {
                return null;
              } else {
                return localization.objectInvalid(localization.eMail);
              }
            } else {
              return localization.addEMail;
            }
          },
        ),
        Row(
          mainAxisAlignment: .end,
          children: [
            TextButton(
              onPressed: () => context.go(RootRoutes.recipeRoute.path),
              child: Text(localization.actionCancel),
            ),
            ElevatedButton(
              onPressed: () async {
                await sendEmailMutation.run(
                  ref,
                  (transaction) => transaction
                      .get(supabaseClientProvider)
                      .auth
                      .resetPasswordForEmail(emailController.text),
                );
                widget.onConfirm(emailController.text);
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
        ),
      ],
    );
  }
}
