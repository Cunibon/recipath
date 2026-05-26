import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/screens/reset_password/widgets/reset_password_content.dart';
import 'package:recipath/widgets/screens/settings_screen/data/change_password_mutation.dart';

class ChangePasswordDialog extends ConsumerStatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  ConsumerState<ChangePasswordDialog> createState() =>
      _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends ConsumerState<ChangePasswordDialog> {
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

    final changeStatus = ref.watch(changePasswordMutation.mutation);

    Widget? errorWidget;

    if (changeStatus.hasError) {
      errorWidget = Text(
        localization.somethingWentWrong,
        style: TextTheme.of(
          context,
        ).bodyMedium?.copyWith(color: ColorScheme.of(context).error),
      );
    }

    return AlertDialog(
      title: Text(localization.changePassword),
      content: Form(
        key: formKey,
        child: ResetPasswordContent(
          errorWidget: errorWidget,
          passwordController: passwordController,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            if (formKey.currentState?.validate() == true) {
              TextInput.finishAutofillContext();

              await changePasswordMutation.run(ref, passwordController.text);

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(localization.passwordChanged)),
                );
                context.pop();
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
    );
  }
}
