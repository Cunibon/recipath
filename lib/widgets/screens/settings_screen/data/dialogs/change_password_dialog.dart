import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
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
        child: AutofillGroup(
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: passwordController,
                autofillHints: const [AutofillHints.newPassword],
                obscureText: true,
                decoration: InputDecoration(hintText: localization.password),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localization.addPassword;
                  }
                  return null;
                },
              ),

              TextFormField(
                obscureText: true,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(
                  hintText: localization.repeatPassword,
                ),
                validator: (value) {
                  if (value != null) {
                    if (value.length >= 12) {
                      if (passwordController.text == value) {
                        return null;
                      } else {
                        return localization.passwordsDontMatch;
                      }
                    } else {
                      return localization.passwordLength;
                    }
                  } else {
                    return localization.addPassword;
                  }
                },
              ),
              ?errorWidget,
            ],
          ),
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
