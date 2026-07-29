import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/reset_password/widgets/reset_password_content.dart';
import 'package:recipath/widgets/screens/settings_screen/data/change_password_mutation.dart';

class ResetPassword extends ConsumerStatefulWidget {
  const ResetPassword({required this.onConfirm, super.key});

  final VoidCallback onConfirm;

  @override
  ConsumerState<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends ConsumerState<ResetPassword> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final changeStatus = ref.watch(changePasswordMutation);

    Widget? errorWidget;

    if (changeStatus.hasError) {
      errorWidget = Text(
        localization.somethingWentWrong,
        style: TextTheme.of(
          context,
        ).bodyMedium?.copyWith(color: ColorScheme.of(context).error),
      );
    }

    return Column(
      spacing: 8,
      mainAxisSize: .min,
      children: [
        Text(
          localization.changePassword,
          style: TextTheme.of(context).titleLarge,
        ),
        Form(
          key: formKey,
          child: ResetPasswordContent(
            errorWidget: errorWidget,
            passwordController: passwordController,
          ),
        ),
        Row(
          mainAxisAlignment: .end,
          children: [
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState?.validate() == true) {
                  TextInput.finishAutofillContext();

                  await changePasswordMutation.run(
                    ref,
                    passwordController.text,
                  );

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(localization.passwordChanged)),
                    );
                    widget.onConfirm();
                  }
                }
              },
              child: changeStatus is MutationPending
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    )
                  : Text(localization.changePassword),
            ),
          ],
        ),
      ],
    );
  }
}
