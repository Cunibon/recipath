import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/common.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_service_notifier.dart';

class ConfirmReset extends ConsumerStatefulWidget {
  const ConfirmReset({required this.onConfirm, super.key});

  final Function(String email) onConfirm;

  @override
  ConsumerState<ConfirmReset> createState() => _ConfirmResetState();
}

class _ConfirmResetState extends ConsumerState<ConfirmReset> {
  final formKey = GlobalKey<FormState>();
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
        Form(
          key: formKey,
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.username],
            decoration: InputDecoration(hintText: localization.eMail),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization.addEMail;
              }
              if (!emailRegex.hasMatch(value)) {
                return localization.objectInvalid(localization.eMail);
              }
              return null;
            },
          ),
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
                if (formKey.currentState?.validate() != true) return;

                await sendEmailMutation.run(ref, (transaction) async {
                  final authService = await transaction.get(
                    authServiceProvider.future,
                  );

                  await authService.sendPasswordReset(emailController.text);
                });
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
